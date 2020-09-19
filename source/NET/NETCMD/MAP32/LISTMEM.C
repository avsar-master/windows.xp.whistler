/*++

Copyright (c) 1996-2000  Microsoft Corporation

Module Name:

    LISTMEM.C

Abstract:

    Contains functions for finding an item as member of a list

Author:

    Dan Hinsley    (danhi)  06-Jun-2000

Environment:

    User Mode - Win32

Revision History:

    28-Jul-2000     erichn
        new code

    18-Apr-2000     danhi
        32 bit NT version

    06-Jun-2000     Danhi
        Sweep to conform to NT coding style

    23-Oct-2000     W-ShankN
        Added Unicode mapping

    01-Oct-2000 JohnRo
        RAID 3556: Added NetpSystemTimeToGmtTime() for DosPrint APIs.

--*/

//
// INCLUDES
//

#include <windows.h>    // IN, LPTSTR, etc.

#include <netcons.h>
#include <neterr.h>
#include "netlib0.h"
#include <stdio.h>
#include <lui.h>
#include <apperr.h>
#include <apperr2.h>
#include <icanon.h>

#include <tstring.h>

#if !defined(NTENV)

/*
 *      USHORT LUI_ListMember( server, item, list, listType, member)
 *
 *      ENTRY
 *              server - server that calls should be remoted to, NULL for local
 *              item - item to look for in list
 *              list - list to look in
 *              listType - the name type of the list (NAMETYPE_PATH, etc.)
 *
 *      EXIT
 *              member - set to TRUE if item is in list, FALSE otherwise.
 *                      Only valid with NULL return value.
 *      RETURNS
 *              errors from I_NetListCanonicalize
 */

USHORT
LUI_ListMember(
    PTCHAR server,
    PTCHAR item,
    PTCHAR list,
    ULONG listType,
    PUSHORT member)
{
    TCHAR  tmpList[MAXPATHLEN];    /* temporary list buf         */
    LPTSTR listPtr;                /* ptr into tmp list          */
    LPTSTR element;                /* ptr to element in tmp list */
    ULONG types[64];               /* types for I_NetListCan     */
    ULONG canonFlags;              /* flags for I_NetListCan     */
    ULONG count;                   /* num elements in each list  */
    ULONG err;                     /* API return value           */
    ULONG result;                  /* result from I_NetObjCmp    */

    // Map to portable type.

    canonFlags = (listType | OUTLIST_TYPE_NULL_NULL |
                    INLC_FLAGS_MULTIPLE_DELIMITERS);

    /* first place list in null-null form for comparison */
    if (err = I_NetListCanonicalize(server,
                                    list,
                                    MY_LIST_DELIMITER_STR_UI,
                                    tmpList,
                                    DIMENSION(tmpList),
                                    &count,
                                    types,
                                    DIMENSION(types),
                                    canonFlags) )
    {
            return(LOWORD(err));
    }

    listPtr = tmpList;

    /* look for similar element in second list */
    while (element = I_NelistTraverse(NULL, &listPtr, 0L))
    {
        if (listType == NAMETYPE_PATH)
        {
            /* use PathCompare function */
            result = I_NetPathCompare(server,
                                      item,
                                      element,
                                      (ULONG) NULL,
                                      0L);
        }
        else
        {
            /* use NameCompare function */
            result = I_NetNameCompare(server,
                                      item,
                                      element,
                                      (USHORT) listType,
                                      0L);
        }
        if (!result)     /* found a match */
        {
            (*member) = TRUE;
            return NERR_Success; /* save time, break out of loop */
        }
    }
    /* match was NOT found */
    (*member) = FALSE;
    return NERR_Success;
}

#endif
