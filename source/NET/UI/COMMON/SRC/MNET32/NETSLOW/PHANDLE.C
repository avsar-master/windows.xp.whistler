/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    phandle.c
    mapping layer for NetHandle API

    FILE HISTORY:
	danhi				Created
	danhi		01-Apr-2000 	Change to LM coding style
	KeithMo		13-Oct-2000	Massively hacked for LMOBJ.

*/

#include "pchmn32.h"
#if 0

APIERR MNetHandleGetInfo(
	UINT		   hHandle,
	UINT	 	   Level,
	BYTE FAR	** ppbBuffer )
{
    UNREFERENCED( hHandle );
    UNREFERENCED( Level );
    UNREFERENCED( ppbBuffer );

    return ERROR_NOT_SUPPORTED;	    	// NOT NEEDED FOR LMOBJ

}   // MNetHandleGetInfo


APIERR MNetHandleSetInfo(
	UINT		   hHandle,
	UINT	 	   Level,
	BYTE FAR	 * pbBuffer,
	UINT		   cbBuffer,
	UINT		   ParmNum )
{
    UNREFERENCED( hHandle );
    UNREFERENCED( Level );
    UNREFERENCED( pbBuffer );
    UNREFERENCED( cbBuffer );
    UNREFERENCED( ParmNum );

    return ERROR_NOT_SUPPORTED;	    	// NOT NEEDED FOR LMOBJ

}   // MNetHandleSetInfo
#endif
