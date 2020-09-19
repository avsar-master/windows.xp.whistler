/* demdata.c - All the VDM instance Data.
 *
 * Sudeepb 06-Apr-2000 Created
 */

#include "dem.h"

/** VDM's DTA Address **/
ULONG  UNALIGNED *pulDTALocation; // Address in ntdos where DTA address is kept.


/** VDM's Current PDB **/

PUSHORT pusCurrentPDB;

/** SFT Chain Head **/

PDOSSF pSFTHead = NULL;

//
// address of extended error information in DOS data segment
//

PDEMEXTERR pExtendedError;
