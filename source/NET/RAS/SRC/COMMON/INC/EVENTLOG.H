/********************************************************************/
/**           Copyright(c) 2000 Microsoft Corporation.             **/
/********************************************************************/

//***
//
// Filename:  eventlog.h
//
// Description: 
//
// History:
//   Dec 09,2000  J. Perry Hannah (perryh)  Created original version.
//
//***


VOID
LogEvent(
    IN DWORD  dwMessageId,
    IN WORD   cNumberOfSubStrings,
    IN LPSTR  *plpwsSubStrings,
    IN DWORD  dwErrorCode);


VOID Audit(
    IN WORD wEventType,
    IN DWORD dwMessageId,
    IN WORD cNumberOfSubStrings,
    IN LPSTR *plpwsSubStrings
    );

