############################################################################
#
#   Microsoft Windows
#   Copyright (C) Microsoft Corporation, 2000 - 1993.
#   All rights reserved.
#
############################################################################

!include ..\..\idl\types.mk

TARGET	   = iballs.dll

TARGET_DESCRIPTION = "Cairole Proxy DLL"

RELEASE    = 0

COFFBASE   = piballs

CXXFILES   = \
	   .\transmit.cxx \
	   .\libmain.cxx


CFILES	   = \
	   $(OLE_BASE_TYPES:.type=_x.c) \
	   $(OLE_PROXYTYPES:.type=_p.c) \
	   .\dlldata.c \
	   .\dllentry.c

PXXFILE    = .\pch.cxx

NO_DEBUG   = 1

LIBS	   = $(BASEDIR)\neptune\sdk\lib\$(PLATFORM)\rpcproxy.lib \
	     $(BASEDIR)\neptune\sdk\lib\$(PLATFORM)\gdi32p.lib \
	     $(BASEDIR)\neptune\sdk\lib\$(PLATFORM)\uuid.lib \
	     $(OBJDIR)\uuid.lib  \
	     $(RPCLIBS) \
	     $(BASEDIR)\neptune\sdk\lib\$(PLATFORM)\ole32.lib

!include ..\..\makefile.inc
!include $(DEPENDFILE)
