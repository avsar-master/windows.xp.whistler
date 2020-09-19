/*******************************************************************/
/*	      Copyright(c)  2000 Microsoft Corporation		   */
/*******************************************************************/


//***
//
// Filename:	debug.h
//
// Description: This module debug definitions for the supervisor module.
//
// Author:	Narendra Gidwani (nareng)    May 22, 2000.
//
// Revision History:
//
//***



#ifndef _DEBUG_
#define _DEBUG_

extern  HANDLE  hLogFile ;

#if DBG

VOID
DbgPrintf(
	char *Format,
    ...
);

#define DBGPRINT(args) DbgPrintf args

#else

#define DBGPRINT(args)

#endif

#endif // _DEBUG_
