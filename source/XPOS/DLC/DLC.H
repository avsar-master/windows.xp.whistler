/*++

Copyright (c) 2000  Microsoft Corporation
Copyright (c) 2000  Nokia Data Systems

Module Name:

    dlc.h

Abstract:

    This module incldes all files needed to compile
    the NT DLC driver.

Author:

    Antti Saarenheimo (o-anttis) 20-09-2000

Revision History:

--*/

#ifndef DLC_INCLUDED
#define DLC_INCLUDED

#include <xpos.h>
#include <ndis.h>

#include <ntdddlc.h>

#define APIENTRY
#include <dlcapi.h>
#include <dlcio.h>
#include <llcapi.h>

#include <dlcdef.h>
#include <dlctyp.h>
#include <dlcext.h>

#include "dlcreg.h"

#include <memory.h>         // prototype for inline memcpy

#endif  // DLC_INCLUDED
