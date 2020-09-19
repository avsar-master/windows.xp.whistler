#if !defined(_ALPHA_) && !i386
/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    jzstubs.c

Abstract:

    This module contains jzsetup stubs.

Author:

    David M. Robinson (davidro) 11-Sept-2000

Revision History:

--*/


#include "xpos.h"


NTSTATUS
ZwQuerySystemInformation (
    IN SYSTEM_INFORMATION_CLASS SystemInformationClass,
    OUT PVOID SystemInformation,
    IN ULONG SystemInformationLength,
    OUT PULONG ReturnLength OPTIONAL
    )

{
    return(STATUS_SUCCESS);
}

#endif
