@echo off
setlocal
if "%1" == "all" goto syncall
if NOT "%1" == "" goto nextproj
:syncproj
if "%NTPROJECTS%" == "" goto defproj
cd \xp\public
cookie -r -c "Autolock - (NTSYNC)"
call \xp\neptune\tools\ntsync.cmd %NTPROJECTS%
cd \xp\public
cookie -f
goto done
:syncall
if "%NTPROJECTS_EXTRA%" == "" goto syncproj
cd \xp\public
cookie -r -c "Autolock - (NTSYNC)"
call \xp\neptune\tools\ntsync.cmd %NTPROJECTS% %NTPROJECTS_EXTRA%
cd \xp\public
cookie -f
goto done
:defproj
cd \xp\public
cookie -r -c "Autolock - (NTSYNC)"
call \xp\neptune\tools\ntsync.cmd public
cd \xp\public
cookie -f
goto done
:nextproj
if "%1" == "" goto done
set _NTPROJ=%1
shift
cd \xp\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trypriv
if NOT EXIST slm.ini goto trypriv
echo Syncing \NT\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:trypriv
cd \xp\neptune\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trypub
if NOT EXIST slm.ini goto trypub
echo Syncing \NT\PRIVATE\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:trypub
cd \xp\neptune\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trywin
if NOT EXIST slm.ini goto trywin
echo Syncing \NT\PUBLIC\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:trywin
cd \xp\neptune\windows\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trygdi
if NOT EXIST slm.ini goto trygdi
echo Syncing \NT\PRIVATE\WINDOWS\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:trygdi
cd \xp\neptune\windows\gdi\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto tryxpos
if NOT EXIST slm.ini goto tryxpos
echo Syncing \NT\PRIVATE\WINDOWS\GDI\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:tryxpos
cd \xp\neptune\xpos\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trynet
if NOT EXIST slm.ini goto trymini
echo Syncing \NT\PRIVATE\NTOS\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:trynet
cd \xp\neptune\net\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trymini
if NOT EXIST slm.ini goto trymini
echo Syncing \NT\PRIVATE\NET\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:trymini
cd \xp\neptune\xpos\miniport\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto tryofs
if NOT EXIST slm.ini goto tryofs
echo Syncing \NT\PRIVATE\NTOS\MINIPORT\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
goto nextproj
:tryofs
cd \xp\neptune\ofs\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trynetui
if NOT EXIST slm.ini goto trynetui
echo Syncing \NT\PRIVATE\OFS\%_NTPROJ% project
ssync -r%_SYNCOPTIONS%
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
echo Syncing \NT\PRIVATE\NET\UI project
ssync -r%_SYNCOPTIONS%
goto nextproj
:donetuiimp
cd \xp\neptune\net\ui\import 1>nul 2>nul
if ERRORLEVEL 1 goto dostreams
if NOT EXIST slm.ini goto dostreams
echo Syncing \NT\PRIVATE\NET\UI\IMPORT project
ssync -r%_SYNCOPTIONS%
:dostreams
cd \xp\neptune\xpos\streams 1>nul 2>nul
if ERRORLEVEL 1 goto dosockets
if NOT EXIST slm.ini goto dosockets
echo Syncing \NT\PRIVATE\NTOS\STREAMS project
ssync -r%_SYNCOPTIONS%
goto nextproj
:dosockets
cd \xp\neptune\net\sockets 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo Syncing \NT\PRIVATE\NET\SOCKETS project
ssync -r%_SYNCOPTIONS%
goto nextproj

:dovctools
cd \xp\neptune\sdktools\vctools 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo Syncing \NT\PRIVATE\sdktools\vctools project
ssync -r%_SYNCOPTIONS%
goto nextproj

:badproj
echo \NT\PRIVATE\%_NTPROJ% project does not exist.
goto nextproj
:done
endlocal
