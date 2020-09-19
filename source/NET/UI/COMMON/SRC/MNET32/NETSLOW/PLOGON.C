/**********************************************************************/
/**                       Microsoft LAN Manager                      **/
/**             Copyright(c) Microsoft Corp., 1990, 2000             **/
/**********************************************************************/

/*
    plogon.c
    mapping layer for NetLogon API

    FILE HISTORY:
        danhi                           Created
        danhi           01-Apr-2000     Change to LM coding style
        KeithMo         13-Oct-2000     Massively hacked for LMOBJ.
        KeithMo         30-Apr-2000     Added I_MNetLogonControl.
        ChuckC          06-Aug-2000     Removed #ifdef Unicode stuff

*/

#include "pchmn32.h"

APIERR MNetLogonEnum(
        const TCHAR FAR  * pszServer,
        UINT               Level,
        BYTE FAR        ** ppbBuffer,
        UINT FAR         * pcEntriesRead )
{
    UNREFERENCED( pszServer );
    UNREFERENCED( Level );
    UNREFERENCED( ppbBuffer );
    UNREFERENCED( pcEntriesRead );

    // this is no longer supported in NETAPI32
    return ERROR_NOT_SUPPORTED;

}   // MNetLogonEnum


APIERR I_MNetLogonControl(
        const TCHAR FAR  * pszServer,
        ULONG              FunctionCode,
        ULONG              Level,
        BYTE FAR        ** ppbBuffer )
{
    return (APIERR)I_NetLogonControl( (LPWSTR)pszServer,
                                      (DWORD)FunctionCode,
                                      (DWORD)Level,
                                      (LPBYTE *)ppbBuffer );

}   // I_MNetLogonControl
