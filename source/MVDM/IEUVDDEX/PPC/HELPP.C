/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Helpp.c

Abstract:

    This module contains the processor specific help routine.  Help processor
    specific extensions go here.

Author:

    Dave Hastings (daveh) 1-Apr-2000

Revision History:

--*/

#include <ieuvddex.h>

VOID
helpp(
    VOID
    )
/*++

Routine Description:

    This routine prints out help for the processor specific extensions

Arguments:

    None

Return Value:

    None.

--*/
{
    (*Print)("There are currently no extensions implemented for PPC.\n");
}
