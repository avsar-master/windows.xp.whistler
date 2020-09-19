!IF 0

Copyright (c) 2000  Microsoft Corporation

Module Name:

    sources.

Abstract:

    This file specifies the target component being built and the list of
    sources files needed to build that component.  Also specifies optional
    compiler switches and libraries that are unique for the component being
    built.


Author:
 
    David Plummer (davepl)   19-Mar-94
 
        Modifed by via awk to include global project include file
        and to wrap precompiled header line within a conditional
        that can be set in this include file.

    Donna Liu (DonnaLi) 19-Dec-1993

!ENDIF


!include      ..\..\..\daytona.inc

INCLUDES=     ..\;..\..\..\oleprx32\daytona;..\..\..\common;..\..\..\..\..\cinc;

UMTYPE=       windows
UMENTRY=      winmain
UMAPPL=
UMTEST=
UMLIBS=	      ..\..\..\oleprx32\daytona\obj\*\uuid.lib	   \
	      ..\..\..\common\daytona\obj\*\servers.lib	   \
	      $(BASEDIR)\neptune\cairole\com\port\daytona\obj\*\port.lib   \
	      $(BASEDIR)\neptune\sdk\lib\*\uuid.lib	   \
	      $(BASEDIR)\neptune\sdk\lib\*\ole32.lib	   \
              $(BASEDIR)\neptune\sdk\lib\*\rpcndr.lib       \
              $(BASEDIR)\neptune\sdk\lib\*\rpcrt4.lib       \
              $(BASEDIR)\neptune\sdk\lib\*\rpcns4.lib       \
              $(BASEDIR)\neptune\sdk\lib\*\mpr.lib          \
              $(BASEDIR)\neptune\sdk\lib\*\netapi32.lib     \
              $(BASEDIR)\neptune\sdk\lib\*\kernel32.lib     \
	      $(BASEDIR)\neptune\sdk\lib\*\user32.lib	   \
	      $(BASEDIR)\neptune\sdk\lib\*\gdi32.lib	   \
	      $(BASEDIR)\neptune\sdk\lib\*\advapi32.lib
