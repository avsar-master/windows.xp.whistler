/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    AbsPath.c

Abstract:

    This file contains ReplCheckAbsPathSyntax().

Author:

    John Rogers (JohnRo) 27-Jan-2000

Environment:

    User Mode - Win32
    Portable to any flat, 32-bit environment.  (Uses Win32 typedefs.)
    Requires ANSI C extensions: slash-slash comments, long external names.

Revision History:

    27-Jan-2000 JohnRo
        Created as part of replconf stuff..
    21-Feb-2000 JohnRo
        Extracted this code for slightly more general use.
    19-Mar-2000 JohnRo
        Richard Firth fixed a canon bug, which I was unintentionally
        depending on here.
    20-Mar-2000 JohnRo
        Include header file with my prototype, just to be on the safe side.
    17-Aug-2000 JohnRo
        RAID 3174: NetReplSetInfo (and repl registry) allow bad paths.

--*/


// These must be included first:

#include <windef.h>             // MAX_PATH, etc.
#include <lmcons.h>             // LAN Manager common definitions

// These can be in any order:

#include <icanon.h>             // I_NetPathCanonicalize(), ITYPE_ equates.
#include <repldefs.h>           // My prototype.
#include <winerror.h>           // ERROR_, NO_ERROR equates.




NET_API_STATUS
ReplCheckAbsPathSyntax (
    IN LPTSTR AbsPath
    )
{
    DWORD ActualType = 0;               // 0 means we don't know yet.
    NET_API_STATUS ApiStatus;
    TCHAR CanonBuf[MAX_PATH];

    ApiStatus = I_NetPathCanonicalize(
            NULL,
            AbsPath,
            CanonBuf,
            sizeof(CanonBuf),
            NULL,
            &ActualType,
            0);

    //
    // Check the type of the input.
    //

    if (ApiStatus != NO_ERROR) {
        return (ApiStatus);
    } else if (ActualType == ITYPE_PATH_ABSD) {     // abs path with drive.
        return (NO_ERROR);
    } else {
        return (ERROR_INVALID_DATA);
    }

    /*NOTREACHED*/

} // ReplCheckAbsPathSyntax
