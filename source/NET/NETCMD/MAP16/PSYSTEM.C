/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    psystem.c
    mapping layer for OS/2 API

    FILE HISTORY:
	danhi				Created
	danhi		01-Apr-2000 	Change to LM coding style

*/

#define INCL_DOSPROCESS

#include <os2.h>
#include "port1632.h"

VOID MSleep(
    ULONG ulTime) {

    DosSleep(ulTime);

    return;

}

USHORT MGetDateTime(
    PDATETIME pDateTime) {

    return(DosGetDateTime(pDateTime));

}

USHORT MSetDateTime(
    PDATETIME pDateTime) {

    return(DosSetDateTime(pDateTime));

}
