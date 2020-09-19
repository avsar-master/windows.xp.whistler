############################################################################
#
#   Microsoft Windows
#   Copyright (C) Microsoft Corporation, 2000 - 1993.
#   All rights reserved.
#
############################################################################

!include ..\..\compobj\types.mk
!include ..\..\new_ole\types.mk
!include ..\..\oleauto\types.mk

RELEASE = 1

TARGET = uuid.lib

CFILES = \
        .\cguid_i.c             \
        $(COM_TYPES:.type=_i.c) \
        $(OLE_TYPES:.type=_i.c) \
        $(OLEAUTO_TYPES:.type=_i.c)

!ifndef _XPROOT
_XPROOT=\nt
!endif

!ifndef BASEDIR
BASEDIR=$(_NTDRIVE)$(_XPROOT)
!endif

LIBCOPY    = $(BASEDIR)\neptune\sdk\lib\$(PLATFORM)

NO_DEBUG   = 1

#MESSAGE_FILES=

!include ..\..\makefile.inc
!include $(DEPENDFILE)
