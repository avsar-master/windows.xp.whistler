@rem
@rem Cairo build and ssync script with pause after ctypes
@rem

@echo off
setlocal
REM debug commands to see if ever started.
echo Starting BldCtype.cmd >c:\bldcairo.log
echo. | date >>c:\bldcairo.log
echo. | time >>c:\bldcairo.log

if not "%Verbose%"=="" echo on

REM Set up razzle environment if not set
if not "%username%" == "" goto skipsetrazzle
call c:\bldtools\local.cmd
call %_XPDRIVE%\xp\neptune\tools\ntenv.cmd
:skipsetrazzle

set tempop=%build_options%
set tmp_build_mp=%build_multiprocessor%
set build_multiprocessor=
set build_options=%build_options% cairo

%_XPDRIVE% && cd \xp\neptune\sdk\inc\cairo
if "%1" == "ssync" ssync -rfq

%_XPDRIVE% && cd \xp\neptune\sdk\lib\cairo
if "%1" == "ssync" ssync -rfq

%_XPDRIVE% && cd \xp\neptune\cinc
if "%1" == "ssync" ssync -rfq

%_XPDRIVE% && cd \xp\neptune\ctypes
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if "%1" == "clean" build -nmake clean
if not "%2" == "only" build -Z
REM --------------------------------------------------
REM Temp work around for ctypes mysteriously failing
REM --------------------------------------------------
if not "%2" == "only" copy build.* \ctypes.*
if not "%2" == "only" build

echo ctypes built, press any key to continue with other project, ctrl-c to abort
pause
%_XPDRIVE% && cd \xp\neptune\sdktools\oletools
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\xpos\dll\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\windows\base\client\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\common
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\xpos\cairordr
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\xpos\cairosrv
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\nt2ole
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\utils\uofs
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z ofs

%_XPDRIVE% && cd \xp\neptune\ofs
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\utils\ofs
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\lnktrack
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\dsys
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\forms
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\cshell
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\sysmgmt
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z
REM --------------------------------------------------
REM Temp work around for ctypes mysteriously failing
REM --------------------------------------------------
if not "%2" == "only" copy build.* \sysmgmt.*
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\csetup
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\drt
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\windows\cairousr
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **

%_XPDRIVE% && cd \xp\neptune\windows\inc\cairo
if "%1" == "ssync" ssync -fq

%_XPDRIVE% && cd \xp\neptune\windows
if not "%2" == "only" nmake -f makefil0
%_XPDRIVE% && cd \xp\neptune\windows\cairousr
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\mvdm\wow16\user
if "%2" == "only" goto skipuser
if "%Processor_Architecture%" == "x86" nmake -f makefilc
if "%Processor_Architecture%" == "mips" nmake -f makefilc MIPS=1
if "%Processor_Architecture%" == "alpha" nmake -f makefilc ALPHA=1
:skipuser

%_XPDRIVE% && cd \xp\neptune\net\svcdlls\wkssvc\server\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\windows\screg\sc\server\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\windows\user\winlogon\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\windows\wincon\server\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\windows\winsrv\cairo
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

%_XPDRIVE% && cd \xp\neptune\oleutest
if "%1" == "ssync" ssync -rfq
if "%1" == "clean" del /s /a-r **
if not "%2" == "only" build -Z

REM debug commands to see when finished
echo. | date >>c:\bldcairo.log
echo. | time >>c:\bldcairo.log


set build_options=%tempop%
set build_multiprocessor=%tmp_build_mp%
set tmp_build_mp=
set tempop=
echo Done with BldCtype.cmd
echo Done with BldCtype.cmd >>c:\bldcairo.log
echo. | date >>c:\bldcairo.log
echo. | time >>c:\bldcairo.log
endlocal
