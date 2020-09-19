/***************************** Module Header ********************************\
*                                                                            *
* Module: RECT.C                                                             *
*                                                                            *
* Abstract:                                                                  *
*                                                                            *
*   Provide clipping functions for clip rect enumeration.                    *
*                                                                            *
* Functions:                                                                 *
*                                                                            *
*   bIntersectRect                                                           *
*                                                                            *
* Created: 10-Aug-2000                                                       *
* Author:  Dave Schmenk                                                      *
*                                                                            *
* Revised:
*
*	Eric Rehm  [rehm@zso.dec.com] 23-Sep-2000
*		Rewrote for Compaq QVision
*
* Copyright (c) 2000 Digital Equipment Corporation
*
* Copyright 2000 Compaq Computer Corporation                                 *
*                                                                            *
\****************************************************************************/

#include "driver.h"


/***************************** Public Routine *******************************\
*                                                                            *
* bIntersectRect                                                             *
*                                                                            *
* Intersect Rect1 with Rect2, result in Dst.  Return TRUE if Rect1 and Rect2 *
* intersect each other.  Otherwise return FALSE.                             *
*                                                                            *
* History:                                                                   *
*  10-Aug-2000 -by- Dave Schmenk                                             *
* Wrote it.                                                                  *
*                                                                            *
\****************************************************************************/

BOOL
bIntersectRects
(
    OUT RECTL *prclDst,
    IN  RECTL *prclRect1,
    IN  RECTL *prclRect2
)
{
    //
    // Quickly reject rectangles that don't intersect.
    //

    if ((prclRect1->left   >= prclRect2->right)
     || (prclRect1->right  <= prclRect2->left)
     || (prclRect1->top    >= prclRect2->bottom)
     || (prclRect1->bottom <= prclRect2->top))
        return(FALSE);

    //
    // Find the intersecting rectangle of Rect1 and Rect2.
    //

    prclDst->left   = (prclRect1->left < prclRect2->left)
                     ? prclRect2->left : prclRect1->left;

    prclDst->right  = (prclRect1->right > prclRect2->right)
                     ? prclRect2->right : prclRect1->right;

    prclDst->top    = (prclRect1->top < prclRect2->top)
                     ? prclRect2->top : prclRect1->top;

    prclDst->bottom = (prclRect1->bottom > prclRect2->bottom)
                     ? prclRect2->bottom : prclRect1->bottom;

    return(TRUE);
}
