/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    vendor.h

Abstract:

    The module includes the appropriate vendor header file.

Author:

    Jeff Havens  (jhavens) 20-June-2000

Revision History:


--*/

#if defined(SGI)
#include "s3scsi.h"
#else
#include "maynard.h"
#endif
