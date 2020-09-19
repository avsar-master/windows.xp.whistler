/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    valid.c

Abstract:

    Contains validation routines for service controller parameters.

Author:

    Dan Lafferty (danl) 29-Mar-2000

Environment:

    User Mode - Win32

Revision History:

    29-Mar-2000 danl
        Created
    10-Apr-2000 JohnRo
        Include <valid.h> so compiler checks prototypes.

--*/

//
// INCLUDES
//
#include <nt.h>
#include <ntrtl.h>      // DbgPrint prototype
#include <nturtl.h>     // needed for winbase.h when ntrtl is present
#include <windows.h>    // CRITICAL_SECTION

#include <scdebug.h>    // SC_LOG
#include <winsvc.h>     // SERVICE_STATUS
#include <valid.h>      // My prototypes.




BOOL
ScCurrentStateInvalid(
    DWORD   dwCurrentState
    )
/*++

Routine Description:

    This function returns TRUE if the CurrentState is invalid.
    Otherwise FALSE is returned.

Arguments:

    dwCurrentState - This is the ServiceState that is being validiated.

Return Value:

    TRUE - The CurrentState is invalid.

    FALSE - The CurrentState is valid.

Note:


--*/
{
    if ((dwCurrentState == SERVICE_STOPPED)             ||
        (dwCurrentState == SERVICE_START_PENDING)       ||
        (dwCurrentState == SERVICE_STOP_PENDING)        ||
        (dwCurrentState == SERVICE_RUNNING)             ||
        (dwCurrentState == SERVICE_CONTINUE_PENDING)    ||
        (dwCurrentState == SERVICE_PAUSE_PENDING)       ||
        (dwCurrentState == SERVICE_PAUSED )) {

        return(FALSE);
    }
    return(TRUE);
}

