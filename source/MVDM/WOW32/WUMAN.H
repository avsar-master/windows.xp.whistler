/*++ BUILD Version: 0001
 *
 *  WOW v1.0
 *
 *  Copyright (c) 2000, Microsoft Corporation
 *
 *  WUMAN.H
 *  WOW32 16-bit User API support (manually-coded thunks)
 *
 *  History:
 *  Created 27-Jan-2000 by Jeff Parsons (jeffpar)
--*/

typedef ULONG   (*WBP) (LPSTR, int, int, int);

ULONG FASTCALL   WU32FinalUserInit(PVDMFRAME pFrame);
ULONG FASTCALL   WU32ExitWindows(PVDMFRAME pFrame);
ULONG FASTCALL   WU32NotifyWow(PVDMFRAME pFrame);
ULONG FASTCALL   WU32WordBreakProc(PVDMFRAME pFrame);
