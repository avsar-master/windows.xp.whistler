/*++ BUILD Version: 0001
 *
 *  WOW v1.0
 *
 *  Copyright (c) 2000, Microsoft Corporation
 *
 *  WUCURSOR.H
 *  WOW32 16-bit User API support
 *
 *  History:
 *  Created 07-Mar-2000 by Jeff Parsons (jeffpar)
--*/



ULONG FASTCALL WU32ClipCursor(PVDMFRAME pFrame);
ULONG FASTCALL WU32CreateCursor(PVDMFRAME pFrame);
ULONG FASTCALL WU32DestroyCursor(PVDMFRAME pFrame);
ULONG FASTCALL WU32LoadCursor(PVDMFRAME pFrame);
ULONG FASTCALL WU32SetCursor(PVDMFRAME pFrame);
ULONG FASTCALL WU32SetCursorPos(PVDMFRAME pFrame);
ULONG FASTCALL WU32ShowCursor(PVDMFRAME pFrame);
