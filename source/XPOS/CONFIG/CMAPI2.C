/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    cmapi2.c

Abstract:

    This module contains CM level entry points for the registry,
    particularly those which we don't want to link into tools,
    setup, the boot loader, etc.

Author:

    Bryan M. Willman (bryanwi) 26-Jan-1993

Revision History:

--*/

#include "cmp.h"

#ifdef ALLOC_PRAGMA
#pragma alloc_text(PAGE,CmDeleteKey)
#endif


NTSTATUS
CmDeleteKey(
    IN PCM_KEY_BODY KeyBody
    )
/*++

Routine Description:

    Delete a registry key, clean up Notify block.

Arguments:

    KeyBody - pointer to key handle object

Return Value:

    NTSTATUS

--*/
{
    NTSTATUS    status;
    PCELL_DATA  ptarget;
    PHHIVE      Hive;
    HCELL_INDEX Cell;
    PCM_KEY_CONTROL_BLOCK   KeyControlBlock;


    CMLOG(CML_WORKER, CMS_CM) KdPrint(("CmDeleteKey\n"));

    CmpLockRegistryExclusive();

    //
    // If already marked for deletion, storage is gone, so
    // do nothing and return success.
    //
    KeyControlBlock = KeyBody->KeyControlBlock;
    if (KeyControlBlock->Delete == TRUE) {
        status = STATUS_SUCCESS;
        goto Exit;
    }

    ptarget = HvGetCell(KeyControlBlock->KeyHive,
                        KeyControlBlock->KeyCell);

    if ( ((ptarget->u.KeyNode.SubKeyCounts[Stable] +
           ptarget->u.KeyNode.SubKeyCounts[Volatile]) == 0) &&
         ((ptarget->u.KeyNode.Flags & KEY_NO_DELETE) == 0))
    {
        //
        // Cell is NOT marked NO_DELETE and does NOT have children
        // Send Notification while key still present, if delete fails,
        //   we'll have sent a spurious notify, that doesn't matter
        // Delete the actual storage
        //
        Hive = KeyControlBlock->KeyHive;
        Cell = KeyControlBlock->KeyCell;

        CmpReportNotify(
            KeyControlBlock->FullName,
            Hive,
            Cell,
            REG_NOTIFY_CHANGE_NAME
            );

        status = CmpFreeKeyByCell(Hive, Cell, TRUE);

        if (NT_SUCCESS(status)) {
            //
            // post any waiting notifies
            //
            CmpFlushNotify(KeyBody);

            //
            // Remove kcb from kcb list/tree, but do NOT
            // free its storage, CmDelete will do that when
            // the last refering handle is closed
            //
            CmpRemoveKeyControlBlock(KeyControlBlock);
            KeyControlBlock->KeyHive = NULL;
            KeyControlBlock->KeyCell = HCELL_NIL;

            KeyControlBlock->Delete = TRUE;
        }

    } else {

        status = STATUS_CANNOT_DELETE;

    }

Exit:
    CmpUnlockRegistry();
    return status;
}
