/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    premote.c
    mapping layer for NetRemote API

    FILE HISTORY:
	danhi				Created
	danhi		01-Apr-2000 	Change to LM coding style
	KeithMo		13-Oct-2000	Massively hacked for LMOBJ.

*/

#include "pchmn32.h"

#if 0

APIERR MNetRemoteCopy(
	const TCHAR FAR	 * pszSourcePath,
	const TCHAR FAR	 * pszDestPath,
	const TCHAR FAR	 * pszSourcePasswd,
	const TCHAR FAR	 * pszDestPasswd,
	UINT		   fOpen,
	UINT		   fCopy,
	BYTE FAR	** ppbBuffer )
{
    UNREFERENCED( pszSourcePath );
    UNREFERENCED( pszDestPath );
    UNREFERENCED( pszSourcePasswd );
    UNREFERENCED( pszDestPasswd );
    UNREFERENCED( fOpen );
    UNREFERENCED( fCopy );
    UNREFERENCED( ppbBuffer );

    return ERROR_NOT_SUPPORTED;	    	// NOT NEEDED FOR LMOBJ

}   // MNetRemoteCopy

APIERR MNetRemoteMove(
	const TCHAR FAR	 * pszSourcePath,
	const TCHAR FAR	 * pszDestPath,
	const TCHAR FAR	 * pszSourcePasswd,
	const TCHAR FAR	 * pszDestPasswd,
	UINT		   fOpen,
	UINT		   fCopy,
	BYTE FAR	** ppbBuffer )
{
    UNREFERENCED( pszSourcePath );
    UNREFERENCED( pszDestPath );
    UNREFERENCED( pszSourcePasswd );
    UNREFERENCED( pszDestPasswd );
    UNREFERENCED( fOpen );
    UNREFERENCED( fCopy );
    UNREFERENCED( ppbBuffer );

    return ERROR_NOT_SUPPORTED;	    	// NOT NEEDED FOR LMOBJ

}   // MNetRemoteMove

#endif

APIERR MNetRemoteTOD(
	const TCHAR FAR	 * pszServer,
	BYTE FAR	** ppbBuffer )
{
    return (APIERR)NetRemoteTOD( (TCHAR *)pszServer,
    				 ppbBuffer );

}   // MNetRemoteTOD
