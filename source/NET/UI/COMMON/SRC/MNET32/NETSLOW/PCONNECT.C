/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    pconnect.c
    mapping layer for NetConnect API

    FILE HISTORY:
	danhi				Created
	danhi		01-Apr-2000 	Change to LM coding style
	KeithMo		13-Oct-2000	Massively hacked for LMOBJ.

*/

#include "pchmn32.h"

APIERR MNetConnectionEnum(
	const TCHAR FAR	 * pszServer,
	const TCHAR FAR	 * pszQualifier,
	UINT		   Level,
	BYTE FAR	** ppbBuffer,
	UINT FAR	 * pcEntriesRead )
{
    DWORD cTotalAvail;

    return (APIERR)NetConnectionEnum( (TCHAR *)pszServer,
    				      (TCHAR *)pszQualifier,
				      Level,
				      ppbBuffer,
				      MAXPREFERREDLENGTH,
				      (LPDWORD)pcEntriesRead,
				      &cTotalAvail,
				      NULL );

}   // MNetConnectionEnum
