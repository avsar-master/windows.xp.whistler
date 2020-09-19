/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    pfreebuf.c
    mapping layer for Memory allocation API (unique to mapping layer)

    FILE HISTORY:
	danhi				Created
	danhi		01-Apr-2000 	Change to LM coding style
	KeithMo		13-Oct-2000	Massively hacked for LMOBJ.

*/

#include "pchmn32.h"


//////////////////////////////////////////////////////////////////////////////
//
//				Public Functions
//
//////////////////////////////////////////////////////////////////////////////


//
//  Allocate an API buffer.
//

BYTE FAR * MNetApiBufferAlloc(
	UINT		   cbBuffer )
{
    BYTE FAR * pbBuffer;

    if( NetapipBufferAllocate( cbBuffer, (LPVOID *)&pbBuffer ) != NERR_Success )
    {
    	return NULL;
    }

    return pbBuffer;

}   // MNetpAlloc


//
//  Free the API buffer.
//

VOID MNetApiBufferFree(
	BYTE FAR	** ppbBuffer )
{
    if( ( ppbBuffer != NULL ) && ( *ppbBuffer != NULL ) )
    {
	NetApiBufferFree( (VOID *)*ppbBuffer );
	*ppbBuffer = NULL;
    }

}   // MNetApiBufferFree


//**************************************************************************//
//									    //
//		    WARNING!!       DANGER!!!       WARNING!!		    //
//									    //
//  The following two routines are highly dependent on the implementation   //
//  of the NT Net API buffer routines (see \xp\neptune\net\api\apibuff.c).  //
//  These routines are written as such just as a temporary hack, until	    //
//  DanHi gives us official support for these functions we so desparately   //
//  need.								    //
//									    //
//	-- KeithMo, 28-Oct-2000						    //
//									    //
//		    WARNING!!       DANGER!!!       WARNING!!		    //
//									    //
//**************************************************************************//

//
//  Reallocate an API buffer.
//

APIERR MNetApiBufferReAlloc(
	BYTE FAR	** ppbBuffer,
	UINT		   cbBuffer )
{
    BYTE FAR * pbBuffer;

    pbBuffer = (BYTE FAR *)LocalReAlloc( (HANDLE)*ppbBuffer, cbBuffer, LMEM_MOVEABLE );

    if( pbBuffer == NULL )
    {
    	return ERROR_NOT_ENOUGH_MEMORY;
    }

    *ppbBuffer = pbBuffer;

    return NERR_Success;

}   // MNetApiBufferReAlloc


//
//  Retrieve the size of an API buffer.
//

APIERR MNetApiBufferSize(
	BYTE FAR	 * pbBuffer,
	UINT FAR	 * pcbBuffer )
{
    UINT cb;

    cb = (UINT)LocalSize( (HANDLE)pbBuffer );

    if( cb == 0 )
    {
    	return ERROR_INVALID_PARAMETER;
    }

    *pcbBuffer = cb;

    return NERR_Success;

}   // MNetApiBufferSize
