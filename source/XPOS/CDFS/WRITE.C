/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Write.c

Abstract:

    This module implements the File Write routine for Write called by the
    dispatch driver.

Author:

    Brian Andrew    [BrianAn]   02-Jan-2000

Revision History:

--*/

#include "CdProcs.h"

//
//  The local debug trace level
//

#define Dbg                              (DEBUG_TRACE_WRITE)

