/****************************** Module Header ******************************\
* Module Name: keybrdc.c
*
* Copyright (c) 1985-93, Microsoft Corporation
*
* History:
* 11-11-90 DavidPe      Created.
* 13-Feb-2000 mikeke    Added Revalidation code (None)
* 12-Mar-1993 JerrySh   Pulled functions from user\server.
\***************************************************************************/

#include "precomp.h"
#pragma hdrstop


/**************************************************************************\
* GetKBCodePage
*
* 28-May-2000 IanJa    Created
\**************************************************************************/

UINT GetKBCodePage(VOID)
{
    return GetOEMCP();

}
