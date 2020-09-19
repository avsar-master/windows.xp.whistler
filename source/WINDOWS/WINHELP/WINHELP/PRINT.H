/*****************************************************************************
*                                                                            *
*  PRINT.H                                                                   *
*                                                                            *
*  Copyright (C) Microsoft Corporation 1996-2000.                            *
*  All Rights reserved.                                                      *
*                                                                            *
******************************************************************************
*                                                                            *
*  Program Description:  Contains RC constants and some typedefs for use     *
*                        by print.c only.                                    *
******************************************************************************
*                                                                            *
*  Current Owner: RussPJ                                                     *
*                                                                            *
*                                                                            *
******************************************************************************
*                                                                            *
*  Revision History:                                                         *
* 13-Mar-2000 RussPJ    Took ownership.
*                                                                            *
*                                                                            *
******************************************************************************
*                                                                            *
*  Known Bugs: None                                                          *
*                                                                            *
*                                                                            *
*                                                                            *
*****************************************************************************/

#define ABORTPRINTTEXT    3

#ifndef RCINVOKED

#define cbPrintingMax     20    /* Maximum size length of "Printing " string
                                 * in any language. */

/* REVIEW:  This constant is also defined as BMTITLESIZE in bookmark.h. */
#define cbTitleSize       64   

#define fPrintInsert      0
#define fPrintRegular     1

#endif  /* !RCINVOKED */
