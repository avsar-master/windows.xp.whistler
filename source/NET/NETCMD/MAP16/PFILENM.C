/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    pfilenm.c
    Portable way to get path name of help/message files

    FILE HISTORY:
	danhi	06-Jun-2000	Created

*/

#include <os2.h>
#include <netlib.h>
#include "port1632.h"

//
// Get the help file name
//

USHORT
MGetHelpFileName(
    CHAR FAR * HelpFileName,
    USHORT BufferLength
    )
{

    return(NetIMakeLMFileName("NET.HLP", HelpFileName, BufferLength));

}

//
// Get the explanation file name (used by net helpmsg)
//

USHORT
MGetExplanationFileName(
    CHAR FAR * ExplanationFileName,
    USHORT BufferLength
    )
{

    return(NetIMakeLMFileName("NETH.MSG", ExplanationFileName, BufferLength));

}

//
// Get the message file name
//

USHORT
MGetMessageFileName(
    CHAR FAR * MessageFileName,
    USHORT BufferLength
    )
{

    return(NetIMakeLMFileName("NET.MSG", MessageFileName, BufferLength));

}
