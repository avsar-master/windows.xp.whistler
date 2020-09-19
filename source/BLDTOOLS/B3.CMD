@echo off
if NOT "%MIPS_R4000%" == "" set MIPSBUILD=mips
if "%1" == "-mips" set MIPSBUILD=mips
if "%1" == "-MIPS" set MIPSBUILD=mips
if "%2" == "-mips" set MIPSBUILD=mips
if "%2" == "-MIPS" set MIPSBUILD=mips

:setup
REM ****************************************************************************
REM *									       *
REM *									       *
REM *  Setup								       *
REM *									       *
REM *									       *
REM ****************************************************************************

cd \xp\neptune\xpos\arcinst\utils
build %1 %2 -Z
cd \xp\neptune\windows\setup
build %1 %2 -Z arctest

:posix
REM ****************************************************************************
REM *									       *
REM *									       *
REM *	POSIX								       *
REM *									       *
REM *									       *
REM ****************************************************************************

cd \xp\neptune\posix
build %1 %2 -Z

:fdisk
REM ****************************************************************************
REM *									       *
REM *									       *
REM *  FDISK								       *
REM *									       *
REM *									       *
REM ****************************************************************************

cd \xp\neptune\utils\fdisk
build %1 %2 -Z

:mvdm
REM ****************************************************************************
REM *									       *
REM *									       *
REM *	MVDM								       *
REM *									       *
REM *									       *
REM ****************************************************************************

cd \xp\neptune\mvdm
set BUILDOPTIONS=
if "%MIPSBUILD%" == "mips" goto 16bitmips
nmake -f makefil0

goto contmvdm
:16bitmips
cd \xp\neptune\mvdm\inc
nmake MIPS=1
cd \xp\neptune\mvdm\dpmi
nmake MIPS=1
cd ..

:contmvdm
ren makefil0 mkfl
build %1 %2 -Z	vdmredir
ren mkfl makefil0

cd \xp\neptune\mvdm\wow32
build -lZ

:windbg
REM ****************************************************************************
REM *									       *
REM *									       *
REM *	WINDBG								       *
REM *									       *
REM *									       *
REM ****************************************************************************

cd \xp\neptune\windbg
build %1 %2 -Z

:mailplus
REM ****************************************************************************
REM *									       *
REM *									       *
REM *	MAILPLUS							       *
REM *									       *
REM *									       *
REM ****************************************************************************

cd \xp\neptune\mailplus
build %1 %2 -Z

:video
REM ****************************************************************************
REM *									       *
REM *									       *
REM *	VIDEO DRIVERS							       *
REM *									       *
REM *									       *
REM ****************************************************************************

if "%MIPSBUILD%" == "mips" goto endvideo
cd \xp\neptune\xpos\video\vga

REM
echo building the non-int10 vga miniport driver
REM
setlocal
set C_DEFINES=-DNO_INT10_MODE_SET
build -cZ
endlocal

copy \xp\neptune\sdk\lib\i386\vga.sys \xp\neptune\sdk\lib\i386\vga_alt.sys
binplace \xp\neptune\sdk\lib\i386\vga_alt.sys

REM
echo build the standard vga miniport driver.
REM
setlocal
set C_DEFINES=
build -cZ
endlocal

cd \xp\neptune\xpos\video\compaq.qv
build -cl

REM cd \xp\neptune\xpos\video\et4000
REM 
REM REM
REM echo building the non-int10 et4000 miniport driver
REM REM
REM setlocal
REM set C_DEFINES=-DNO_INT10_MODE_SET
REM build -cZ
REM endlocal
REM 
REM copy \xp\neptune\sdk\lib\i386\et4000.sys \xp\neptune\sdk\lib\i386\et4k_alt.sys
REM binplace \xp\neptune\sdk\lib\i386\et4k_alt.sys
REM 
REM REM
REM echo build the standard et4000 miniport driver.
REM REM
REM setlocal
REM set C_DEFINES=
REM build -cZ
REM endlocal

:endvideo

:os2
REM ****************************************************************************
REM *									       *
REM *									       *
REM *  OS/2 subsystem							       *
REM *									       *
REM *									       *
REM ****************************************************************************

if "%MIPSBUILD%" == "mips" goto endos2
cd \xp\neptune\os2
build %1 %2 -Z
:endos2

:done
set MIPSBUILD=
@ECHO Done with B3! > C:\BldTools\B3Done.Tmp
