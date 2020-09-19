/*++ BUILD Version: 0001    // Increment this if a change has global effects

Copyright (c) 1996-2000  Microsoft Corporation

Module Name:

    os2.h

Abstract:

    This file maps the LM 2.x include file name to the appropriate NT include
    file name, and does any other mapping required by this include file.

Author:

    Dan Hinsley (danhi) 8-Jun-2000

Environment:

    User Mode - Win32
    Portable to any flat, 32-bit environment.  (Uses Win32 typedefs.)
    Requires ANSI C extensions: slash-slash comments.

Revision History:

    14-May-2000 JohnRo
        winsvc.h and related file cleanup.

--*/


#ifndef _OS2_
#define _OS2_


#define NOMINMAX
#define NOGDI
#define NOSERVICE       // Avoid <winsvc.h> vs. <lmsvc.h> conflicts.
#include <windows.h>


#endif // ndef _OS2_
