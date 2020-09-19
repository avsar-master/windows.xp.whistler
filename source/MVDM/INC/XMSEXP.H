/*++ BUILD Version: 0001
 *
 *  MVDM v1.0
 *
 *  Copyright (c) 2000, Microsoft Corporation
 *
 *  XMSEXP.H
 *  XMS exports
 *
 *  History:
 *  15-May-2000 Sudeep Bharati (sudeepb)
 *  Created.
--*/

extern BOOL XMSDispatch(ULONG iXMSSvc);
extern BOOL XMSInit(int argc, char *argv[]);

/*
 * handle for extended memory tracking.
 * this is used by DPMI on risc so that
 * DPMI and XMS can both allocate extended
 * memory
 */
extern PVOID ExtMemSA; 
