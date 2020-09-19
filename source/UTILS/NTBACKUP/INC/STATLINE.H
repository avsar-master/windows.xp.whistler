
/******************************************************************************
Copyright (c) Maynard, an Archive Company.  2000
GSH

     Name:          statline.h

     Description:   This file contains the definitions, macros, and function
                    prototypes for the Maynstream GUI Status Line Manager (STM).

     $Log:   G:/UI/LOGFILES/STATLINE.H_V  $

   Rev 1.4   04 Oct 2000 19:49:32   DAVEV
UNICODE AWK PASS

   Rev 1.3   10 Jul 2000 10:29:24   GLENN
Changed the status line to be identical to the new file manager.

   Rev 1.2   10 Jun 2000 16:12:42   GLENN
Updated according to NT SPEC.

   Rev 1.1   20 Apr 2000 13:52:40   GLENN
Added status line get/set capability.

   Rev 1.0   20 Nov 2000 19:35:14   SYSTEM
Initial revision.

******************************************************************************/


#ifndef   SS_STM_H

#define   SS_STM_H

#define   STATUS_LINE_HEIGHT     23
#define   STATUS_BORDER          2
#define   STATUS_INDENT          6
#define   STATUS_TEXT            500
#define   STATUS_TEXT_MARGIN     8
#define   STATUS_HIGHLIGHT_WIDTH 1

// MACROS

#define STM_DrawIdle( )       STM_DrawText ( gszStatusLine )

// FUNCTION PROTOTYPES

VOID  STM_DrawBorder( VOID );
VOID  STM_DrawMemory( VOID );
VOID  STM_DrawText( LPSTR );
VOID  STM_SetIdleText( WORD );
LPSTR STM_GetStatusLineText( VOID );
VOID  STM_SetStatusLineText( LPSTR );

#endif
