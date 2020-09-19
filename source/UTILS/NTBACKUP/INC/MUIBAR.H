
/******************************************************************************
Copyright (c) Maynard, an Archive Company.  2000
GSH

     Name:          muibar.h

     Description:   This file describes all the APIs and data structures
                    kept by the MaynStream User Interface (MUI) selection
                    bar functions.

     $Log:   G:/UI/LOGFILES/MUIBAR.H_V  $

   Rev 1.1   04 Oct 2000 19:48:06   DAVEV
UNICODE AWK PASS

   Rev 1.0   20 Mar 2000 17:25:06   GLENN
Initial revision.

******************************************************************************/


#ifndef   MUIBAR_H
#define   MUIBAR_H

HRIBBON MUI_MakeMainRibbon ( VOID );
VOID    MUI_SetOperationButtons ( WORD );
VOID    MUI_SetActionButtons ( WORD );
VOID    MUI_SetButtonState ( WORD, WORD );

#endif
