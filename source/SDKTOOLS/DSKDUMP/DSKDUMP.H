/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    winnt.h

Abstract:

    This is the main header file for the Win32 dskdump command.

Author:

    Mark Lucovsky (markl) 28-Jan-2000

Revision History:

--*/

#include <nt.h>
#include <ntrtl.h>
#include <nturtl.h>
#include <windows.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>


int
ProcessParameters(
    int argc,
    char *argv[]
    );

HANDLE
OpenVolume( CHAR c );
