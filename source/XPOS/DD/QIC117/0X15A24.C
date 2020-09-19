/*****************************************************************************
*
* COPYRIGHT 1993 - COLORADO MEMORY SYSTEMS, INC.
* ALL RIGHTS RESERVED.
*
******************************************************************************
*
* FILE: \SE\DRIVER\Q117KDI\NT\SRC\0X15A24.C
*
* FUNCTION: kdi_SetDMADirection
*
* PURPOSE:
*
* HISTORY:
*		$Log:   J:\se.vcs\driver\q117kdi\xp\src\0x15a24.c  $
*	
*	   Rev 1.0   09 Dec 1993 13:38:38   KEVINKES
*	Initial Revision.
*
*****************************************************************************/
#define FCT_ID 0x15A24
#include "include\neptune\adi_api.h"
#include "include\neptune\frb_api.h"
#include "include\neptune\kdi_pub.h"
#include "include\neptune\cqd_pub.h"
#include "q117cd\include\cqd_defs.h"
#include "q117cd\include\cqd_strc.h"
#include "q117cd\include\cqd_hdr.h"
/*endinclude*/

dBoolean kdi_SetDMADirection
(
/* INPUT PARAMETERS:  */

	dVoidPtr	kdi_context,
	dBoolean	dma_direction

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
	UNREFERENCED_PARAMETER( dma_direction );

	return dFALSE;
}
