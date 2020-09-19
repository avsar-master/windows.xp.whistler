/*++

Copyright (c) 2000 Microsoft Corporation

Module Name:

    lockapi.h

Abstract:

    SC Manager database lock worker routines.

Author:

    Rita Wong (ritaw)     06-Aug-2000

Revision History:

--*/

#ifndef SCLOCKAPI_INCLUDED
#define SCLOCKAPI_INCLUDED

//
// Function Prototypes
//

DWORD
ScLockDatabase(
    IN  BOOL LockedByScManager,
    IN  LPWSTR DatabaseName,
    OUT LPSC_RPC_LOCK lpLock
    );

VOID
ScUnlockDatabase(
    IN OUT LPSC_RPC_LOCK lpLock
    );


#endif // #ifndef SCLOCKAPI_INCLUDED
