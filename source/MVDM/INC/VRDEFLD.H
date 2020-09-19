/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    vrdefld.h

Abstract:

    Contains offsets in VDM redir code segment for deferred load address info

Author:

    Richard L Firth (rfirth) 21-Oct-2000

Revision History:

--*/

/* XLATOFF */
#include <packon.h>
/* XLATON */

typedef struct _VDM_LOAD_INFO { /* */
    DWORD   DlcWindowAddr;
    BYTE    VrInitialized;
} VDM_LOAD_INFO;

/* XLATOFF */
#include <packoff.h>
/* XLATON */
