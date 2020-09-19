/*******************************************************************************
Copyright(c) Maynard, an Archive Company.  2000


     Name:         save_sel.h

     Description:  include file for the save_sel.dlg dialog


     $Log:   G:/UI/LOGFILES/SAVE_SEL.H_V  $

   Rev 1.3   04 Oct 2000 19:49:04   DAVEV
UNICODE AWK PASS

   Rev 1.2   03 Apr 2000 13:15:16   CARLS
added translate defines

   Rev 1.0   20 Nov 2000 19:34:42   SYSTEM
Initial revision.

*******************************************************************************/

#ifdef TRANSLATE
#define IDHELP 100
#define IDD_SELECTSAVE              4
#else
#include "dlg_ids.h"
#endif

#define IDD_DS_LIST                 0x0065
#define IDD_SS_FILENAME             0x0068
#define IDD_SS_LIST                 0x006A
#define IDD_SAVE_FNAME              0x006B
#define IDD_SAVE_FLIST              0x006C

