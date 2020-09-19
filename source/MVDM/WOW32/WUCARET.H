/*++ BUILD Version: 0001
 *
 *  WOW v1.0
 *
 *  Copyright (c) 2000, Microsoft Corporation
 *
 *  WUCARET.H
 *  WOW32 16-bit User API support
 *
 *  History:
 *  Created 07-Mar-2000 by Jeff Parsons (jeffpar)
--*/



ULONG FASTCALL WU32CreateCaret(PVDMFRAME pFrame);
ULONG FASTCALL WU32DestroyCaret(PVDMFRAME pFrame);
ULONG FASTCALL WU32GetCaretBlinkTime(PVDMFRAME pFrame);
ULONG FASTCALL WU32GetCaretPos(PVDMFRAME pFrame);
ULONG FASTCALL WU32HideCaret(PVDMFRAME pFrame);
ULONG FASTCALL WU32SetCaretBlinkTime(PVDMFRAME pFrame);
ULONG FASTCALL WU32SetCaretPos(PVDMFRAME pFrame);
ULONG FASTCALL WU32ShowCaret(PVDMFRAME pFrame);
