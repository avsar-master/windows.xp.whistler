@echo off
REM
REM     NTLOG - Print out log of changes to source tree.
REM
REM     USAGE:  NTLOG <SLM switches>

setlocal
set _NTLOGLOG=\xp\ntlog.log
if "%_LOGFLAGS" == "" goto chkparam
goto doit
:chkparam
if "%1" == "" goto noflags
set _LOGFLAGS=%1
goto doit
:noflags
set _LOGFLAGS=it10-6@7:00
:doit
if "%2" == "all" goto logall
if NOT "%2" == "" goto nextproj
:logproj
if "%NTPROJECTS%" == "" goto defproj
cd \xp\public
call \xp\neptune\tools\ntlog.cmd %_LOGFLAGS% %NTPROJECTS% >%_NTLOGLOG%
cd \xp\public
goto done
:logall
if "%NTPROJECTS_EXTRA%" == "" goto logproj
cd \xp\public
call \xp\neptune\tools\ntlog.cmd %_LOGFLAGS% %NTPROJECTS% %NTPROJECTS_EXTRA% >%_NTLOGLOG%
cd \xp\public
goto done
:defproj
cd \xp\public
call \xp\neptune\tools\ntlog.cmd %_LOGFLAGS% public >%_NTLOGLOG%
cd \xp\public
goto done
:nextproj
if "%2" == "" goto done
set _NTPROJ=%2
shift
cd \xp\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trypriv
if NOT EXIST slm.ini goto trypriv
echo log -a%_LOGFLAGS% \NT\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:trypriv
cd \xp\neptune\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trywin
if NOT EXIST slm.ini goto trywin
echo log -a%_LOGFLAGS% \NT\PRIVATE\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:trywin
cd \xp\neptune\windows\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trygdi
if NOT EXIST slm.ini goto trygdi
echo log -a%_LOGFLAGS% \NT\PRIVATE\WINDOWS\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:trygdi
cd \xp\neptune\windows\gdi\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trypub
if NOT EXIST slm.ini goto trypub
echo log -a%_LOGFLAGS% \NT\PRIVATE\WINDOWS\GDI\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:trypub
cd \xp\neptune\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto tryxpos
if NOT EXIST slm.ini goto tryxpos
echo log -a%_LOGFLAGS% \NT\PUBLIC\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:tryxpos
cd \xp\neptune\xpos\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trymini
if NOT EXIST slm.ini goto trymini
echo log -a%_LOGFLAGS% \NT\PRIVATE\NTOS\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:trymini
cd \xp\neptune\xpos\miniport\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trynetui
if NOT EXIST slm.ini goto trynetui
echo log -a%_LOGFLAGS% \NT\PRIVATE\NTOS\MINIPORT\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:trynetui
if "%_NTPROJ%" == "netui" goto donetui
if "%_NTPROJ%" == "netUi" goto donetui
if "%_NTPROJ%" == "netUI" goto donetui
if "%_NTPROJ%" == "Netui" goto donetui
if "%_NTPROJ%" == "NetUi" goto donetui
if "%_NTPROJ%" == "NetUI" goto donetui
if "%_NTPROJ%" == "NETUI" goto donetui
if "%_NTPROJ%" == "netuiimp" goto donetuiimp
if "%_NTPROJ%" == "netUiImp" goto donetuiimp
if "%_NTPROJ%" == "netUIIMP" goto donetuiimp
if "%_NTPROJ%" == "Netuiimp" goto donetuiimp
if "%_NTPROJ%" == "NetUiImp" goto donetuiimp
if "%_NTPROJ%" == "NetUIIMP" goto donetuiimp
if "%_NTPROJ%" == "NETUIIMP" goto donetuiimp
if "%_NTPROJ%" == "vctools" goto dovctools
if "%_NTPROJ%" == "Vctools" goto dovctools
if "%_NTPROJ%" == "VCtools" goto dovctools
if "%_NTPROJ%" == "VCTools" goto dovctools
if "%_NTPROJ%" == "VCTOOLS" goto dovctools
goto badproj
:donetui
cd \xp\neptune\net\ui 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo log -a%_LOGFLAGS% \NT\PRIVATE\NET\UI project >con
log -a%_LOGFLAGS%
goto nextproj
:donetuiimp
cd \xp\neptune\net\ui\import 1>nul 2>nul
if ERRORLEVEL 1 goto trystreams
if NOT EXIST slm.ini goto trystreams
echo log -a%_LOGFLAGS% \NT\PRIVATE\NET\UI\IMPORT project >con
log -a%_LOGFLAGS%
goto nextproj
:trystreams
cd \xp\neptune\xpos\streams 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo log -a%_LOGFLAGS% \NT\PRIVATE\NTOS\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:dovctools
echo Enlisting in %1 project
cd \xp\neptune\sdktools\vctools 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo log -a%_LOGFLAGS% \NT\PRIVATE\NTOS\%_NTPROJ% project >con
log -a%_LOGFLAGS%
goto nextproj
:badproj
echo \NT\PRIVATE\%_NTPROJ% project does not exist. >con
goto nextproj
:done
endlocal
