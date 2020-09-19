/*****************************************************************************
*
* COPYRIGHT 1993 - COLORADO MEMORY SYSTEMS, INC.
* ALL RIGHTS RESERVED.
*
******************************************************************************
*
* FILE: \SE\DRIVER\Q117KDI\NT\SRC\0X15A27.C
*
* FUNCTION: kdi_TrakkerSlowRate
*
* PURPOSE:
*
* HISTORY:
*		$Log:   J:\se.vcs\driver\q117kdi\xp\src\0x15a27.c  $
*	
*	   Rev 1.0   09 Dec 1993 13:40:20   KEVINKES
*	Initial Revision.
*
*****************************************************************************/
#define FCT_ID 0x15A27
#include "include\neptune\adi_api.h"
#include "include\neptune\frb_api.h"
#include "include\neptune\kdi_pub.h"
#include "include\neptune\cqd_pub.h"
#include "q117cd\include\cqd_defs.h"
#include "q117cd\include\cqd_strc.h"
#include "q117cd\include\cqd_hdr.h"
/*endinclude*/

dBoolean kdi_TrakkerSlowRate
(
/* INPUT PARAMETERS:  */

	dVoidPtr	kdi_context

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

	return dFALSE;
}
