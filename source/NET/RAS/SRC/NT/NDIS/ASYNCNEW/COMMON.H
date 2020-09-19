/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    common.h

Abstract:


Author:

    Thomas J. Dimitri  (TommyD) 08-May-2000

Environment:

    Kernel Mode - Or whatever is the equivalent on OS/2 and DOS.

Revision History:

--*/




VOID
AsyncReceiveFrame(
	PASYNC_CONNECTION	pAsyncConnection,
	PASYNC_FRAME		pAsyncFrame);


