/*++ BUILD Version: 0001    // Increment this if a change has global effects

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Environ.h

Abstract:


Author:

    David J. Gilman  (davegi) 27-Nov-2000
    Gregg R. Acheson (GreggA)  7-May-1993

Environment:

    User Mode

--*/

#if ! defined( _ENVIRON_ )

#define __ENVIRON_

#include "wintools.h"


BOOL
BuildEnvironmentReport(
    IN HWND hWnd
    );

BOOL
EnvironmentDlgProc(
    IN HWND hWnd,
    IN UINT message,
    IN WPARAM wParam,
    IN LPARAM lParam
    );

#endif // _ENVIRON_
