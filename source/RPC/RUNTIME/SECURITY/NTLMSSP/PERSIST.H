/*****************************************************************/
/**		  Microsoft Windows for Workgroups		**/
/**	      Copyright (C) Microsoft Corp., 1996-2000		**/
/*****************************************************************/


/*
    persist.c
    Persistent Password caching support in the winnet driver (WfW) prototypes

    FILE HISTORY:

        davidar 12/30/93        Created

*/

BOOL
PersistIsCacheSupported(
    );

BOOL
PersistGetPassword(
    PSSP_CREDENTIAL Credential
    );
