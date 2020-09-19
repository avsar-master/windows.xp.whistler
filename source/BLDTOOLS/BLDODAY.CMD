@rem
@rem BldODay batch
@rem

@echo off

if not "%Verbose%"=="" echo on

call c:\bldtools\local.cmd
if "%_XPDRIVE%" == "" echo Need to set _NTDRIVE && goto done

if "%1" == "" goto usage

if %1 == Monday    call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1
if %1 == Tuesday   call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1
if %1 == Wednesday call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1
if %1 == Thursday  call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1
if %1 == Friday    call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1
if %1 == Saturday  call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1
if %1 == Sunday    call %_XPDRIVE%\xp\neptune\tools\ntenv && goto %1

goto usage

REM ****************************************************************
REM             We build xpos, mailplus and utils on Monday
REM ****************************************************************
:Monday
%_XPDRIVE% && cd \xp\neptune\xpos
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\utils
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\mailplus
del /s /a-r **
build -Z

call buildall -l
call bldcairo

REM ****************************************************************
REM             We build Cairo and Ole stuff on Tuesday
REM ****************************************************************
goto done
:Tuesday

%_XPDRIVE% && cd \xp\neptune\types
del /s /a-r **
build -nmake clean
build -Z

%_XPDRIVE% && cd \xp\neptune\cairole
del /s /a-r **
build -Z

call bldcairo clean

REM ****************************************************************
REM		We build miscellaneous stuff Wednesday
REM ****************************************************************
goto done
:Wednesday

%_XPDRIVE% && cd \xp\neptune\csr
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\eventlog
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\lsa
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\newsam
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\nls
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\nlsecutl
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\nullsrv
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\nw
del /s /a-r **
build -Z

if not "%Processor_Architecture%" == "x86" goto skipOS2
%_XPDRIVE% && cd \xp\neptune\os2
del /s /a-r **
build -Z
:skipOS2

%_XPDRIVE% && cd \xp\neptune\posix
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\rpc
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\rpcutil
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\sdktools
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\sm
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\urtl
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\windbg
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\mvdm
del /s /a-r **
set BUILDOPTIONS=
if "%Processor_Architecture%" == "mips" goto 16bitmips
if "%Processor_Architecture%" == "alpha" goto 16bitalpha
nmake -f makefil0
if "%XPDEBUG%" == "cvp" binplace \xp\neptune\mvdm\wow16\kernel31\debug2\krnl286.exe
if "%XPDEBUG%" == "cvp" binplace \xp\neptune\mvdm\wow16\kernel31\debug2\krnl286.map
if "%XPDEBUG%" == "cvp" binplace \xp\neptune\mvdm\wow16\kernel31\debug2\krnl286.sym
if "%XPDEBUG%" == "cvp" binplace \xp\neptune\mvdm\wow16\kernel31\debug3\krnl386.exe
if "%XPDEBUG%" == "cvp" binplace \xp\neptune\mvdm\wow16\kernel31\debug3\krnl386.map
if "%XPDEBUG%" == "cvp" binplace \xp\neptune\mvdm\wow16\kernel31\debug3\krnl386.sym
if "%XPDEBUG%" == "" binplace \xp\neptune\mvdm\wow16\kernel31\retail2\krnl286.exe
if "%XPDEBUG%" == "" binplace \xp\neptune\mvdm\wow16\kernel31\retail2\krnl286.map
if "%XPDEBUG%" == "" binplace \xp\neptune\mvdm\wow16\kernel31\retail2\krnl286.sym
if "%XPDEBUG%" == "" binplace \xp\neptune\mvdm\wow16\kernel31\retail3\krnl386.exe
if "%XPDEBUG%" == "" binplace \xp\neptune\mvdm\wow16\kernel31\retail3\krnl386.map
if "%XPDEBUG%" == "" binplace \xp\neptune\mvdm\wow16\kernel31\retail3\krnl386.sym
cd \xp\neptune\mvdm\softpc\intel\roms
nmake

goto contmvdm
:16bitmips
cd \xp\neptune\mvdm\inc
nmake MIPS=1
cd \xp\neptune\mvdm\dpmi
nmake MIPS=1
cd ..\wow16\lib
nmake MIPS=1
cd ..\user
nmake MIPS=1
nmake MIPS=1 makefilc
cd ..\..
goto contmvdm

:16bitalpha
cd \xp\neptune\mvdm\inc
nmake ALPHA=1
cd \xp\neptune\mvdm\dpmi
nmake ALPHA=1
cd ..\wow16\lib
nmake ALPHA=1
cd ..\user
nmake ALPHA=1
nmake ALPHA=1 makefilc
cd ..\..
goto contmvdm

:contmvdm
cd \xp\neptune\mvdm
ren makefil0 mkfl 2>nul
build %1 %_BUILDFLAG%	vdmredir
ren mkfl makefil0

call buildall -l
call bldcairo

REM ****************************************************************
REM             We build Cairo amd Ole stuff on Thursday
REM ****************************************************************
goto done
:Thursday

%_XPDRIVE% && cd \xp\neptune\types
del /s /a-r **
build -nmake clean
build -Z

%_XPDRIVE% && cd \xp\neptune\cairole
del /s /a-r **
build -Z

call bldcairo clean

REM ****************************************************************
REM		We build the net on Friday
REM ****************************************************************
goto done
:Friday
%_XPDRIVE% && cd \xp\neptune\net
del /s /a-r **
build -Z

call buildall -l
call bldcairo

REM ****************************************************************
REM             We build Cairo and Ole stuff on Saturday
REM ****************************************************************
goto done
:Saturday

%_XPDRIVE% && cd \xp\neptune\types
del /s /a-r **
build -nmake clean
build -Z

%_XPDRIVE% && cd \xp\neptune\cairole
del /s /a-r **
build -Z

call bldcairo clean

REM ****************************************************************
REM             We build Windows on Sunday
REM ****************************************************************
goto done
:Sunday
%_XPDRIVE% && cd \xp\neptune\windows
del /s /a-r **
build -Z

%_XPDRIVE% && cd \xp\neptune\windows\setup
del /s /a-r **
build -Z

call buildall -l
call bldcairo

goto done
:usage
echo usage: %0 ^<Day of the Week^>

:done
