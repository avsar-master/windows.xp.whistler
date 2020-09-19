/*++

Copyright (c) 2000 Microsoft Corporation

Module Name:

    purecall.c

Abstract:


Author:


Revision History:

--*/

#include <sysinc.h>
#include <rpc.h>

void __cdecl _purecall(void)
{
#ifdef DEBUGRPC
    ASSERT(!"PureVirtualCalled");
#endif
}

#ifdef DOS
void __far __cdecl _fpurecall(void)
{
#ifdef DEBUGRPC
    ASSERT(!"PureVirtualCalled");
#endif
}
#endif // DOS

