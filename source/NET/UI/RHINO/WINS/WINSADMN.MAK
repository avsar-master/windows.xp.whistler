# Microsoft Visual C++ generated build script - Do not modify

PROJ = WINSADMN
DEBUG = 1
PROGTYPE = 0
CALLER = 
ARGS = 
DLLS = 
ORIGIN = MSVCNT
ORIGIN_VER = 1.00
PROJPATH = E:\NT\PRIVATE\NET\UI\RHINO\WINS\ 
USEMFC = 1
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = /YcSTDAFX.H
CUSEPCHFLAG = 
CPPUSEPCHFLAG = /YuSTDAFX.H
FIRSTC = 
FIRSTCPP = STDAFX.CPP
RC = rc
CFLAGS_D_WEXE32 = /nologo /W3 /Zi /D "_DEBUG" /D "_X86_" /D "_WINDOWS" /D "_WIN32" /D "_VC100" /I "E:\NT\PRIVATE\INC" /I "E:\NT\PRIVATE\NET\SOCKETS\WINS\SERVER" /I "E:\NT\PRIVATE\NET\SOCKETS\WINS\INC" /FR /MT /Fd"WINSADMN.PDB" /Fp"WINSADMN.PCH"
CFLAGS_R_WEXE32 = /nologo /W3 /Ox /D "NDEBUG" /D "_X86_" /D "_WINDOWS" /D "_WIN32" /D "_VC100" /I "E:\NT\PRIVATE\WINS\SERVER" /I "E:\NT\PRIVATE\INC" /I "E:\NT\PRIVATE\NET\SOCKETS\WINS\SERVER" /I "E:\NT\PRIVATE\NET\SOCKETS\WINS\INC" /FR /MT /Fp"WINSADMN.PCH"
LFLAGS_D_WEXE32 = /NOLOGO /MAP /DEBUG /DEBUGTYPE:cv /SUBSYSTEM:windows nafxcwd.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib olecli32.lib olesvr32.lib shell32.lib wsock32.lib largeint.lib
LFLAGS_R_WEXE32 = /NOLOGO /SUBSYSTEM:windows nafxcw.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib olecli32.lib olesvr32.lib shell32.lib wsock32.lib largeint.lib
LFLAGS_D_LIB32 = /NOLOGO
LFLAGS_R_LIB32 = /NOLOGO
LIBS_D_WEXE32 = 
LIBS_R_WEXE32 = 
RCFLAGS32 = /i \xp\neptune\sdk\inc
D_RCDEFINES32 = /d_DEBUG /d_WIN32 /d_VC100
R_RCDEFINES32 = /dNDEBUG /d_WIN32 /d_VC100
OBJS_EXT = 
LIBS_EXT = ..\COMMON\CLASSES\COMMON.LIB ..\COMMON\IPADDR\IPADDR.LIB ..\COMMON\IPADRDLL\IPADRDLL.LIB \
	..\..\..\..\..\PUBLIC\SDK\LIB\I386\WINSRPC.LIB 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_WEXE32)
LFLAGS = $(LFLAGS_D_WEXE32)
LIBS = $(LIBS_D_WEXE32)
LFLAGS_LIB=$(LFLAGS_D_LIB32)
MAPFILE_OPTION = 
RCDEFINES = $(D_RCDEFINES32)
!else
CFLAGS = $(CFLAGS_R_WEXE32)
LFLAGS = $(LFLAGS_R_WEXE32)
LIBS = $(LIBS_R_WEXE32)
MAPFILE_OPTION = 
LFLAGS_LIB=$(LFLAGS_R_LIB32)
RCDEFINES = $(R_RCDEFINES32)
!endif
SBRS = STDAFX.SBR \
		WINSADMN.SBR \
		MAINFRM.SBR \
		WINSADOC.SBR \
		STATISTI.SBR \
		CONNECTI.SBR \
		PREFEREN.SBR \
		LISTBOX.SBR \
		WINSSUP.SBR \
		CONFIGUR.SBR \
		REPLICAT.SBR \
		CONFIRMD.SBR \
		PULLPART.SBR \
		PUSHPART.SBR \
		ADDWINSS.SBR \
		GETIPADD.SBR \
		GETNETBI.SBR \
		ADDSTATI.SBR \
		EDITSTAT.SBR \
		STATICMA.SBR \
		VIEWMAPP.SBR \
		SETMAPPI.SBR \
		WINSFILE.SBR \
		SELECTWI.SBR


COMMON_DEP = 

IPADDR_DEP = 

IPADRDLL_DEP = 

WINSRPC_DEP = 

WINSADMN_RCDEP =  \
	e:\xp\neptune\net\ui\rhino\wins\res\winsadmn.ico \
	e:\xp\neptune\net\ui\rhino\wins\res\tombston.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\up.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\upfoc.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\updis.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\upinv.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\down.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\downfoc.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\downdis.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\downinv.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\server.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\partners.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\mappings.bmp \
	e:\xp\neptune\net\ui\rhino\wins\res\winsadmn.rc2


STDAFX_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h


WINSADMN_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadoc.h \
	e:\xp\neptune\net\ui\rhino\wins\statisti.h \
	e:\xp\neptune\net\ui\rhino\wins\selectwi.h \
	e:\xp\neptune\net\ui\rhino\wins\addstati.h \
	e:\xp\neptune\net\ui\rhino\wins\staticma.h


MAINFRM_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadoc.h \
	e:\xp\neptune\net\ui\rhino\wins\statisti.h \
	e:\xp\neptune\net\ui\rhino\wins\selectwi.h \
	e:\xp\neptune\net\ui\rhino\wins\preferen.h \
	e:\xp\neptune\net\ui\rhino\wins\connecti.h \
	e:\xp\neptune\net\ui\rhino\wins\confirmd.h \
	e:\xp\neptune\net\ui\rhino\wins\configur.h \
	e:\xp\neptune\net\ui\rhino\wins\replicat.h \
	e:\xp\neptune\net\ui\rhino\wins\staticma.h \
	e:\xp\neptune\net\ui\rhino\wins\viewmapp.h \
	e:\xp\neptune\net\ui\rhino\wins\winsfile.h


WINSADOC_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadoc.h


STATISTI_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\statisti.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadoc.h


CONNECTI_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\connecti.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadoc.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h


PREFEREN_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\preferen.h


LISTBOX_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h


WINSSUP_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\winsfile.h \
	e:\xp\neptune\net\ui\rhino\wins\addwinss.h


CONFIGUR_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\configur.h \
	e:\xp\neptune\net\ui\rhino\wins\winsfile.h


REPLICAT_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\replicat.h \
	e:\xp\neptune\net\ui\rhino\wins\confirmd.h \
	e:\xp\neptune\net\ui\rhino\wins\pullpart.h \
	e:\xp\neptune\net\ui\rhino\wins\pushpart.h \
	e:\xp\neptune\net\ui\rhino\wins\addwinss.h


CONFIRMD_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\confirmd.h


PULLPART_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\pullpart.h


PUSHPART_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\pushpart.h


ADDWINSS_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\addwinss.h \
	e:\xp\neptune\net\ui\rhino\wins\getipadd.h \
	e:\xp\neptune\net\ui\rhino\wins\getnetbi.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h


GETIPADD_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\getipadd.h


GETNETBI_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\getnetbi.h


ADDSTATI_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\addstati.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h


EDITSTAT_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\editstat.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadoc.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h


STATICMA_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\staticma.h \
	e:\xp\neptune\net\ui\rhino\wins\editstat.h \
	e:\xp\neptune\net\ui\rhino\wins\setmappi.h \
	e:\xp\neptune\net\ui\rhino\wins\confirmd.h


VIEWMAPP_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\viewmapp.h \
	e:\xp\neptune\net\ui\rhino\wins\editstat.h \
	e:\xp\neptune\net\ui\rhino\wins\setmappi.h


SETMAPPI_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\setmappi.h


WINSFILE_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\winsfile.h


SELECTWI_DEP =  \
	e:\xp\neptune\net\ui\rhino\wins\stdafx.h \
	e:\xp\neptune\net\ui\rhino\wins\winsadmn.h \
	d:\msvcnt\include\largeint.h \
	d:\msvcnt\include\lmerr.h \
	e:\xp\neptune\net\ui\rhino\common\inc\win16.h \
	e:\xp\neptune\inc\winsintf.h \
	e:\xp\neptune\net\ui\rhino\common\classes\common.h \
	e:\xp\neptune\net\ui\rhino\common\ipaddr\ipaddr.hpp \
	e:\xp\neptune\net\ui\rhino\wins\winssup.h \
	e:\xp\neptune\net\ui\rhino\wins\listbox.h \
	e:\xp\neptune\net\ui\rhino\wins\selectwi.h \
	e:\xp\neptune\net\ui\rhino\wins\confirmd.h \
	e:\xp\neptune\net\ui\rhino\wins\mainfrm.h \
	e:\xp\neptune\net\ui\rhino\wins\addwinss.h


all:	$(PROJ).EXE $(PROJ).BSC

WINSADMN.RES:	WINSADMN.RC $(WINSADMN_RCDEP)
	$(RC) $(RCFLAGS32) $(RCDEFINES) -r WINSADMN.RC

STDAFX.OBJ:	STDAFX.CPP $(STDAFX_DEP)
	$(CPP) $(CFLAGS) $(CPPCREATEPCHFLAG) /c STDAFX.CPP

WINSADMN.OBJ:	WINSADMN.CPP $(WINSADMN_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c WINSADMN.CPP

MAINFRM.OBJ:	MAINFRM.CPP $(MAINFRM_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c MAINFRM.CPP

WINSADOC.OBJ:	WINSADOC.CPP $(WINSADOC_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c WINSADOC.CPP

STATISTI.OBJ:	STATISTI.CPP $(STATISTI_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c STATISTI.CPP

CONNECTI.OBJ:	CONNECTI.CPP $(CONNECTI_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CONNECTI.CPP

PREFEREN.OBJ:	PREFEREN.CPP $(PREFEREN_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c PREFEREN.CPP

LISTBOX.OBJ:	LISTBOX.CPP $(LISTBOX_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c LISTBOX.CPP

WINSSUP.OBJ:	WINSSUP.CPP $(WINSSUP_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c WINSSUP.CPP

CONFIGUR.OBJ:	CONFIGUR.CPP $(CONFIGUR_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CONFIGUR.CPP

REPLICAT.OBJ:	REPLICAT.CPP $(REPLICAT_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c REPLICAT.CPP

CONFIRMD.OBJ:	CONFIRMD.CPP $(CONFIRMD_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CONFIRMD.CPP

PULLPART.OBJ:	PULLPART.CPP $(PULLPART_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c PULLPART.CPP

PUSHPART.OBJ:	PUSHPART.CPP $(PUSHPART_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c PUSHPART.CPP

ADDWINSS.OBJ:	ADDWINSS.CPP $(ADDWINSS_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c ADDWINSS.CPP

GETIPADD.OBJ:	GETIPADD.CPP $(GETIPADD_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c GETIPADD.CPP

GETNETBI.OBJ:	GETNETBI.CPP $(GETNETBI_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c GETNETBI.CPP

ADDSTATI.OBJ:	ADDSTATI.CPP $(ADDSTATI_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c ADDSTATI.CPP

EDITSTAT.OBJ:	EDITSTAT.CPP $(EDITSTAT_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c EDITSTAT.CPP

STATICMA.OBJ:	STATICMA.CPP $(STATICMA_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c STATICMA.CPP

VIEWMAPP.OBJ:	VIEWMAPP.CPP $(VIEWMAPP_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c VIEWMAPP.CPP

SETMAPPI.OBJ:	SETMAPPI.CPP $(SETMAPPI_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SETMAPPI.CPP

WINSFILE.OBJ:	WINSFILE.CPP $(WINSFILE_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c WINSFILE.CPP

SELECTWI.OBJ:	SELECTWI.CPP $(SELECTWI_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SELECTWI.CPP


$(PROJ).EXE:	WINSADMN.RES

$(PROJ).EXE:	STDAFX.OBJ WINSADMN.OBJ MAINFRM.OBJ WINSADOC.OBJ STATISTI.OBJ CONNECTI.OBJ \
	PREFEREN.OBJ LISTBOX.OBJ WINSSUP.OBJ CONFIGUR.OBJ REPLICAT.OBJ CONFIRMD.OBJ PULLPART.OBJ \
	PUSHPART.OBJ ADDWINSS.OBJ GETIPADD.OBJ GETNETBI.OBJ ADDSTATI.OBJ EDITSTAT.OBJ STATICMA.OBJ \
	VIEWMAPP.OBJ SETMAPPI.OBJ WINSFILE.OBJ SELECTWI.OBJ $(OBJS_EXT) $(LIBS_EXT)
	echo >NUL @<<$(PROJ).CRF
STDAFX.OBJ 
WINSADMN.OBJ 
MAINFRM.OBJ 
WINSADOC.OBJ 
STATISTI.OBJ 
CONNECTI.OBJ 
PREFEREN.OBJ 
LISTBOX.OBJ 
WINSSUP.OBJ 
CONFIGUR.OBJ 
REPLICAT.OBJ 
CONFIRMD.OBJ 
PULLPART.OBJ 
PUSHPART.OBJ 
ADDWINSS.OBJ 
GETIPADD.OBJ 
GETNETBI.OBJ 
ADDSTATI.OBJ 
EDITSTAT.OBJ 
STATICMA.OBJ 
VIEWMAPP.OBJ 
SETMAPPI.OBJ 
WINSFILE.OBJ 
SELECTWI.OBJ 
$(OBJS_EXT)
-OUT:$(PROJ).EXE
$(MAPFILE_OPTION)
..\COMMON\CLASSES\COMMON.LIB
..\COMMON\IPADDR\IPADDR.LIB
..\COMMON\IPADRDLL\IPADRDLL.LIB
..\..\..\..\..\PUBLIC\SDK\LIB\I386\WINSRPC.LIB
WINSADMN.RES

$(LIBS)
$(LIBS_EXT)
$(DEFFILE_OPTION) -implib:$(PROJ).lib
<<
	link $(LFLAGS) @$(PROJ).CRF

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
