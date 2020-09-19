/****************************** Module Header ******************************\
* Module Name: audit.h
*
* Copyright (c) 2000, Microsoft Corporation
*
* Defines utility routines that deal with the system audit log
*
* History:
* 12-09-91 Davidc       Created.
\***************************************************************************/

//
// Exported function prototypes
//


BOOL
GetAuditLogStatus(
    PGLOBALS
    );

BOOL
DisableAuditing(
    );
