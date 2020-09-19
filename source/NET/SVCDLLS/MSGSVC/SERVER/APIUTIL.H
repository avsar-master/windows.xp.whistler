/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    apidata.h

Abstract:

    contains prototypes for api helper utility function.

Author:

    Dan Lafferty (danl)     25-Jul-2000

Environment:

    User Mode -Win32

Notes:

    optional-notes

Revision History:

    25-Jul-2000     danl
        created

--*/

#ifndef _APIUTIL_INCLUDED
#define _APIUTIL_INCLUDED


//
// Function Prototypes
//

DWORD        
MsgIsValidMsgName(
    IN LPTSTR  name
    );

DWORD
MsgMapNetError(
    IN  UCHAR   Code        // Error code
    );

DWORD
MsgLookupName(
    IN DWORD    net,        // The network card to search
    IN LPSTR    name        // Formatted name  (Non-unicode)
    );

NET_API_STATUS
message_sec_check(VOID);

NET_API_STATUS 
MsgGatherInfo (
    IN      DWORD   Level,
    IN      LPSTR   FormattedName,
    IN OUT  LPBYTE  *InfoBufPtr,
    IN OUT  LPBYTE  *StringBufPtr
    );

NET_API_STATUS
MsgUnformatName(
    LPTSTR  UnicodeName,
    LPSTR   FormattedName
    );


#endif // _APIUTIL_INCLUDED

