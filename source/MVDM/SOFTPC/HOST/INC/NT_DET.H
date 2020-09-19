/*
 * ==========================================================================
 *	Name:		nt_det.h
 *	Author:		Tim
 *	Derived From:	nt_fulsc.h
 *	Created On:	4th November 2000
 *	Purpose:	External defs for nt_det.c
 *
 *	(c)Copyright Insignia Solutions Ltd., 2000. All rights reserved.
 * ==========================================================================
 */
extern PBYTE  textBuffer;
extern COORD  textBufferSize;
/*
** Centralised console registration funx.
*/
IMPORT VOID doNullRegister IPT0();
IMPORT VOID doRegister IPT0();
IMPORT VOID initTextSection IPT0();
