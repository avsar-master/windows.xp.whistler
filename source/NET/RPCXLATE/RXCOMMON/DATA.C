/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Data.c

Abstract:

    Global data for RpcXlate routines.  (Debug only, so no security problems.)

Author:

    John Rogers (JohnRo) 03-Apr-2000

Environment:

    Portable to any flat, 32-bit environment.  (Uses Win32 typedefs.)
    Requires ANSI C extensions: slash-slash comments, long external names.

Revision History:

    03-Apr-2000 JohnRo
        Created.
    17-Jul-2000 JohnRo
        Extracted RxpDebug.h from Rxp.h.

--*/


#include <rxpdebug.h>           // DWORD, extern for RxpTrace.

DWORD RxpTrace = 0;

// That's all, folks!
