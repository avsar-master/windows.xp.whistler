/*****************************************************************************
*
* COPYRIGHT 1993 - COLORADO MEMORY SYSTEMS, INC.
* ALL RIGHTS RESERVED.
*
******************************************************************************
*
* FILE: \SE\DRIVER\Q117KDI\NT\SRC\0X15A2A.C
*
* FUNCTION: kdi_QIC117ClearIRQ
*
* PURPOSE: 
*
* HISTORY:
*		$Log:   J:\se.vcs\driver\q117kdi\xp\src\0x15a2a.c  $
*	
*	   Rev 1.0   26 Apr 1994 16:09:44   KEVINKES
*	Initial revision.
*
*****************************************************************************/
#define FCT_ID 0x15A2A
#include "include\neptune\adi_api.h"
#include "include\neptune\frb_api.h"
#include "include\neptune\cqd_pub.h"
#include "q117kdi\include\kdiwhio.h"
#include "q117kdi\include\kdiwpriv.h"
#include "include\neptune\kdi_pub.h"
/*endinclude*/

dVoid kdi_QIC117ClearIRQ
(
/* INPUT PARAMETERS:  */

	dVoidPtr kdi_context

/* UPDATE PARAMETERS: */

/* OUTPUT PARAMETERS: */

)
/* COMMENTS: *****************************************************************
 *
 * DEFINITIONS: *************************************************************/
{

/* DATA: ********************************************************************/


/* CODE: ********************************************************************/

   UNREFERENCED_PARAMETER( kdi_context );

	return;
}
