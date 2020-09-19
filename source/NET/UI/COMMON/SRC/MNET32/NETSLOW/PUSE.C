/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    puse.c
    mapping layer for NetUse API

    FILE HISTORY:
	danhi				Created
	danhi		01-Apr-2000 	Change to LM coding style
	KeithMo		13-Oct-2000	Massively hacked for LMOBJ.

*/

#include "pchmn32.h"

APIERR MNetUseAdd(
	const TCHAR FAR	 * pszServer,
	UINT		   Level,
	BYTE FAR	 * pbBuffer,
	UINT		   cbBuffer )
{
    UNREFERENCED( cbBuffer );

    return (APIERR)NetUseAdd( (TCHAR *)pszServer,
    			      Level,
			      pbBuffer,
			      NULL );

}   // MNetUseAdd


APIERR MNetUseDel(
	const TCHAR FAR	 * pszServer,
	const TCHAR FAR	 * pszDeviceName,
	UINT		   Force )
{
    return (APIERR)NetUseDel( (TCHAR *)pszServer,
    			      (TCHAR *)pszDeviceName,
			      Force );

}   // MNetUseDel


APIERR MNetUseEnum(
	const TCHAR FAR	 * pszServer,
	UINT		   Level,
	BYTE FAR	** ppbBuffer,
	UINT FAR	 * pcEntriesRead )
{
    DWORD cTotalAvail;

    return (APIERR)NetUseEnum( (TCHAR *)pszServer,
    			       Level,
			       ppbBuffer,
			       MAXPREFERREDLENGTH,
			       (LPDWORD)pcEntriesRead,
			       &cTotalAvail,
			       NULL );

}   // MNetUseEnum


APIERR MNetUseGetInfo(
	const TCHAR FAR	 * pszServer,
	const TCHAR FAR	 * pszUseName,
	UINT		   Level,
	BYTE FAR	** ppbBuffer )
{
    return (APIERR)NetUseGetInfo( (TCHAR *)pszServer,
    				  (TCHAR *)pszUseName,
				  Level,
				  ppbBuffer );

}   // MNetUseGetInfo
