/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    netstats.h

Abstract:

    Contains prototypes for private net stats routines

Author:

    Richard L Firth (rfirth) 21-Jan-2000

Revision History:

--*/

NET_API_STATUS
NetWkstaStatisticsGet(
    IN  LPTSTR  ServerName,
    IN  DWORD   Level,
    IN  DWORD   Options,
    OUT LPBYTE* Buffer
    );

NET_API_STATUS
NetServerStatisticsGet(
    IN  LPTSTR  ServerName,
    IN  DWORD   Level,
    IN  DWORD   Options,
    OUT LPBYTE* Buffer
    );
