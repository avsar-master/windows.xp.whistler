/*++

Copyright (c) 2000-92  Microsoft Corporation

Module Name:

    ConfSet.c

Abstract:

    This header file defines the function prototypes of the temporary
    helper routines to get configuration information from the NT
    configuration files.

Author:

    John Rogers (JohnRo) 26-Nov-2000

Environment:

    Only runs under NT.

Revision History:

    26-Nov-2000 JohnRo
        Created.
    13-Feb-2000 JohnRo
        Added support for using the real Win32 registry.
        Added support for FAKE_PER_PROCESS_RW_CONFIG handling.
    12-Mar-2000 JohnRo
        Changed to only store UNICODE strings in registry.
    31-Mar-2000 JohnRo
        Flush the registry after each create/write.
    06-May-2000 JohnRo
        REG_SZ now implies a UNICODE string, so we can't use REG_USZ anymore.

--*/

#include <nt.h>                 // NT definitions
#include <ntrtl.h>              // NT Rtl structures
#include <nturtl.h>             // NT Rtl structures
#include <windows.h>            // Needed by <configp.h> and <winreg.h>
#include <lmcons.h>             // NET_API_STATUS.
#include <netdebug.h>           // (Needed by config.h)

#include <config.h>             // My prototype, LPNET_CONFIG_HANDLE.
#include <configp.h>            // NET_CONFIG_HANDLE.
#include <debuglib.h>           // IF_DEBUG().
#include <lmapibuf.h>           // NetApiBufferFree().
#include <netlib.h>             // NetpMemoryAllocate(), etc.
#include <tstring.h>            // STRSIZE(), TCHAR_EOS, WCSSIZE(), etc.
#include <wcstr.h>              // wcslen().
#include <winerror.h>           // ERROR_NOT_SUPPORTED, NO_ERROR, etc.

#if defined(USE_WIN32_CONFIG)
#elif defined(FAKE_PER_PROCESS_RW_CONFIG)
#include <netlock.h>            // ACQUIRE_LOCK(), etc.
#else  // NT RTL read-only temporary stuff
#endif  // NT RTL read-only temporary stuff


NET_API_STATUS
NetpSetConfigValue(
    IN LPNET_CONFIG_HANDLE ConfigHandle,
    IN LPTSTR KeyWanted,
    IN LPTSTR Value
    )
{
    NET_CONFIG_HANDLE * lpnetHandle = ConfigHandle;  // conv from opaque type

    NetpAssert( lpnetHandle != NULL );
    NetpAssert( KeyWanted != NULL );
    NetpAssert( *KeyWanted != TCHAR_EOS );
    NetpAssert( Value != NULL );
    NetpAssert( *Value != TCHAR_EOS );

#if defined(USE_WIN32_CONFIG)

    {
        LONG Error;

        //
        // Set the value in the registry.  (In memory, at least.)
        //
        Error = RegSetValueEx(
                lpnetHandle->WinRegKey,   // open handle (to section)
                KeyWanted,                // subkey
                0,
                REG_SZ,                   // type (zero-terminated TCHARs)
                (LPVOID) Value,           // data
                STRSIZE(Value) );         // byte count for data (null char too)
        IF_DEBUG(CONFIG) {
            NetpDbgPrint( "NetpSetConfigValue: RegSetValueEx(" FORMAT_LPTSTR
                    ") to TCHAR '" FORMAT_LPTSTR "' returned " FORMAT_LONG
                    ".\n", KeyWanted, Value, Error );
        }
        NetpAssert( Error == ERROR_SUCCESS );  // BUGBUG

        //
        // Flush the registry to get stuff to disk.
        // BryanWi says that RegCloseKey() doesn't even do this.  Arg!
        //
        Error = RegFlushKey( lpnetHandle->WinRegKey );
        NetpAssert( Error == ERROR_SUCCESS );  // BUGBUG

        return (NO_ERROR);
    }

#elif defined(FAKE_PER_PROCESS_RW_CONFIG)

    NetpAssert( NetpFakePerProcessRWConfigLock != NULL );

    ACQUIRE_LOCK( NetpFakePerProcessRWConfigLock );  // Wait for excl access.

    {
        NET_API_STATUS ApiStatus;
        DWORD KeySize;  // size including null char
        LPTSTR_ARRAY KeyValueArray;
        DWORD OldArraySize, NewArraySize;
        LPTSTR OldValue;

        KeyValueArray = lpnetHandle->FakeRWDataForThisSection->KeyValueArrayPtr;
        NetpAssert( KeyValueArray != NULL );

        OldValue = NetpFindKeyInFakeConfigArray(
                KeyValueArray,
                KeyWanted);

        OldArraySize = NetpTStrArraySize( KeyValueArray );

        if (OldValue == NULL) {  // no match.

            KeySize = STRSIZE(KeyWanted);
            NewArraySize = OldArraySize + KeySize + STRSIZE(Value);

            KeyValueArray = NetpMemoryReallocate(
                    KeyValueArray,
                    NewArraySize);
            if (KeyValueArray == NULL) {
                ApiStatus = ERROR_NOT_ENOUGH_MEMORY;
            } else {
                NetpAddTStrToTStrArray(
                        KeyValueArray,   // dest array
                        KeyWanted);      // src
                NetpAddTStrToTStrArray(
                        KeyValueArray,   // dest array
                        Value);          // src
                lpnetHandle->FakeRWDataForThisSection->KeyValueArrayPtr =
                        KeyValueArray;
                ApiStatus = NO_ERROR;
            }
        } else {
            // BUGBUG: check for dups; del old value; copy; realloc;
            ApiStatus = ERROR_NOT_SUPPORTED;
        }

        IF_DEBUG(CONFIG) {
            NetpDbgPrint( "NetpSetConfigValue: after setting item:\n" );
            NetpDbgDisplayConfigSection( lpnetHandle );
        }

        RELEASE_LOCK( NetpFakePerProcessRWConfigLock );

        return (ApiStatus);

    }

#else  // NT RTL read-only temporary stuff

    //
    // We can't, by definition, do a "set" using the read-only stuff.
    //
    return (ERROR_NOT_SUPPORTED);

#endif  // NT RTL read-only temporary stuff

    /*NOTREACHED*/
}
