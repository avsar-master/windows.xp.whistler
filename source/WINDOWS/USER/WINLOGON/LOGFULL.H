/****************************** Module Header ******************************\
* Module Name: logfull.h
*
* Copyright (c) 2000, Microsoft Corporation
*
* Define apis used to implement audit log full action dialog
*
* History:
* 5-6-92 DaveHart       Created.
\***************************************************************************/


//
// Exported function prototypes
//


DLG_RETURN_TYPE
LogFullAction(
    HWND     hwnd,
    PGLOBALS pGlobals,
    BOOL   * bAuditingDisabled);
