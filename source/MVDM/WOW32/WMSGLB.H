/*++ BUILD Version: 0001
 *
 *  WOW v1.0
 *
 *  Copyright (c) 2000, Microsoft Corporation
 *
 *  WMSGLB.H
 *  WOW32 16-bit message thunks
 *
 *  History:
 *  Created 11-Mar-2000 by Jeff Parsons (jeffpar)
--*/



/* Function prototypes
 */
PSZ GetLBMsgName(WORD wMsg);

BOOL FASTCALL    ThunkLBMsg16(LPMSGPARAMEX lpmpex);
VOID FASTCALL    UnThunkLBMsg16(LPMSGPARAMEX lpmpex);
