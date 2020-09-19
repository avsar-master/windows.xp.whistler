/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    msdata.h

Abstract:

    This module declares the global variables used by the mailslot
    file system.

Author:

    Manny Weiser (mannyw)    7-Jan-2000

Revision History:

--*/

#ifndef _MSDATA_
#define _MSDATA_

extern LONG MsDebugTraceLevel;
extern LONG MsDebugTraceIndent;

#endif // _MSDATA_

extern ERESOURCE MsGlobalResource;
extern ERESOURCE MsPrefixTableResource;
extern ERESOURCE MsCcbListResource;

