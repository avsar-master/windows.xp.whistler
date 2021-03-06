/******************************Module*Header*******************************\
* Module Name: debug.c
*
* debug helpers routine
*
* Copyright (c) 2000 Microsoft Corporation
*
\**************************************************************************/

#include <stdio.h>
#include <stdarg.h>

#include "driver.h"

#if DBG

ULONG DebugLevel = 15;

#endif // DBG

/*****************************************************************************
 *
 *   Routine Description:
 *
 *      This function is variable-argument, level-sensitive debug print
 *      routine.
 *      If the specified debug level for the print statement is lower or equal
 *      to the current debug level, the message will be printed.
 *
 *   Arguments:
 *
 *      DebugPrintLevel - Specifies at which debugging level the string should
 *          be printed
 *
 *      DebugMessage - Variable argument ascii c string
 *
 *   Return Value:
 *
 *      None.
 *
 ***************************************************************************/

VOID
DebugPrint(
    ULONG DebugPrintLevel,
    PCHAR DebugMessage,
    ...
    )

{

#if DBG

    va_list ap;

    va_start(ap, DebugMessage);

    if (DebugPrintLevel <= DebugLevel) {

        char buffer[128];

        vsprintf(buffer, DebugMessage, ap);

        OutputDebugStringA("Layrdisp : ");
        OutputDebugStringA(buffer);
    }

    va_end(ap);

#endif // DBG

} // DebugPrint()
