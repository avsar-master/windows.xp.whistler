/*++

Copyright (c) 2000  Microsoft Corporation


Module Name:


    ruler.c


Abstract:


    This module implements the cdplayer ruler/slider.


Author:


    Rick Turner (ricktu) 04-Aug-2000


Revision History:



--*/

#include <windows.h>
#include "cdplayer.h"
#include "cdwindef.h"
#include "ruler.h"


BOOL
RulerInit(
    VOID
    )

{

    //
    // do ruler initialization
    //

    gRulerWnd = NULL;
    return TRUE;

}
