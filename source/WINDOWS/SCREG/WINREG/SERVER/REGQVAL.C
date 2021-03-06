/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Regqval.c

Abstract:

    This module contains the server side implementation for the Win32
    Registry query value API. That is:

        - BaseRegQueryValue

Author:

    David J. Gilman (davegi) 27-Nov-2000

Notes:

    See the Notes in Regkey.c.

--*/

#include <rpc.h>
#include "regrpc.h"
#include "localreg.h"


#define DEFAULT_VALUE_SIZE          128
#define DEFAULT_VALUE_NAME_SIZE     64


error_status_t
BaseRegQueryValue(
    IN HKEY hKey,
    IN PUNICODE_STRING lpValueName,
    OUT LPDWORD lpType OPTIONAL,
    OUT LPBYTE lpData OPTIONAL,
    OUT LPDWORD lpcbData  OPTIONAL,
    IN OUT LPDWORD lpcbLen  OPTIONAL
    )

/*++

Routine Description:

    For an open key, given the ID of the value to query, return
    the type, and value.

Arguments:

    hKey - Supplies a handle to the open key.  The value entries returned
        are contained in the key pointed to by this key handle.  Any of the
        predefined reserved handles or a previously opened key handle may be
        used for hKey.

    lpValueName - Supplies a pointer to the name of the value.

    lpType - If present, supplies a pointer to variable to receive the
        type code of value entry.

    lpData -If present, supplies a pointer to a buffer to receive the
        data of the value entry.

    lpcbData - Supplies a pointer to a variable which on input contains
        the size of the buffer lpData points to.  On output, the variable will
        receive the number of bytes returned in lpData.  It must be supplied
        if lpData is, it is ignored otherwise.

    lpcbLen - Return the number of bytes to transmit to the client (used
        by RPC).

Return Value:

    Returns ERROR_SUCCESS (0) for success; error-code for failure.


--*/

{
    NTSTATUS                        Status;
    ULONG                           BufferLength;
    KEY_VALUE_INFORMATION_CLASS     KeyValueInformationClass;
    PVOID                           KeyValueInformation;
    ULONG                           ResultLength;

    BYTE    PrivateKeyValueInformation[ sizeof( KEY_VALUE_PARTIAL_INFORMATION ) +
                                        DEFAULT_VALUE_SIZE ];


    //
    //  If the client gave us a bogus size, patch it.
    //
    if ( ARGUMENT_PRESENT( lpcbData ) && !ARGUMENT_PRESENT( lpData ) ) {
        *lpcbData = 0;
    }


    //
    // Call out to Perflib if the HKEY is HKEY_PERFOMANCE_DATA.
    //

    if(( hKey == HKEY_PERFORMANCE_DATA ) ||
       ( hKey == HKEY_PERFORMANCE_TEXT ) ||
       ( hKey == HKEY_PERFORMANCE_NLSTEXT)) {

        return (error_status_t)PerfRegQueryValue (
                            hKey,
                            lpValueName,
                            NULL,
                            lpType,
                            lpData,
                            lpcbData,
                            lpcbLen
                            );
    }

    ASSERT( IsPredefinedRegistryHandle( hKey ) == FALSE );

    //
    //  Subtract the NULL from the Length. This was added on
    //  the client side so that RPC would transmit it.
    //
    if ( lpValueName->Length > 0 ) {
        lpValueName->Length -= sizeof( UNICODE_NULL );
    }

    //
    //  First we assume that the information we want will fit on
    //  PrivateKeyValueInformattion
    //

    KeyValueInformationClass = ( ARGUMENT_PRESENT( lpcbData ))?
                               KeyValuePartialInformation :
                               KeyValueBasicInformation;


    KeyValueInformation = PrivateKeyValueInformation;
    BufferLength = sizeof( PrivateKeyValueInformation );

    //
    // Query for the necessary information about the supplied value. This
    // may or may not include the data depending on lpcbData as determined
    // above.
    //

    Status = NtQueryValueKey( hKey,
                              lpValueName,
                              KeyValueInformationClass,
                              KeyValueInformation,
                              BufferLength,
                              &ResultLength
                            );

    //
    // A return value of STATUS_BUFFER_TOO_SMALL would mean that there
    // was not enough room for even the known (i.e. fixed length portion)
    // of the structure.
    //

    ASSERT( Status != STATUS_BUFFER_TOO_SMALL );

    if( ( Status == STATUS_BUFFER_OVERFLOW ) &&
        ( !ARGUMENT_PRESENT( lpData ) ) ) {
        //
        //  STATUS_BUFFER_OVERFLOW means that the API returned all the
        //  information in the fixed portion of the structure
        //  KEY_VALUE_BASIC_INFORMATION or KEY_VALUE_PARTIAL_INFORMATION,
        //  but not the value name or the value data.
        //
        //  If KeyValueInformationClass is equal to KeyValueBasicInformation
        //  then the API would return the value name. But since we are not
        //  interested in the value name (it was supplied by the client), we
        //  can assume that the API succeeded.
        //
        //  If KeyValueInformationClass is equal to KeyValuePartialInformation
        //  then the API would return the value data. But lpData == NULL
        //  means that the client is not interested on the value data, but
        //  just on its size. For this reason, we can also assume that the
        //  API succeeded.
        //

        Status = STATUS_SUCCESS;
    }

    if( Status == STATUS_BUFFER_OVERFLOW ) {
        //
        //  The buffer defined in the stack wasn't big enough to hold
        //  the Value information.
        //  If the caller's buffer is big enough to hold the value data
        //  then allocate a new buffer, and call the NT API again.
        //
        if( ( ( KeyValueInformationClass == KeyValuePartialInformation ) &&
              ( ARGUMENT_PRESENT( lpData ) ) &&
              ( *lpcbData >=
                 (( PKEY_VALUE_PARTIAL_INFORMATION )
                 KeyValueInformation )->DataLength
              )
            )
          ) {
            BufferLength = ResultLength;

            KeyValueInformation = RtlAllocateHeap( RtlProcessHeap( ), 0,
                                                   BufferLength
                                                 );
            //
            // If the memory allocation fails, return a Registry error.
            //

            if( ! KeyValueInformation ) {
                return ERROR_OUTOFMEMORY;
            }

            //
            // Query for the necessary information about the supplied value.
            //

            Status = NtQueryValueKey( hKey,
                                      lpValueName,
                                      KeyValueInformationClass,
                                      KeyValueInformation,
                                      BufferLength,
                                      &ResultLength
                                    );
        }
    }


    if( NT_SUCCESS( Status ) &&
        ARGUMENT_PRESENT( lpData ) ) {
        //
        //  If requested, copy the value data
        //
        if( *lpcbData >= (( PKEY_VALUE_PARTIAL_INFORMATION )
                            KeyValueInformation )->DataLength ) {

            RtlMoveMemory( lpData,
                           (( PKEY_VALUE_PARTIAL_INFORMATION )
                                KeyValueInformation )->Data,
                           (( PKEY_VALUE_PARTIAL_INFORMATION )
                                KeyValueInformation )->DataLength
                         );
        } else {
            Status = STATUS_BUFFER_OVERFLOW;
        }
    }


    //
    // Certain information is returned on success or in the case of
    // NtQueryValueKey returning STATUS_BUFFER_OVERFLOW.  This information
    // is always available because we always pass the minimum size required for
    // the NtQueryValueKey API.
    //

    if( NT_SUCCESS( Status ) ||
        ( Status == STATUS_BUFFER_OVERFLOW ) ) {

        if( KeyValueInformationClass == KeyValueBasicInformation ) {

            //
            // If requested, return the value type.
            //

            if( ARGUMENT_PRESENT( lpType )) {

                *lpType = (( PKEY_VALUE_BASIC_INFORMATION )
                            KeyValueInformation )->Type;
            }

        } else {

            //
            // If requested, return the value type.
            //

            if( ARGUMENT_PRESENT( lpType )) {

                *lpType = (( PKEY_VALUE_PARTIAL_INFORMATION )
                            KeyValueInformation )->Type;
            }

            //
            // Return the value data size
            //
            *lpcbData = (( PKEY_VALUE_PARTIAL_INFORMATION )
                            KeyValueInformation )->DataLength;
        }
    }

    //
    // Transmit all of the data back to the client.
    //

    if( ARGUMENT_PRESENT( lpcbLen ) ) {
        if( NT_SUCCESS( Status ) &&
            ARGUMENT_PRESENT( lpData ) ) {
            *lpcbLen = (( PKEY_VALUE_PARTIAL_INFORMATION )
                        KeyValueInformation )->DataLength;
        } else {
            //
            // The API failed, so make sure that no data is transmitted back
            // to the client. This ensures that the client stub will not
            // attempt to unmarshall data that doesn't exist.
            //

            *lpcbLen = 0;
        }
    }

    //
    //  If memory was allocated, then free it
    //
    if( KeyValueInformation != PrivateKeyValueInformation ) {

        RtlFreeHeap( RtlProcessHeap( ), 0, KeyValueInformation );
    }
    return (error_status_t)RtlNtStatusToDosError( Status );
}
