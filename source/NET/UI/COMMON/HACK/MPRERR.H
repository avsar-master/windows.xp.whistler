/**********************************************************************/
/**			  Microsoft Windows NT			     **/
/**		   Copyright(c) Microsoft Corp., 2000		     **/
/**********************************************************************/

/*
    wnerr.hxx
	Functions prototype for WNetGetError and WNetGetErrorText.

	This is a temporary file. It will be deleted after MPR layer is
	completed.

    FILE HISTORY:
	terryk	03-Jan-2000	Created

*/

#ifndef	_MPRERR_H_
#define	_MPRERR_H_

UINT FAR PASCAL WNetGetError(LPUINT);
UINT FAR PASCAL WNetGetErrorText(UINT,LPSTR,LPUINT);

#endif	// _MPRERR_H_
