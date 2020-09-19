/*++

Copyright (c) 1990  Microsoft Corporation

Module Name:

    rxchdev.h

Abstract:

    Prototypes for down-level remoted RxNetCharDev routines

Author:

    Richard Firth (rfirth) 28-May-2000

Revision History:

    28-May-2000 rfirth
        Created

--*/

NET_API_STATUS
RxNetCharDevControl(
    IN  LPTSTR  ServerName,
    IN  LPTSTR  DeviceName,
    IN  DWORD   Opcode
    );

NET_API_STATUS
RxNetCharDevEnum(
    IN  LPTSTR  ServerName,
    IN  DWORD   Level,
    OUT LPBYTE* Buffer,
    IN  DWORD   PrefMaxLen,
    OUT LPDWORD EntriesRead,
    OUT LPDWORD EntriesLeft,
    IN OUT LPDWORD ResumeHandle OPTIONAL
    );

NET_API_STATUS
RxNetCharDevGetInfo(
    IN  LPTSTR  ServerName,
    IN  LPTSTR  DeviceName,
    IN  DWORD   Level,
    OUT LPBYTE* Buffer
    );
