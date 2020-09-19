/*++

Copyright (c) 1990  Microsoft Corporation

Module Name:

    rxlgenum.h

Abstract:

    Prototypes for down-level remoted RxNetLogonEnum routines

Author:

    Richard Firth (rfirth) 28-May-2000

Revision History:

    28-May-2000 RFirth
        Created

--*/

NET_API_STATUS
RxNetLogonEnum(
    IN  LPTSTR  ServerName,
    IN  DWORD   Level,
    OUT LPBYTE* Buffer,
    IN  DWORD   BufLen,
    OUT LPDWORD EntriesRead,
    OUT LPDWORD EntriesLeft,
    IN OUT LPDWORD ResumeHandle OPTIONAL
    );
