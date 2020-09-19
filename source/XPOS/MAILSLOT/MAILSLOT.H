/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    mailslot.h

Abstract:

    This module is the main include file for the Mailslot File System.
    It includes other header files.

Author:

    Manny Weiser (mannyw)    7-Jan-2000

Revision History:

--*/

#ifndef _MAILSLOT_
#define _MAILSLOT_

//
// "System" include files
//

#include <ntifs.h>

//#include <xpos.h>
//#include <string.h>
//#include <fsrtl.h>

//
// Local, independent include files
//

#include "msconst.h"
#include "msdebug.h"
#include "msdata.h"

//
// Local, dependent include files (order is important)
//

#include "msstruc.h"
#include "msfunc.h"

#endif // def _MAILSLOT_
