/*++

Copyright (c) 1993 Microsoft Corporation, Digital Equipment Corporation


Module Name:

    pcibus.c

Abstract:

    Platform-specific PCI bus routines

Author:

Environment:

    Kernel mode

Revision History:

    29-Apr-1994 James Livingston
        Adapted from Avanti module for Mikasa.

--*/

#include "halp.h"
#include "pci.h"
#include "pcip.h"
#include "machdep.h"

//
//  Reference variable that defines largest PCI bus number.
//
extern ULONG PCIMaxBus;


PCI_CONFIGURATION_TYPES
HalpPCIConfigCycleType (
    IN ULONG BusNumber
    )
{
    if (BusNumber == 0) {
        return PciConfigType0;
    } else if (BusNumber < PCIMaxBus) {
        return PciConfigType1;
    } else {
        return PciConfigTypeInvalid;
    }
}

VOID
HalpPCIConfigAddr (
    IN ULONG            BusNumber,
    IN PCI_SLOT_NUMBER  Slot,
    PPCI_CFG_CYCLE_BITS pPciAddr
    )
{
    PCI_CONFIGURATION_TYPES ConfigType;

    ConfigType = HalpPCIConfigCycleType(BusNumber);

    if (ConfigType == PciConfigType0) {
        //
        // Initialize PciAddr for a type 0 configuration cycle
        //
        // Note that HalpValidPCISlot has already done bounds checking 
        // on DeviceNumber.
        //
        // PciAddr can be intialized for different bus numbers
        // with distinct configuration spaces here.
        //

        pPciAddr->u.AsULONG =  (ULONG) APECS_PCI_CONFIG_BASE_QVA;
        pPciAddr->u.AsULONG += ( (Slot.u.bits.DeviceNumber) << 11 );
        pPciAddr->u.bits0.FunctionNumber = Slot.u.bits.FunctionNumber;
        pPciAddr->u.bits0.Reserved1 = PciConfigType0;

#if HALDBG
        DbgPrint("HalpPCIConfigAddr: Type 0 PCI Config Access @ %x\n", 
                  pPciAddr->u.AsULONG);
#endif // DBG

    } else {
        //
        // Initialize PciAddr for a type 1 configuration cycle
        //
        //

        pPciAddr->u.AsULONG = (ULONG) APECS_PCI_CONFIG_BASE_QVA;
        pPciAddr->u.bits1.BusNumber = BusNumber;
        pPciAddr->u.bits1.FunctionNumber = Slot.u.bits.FunctionNumber;
        pPciAddr->u.bits1.DeviceNumber = Slot.u.bits.DeviceNumber;
        pPciAddr->u.bits1.Reserved1 = PciConfigType1;
        
#if HALDBG
        DbgPrint("Type 1 PCI Config Access @ %x\n", pPciAddr->u.AsULONG);
#endif // DBG
      
    }
    return;
}
