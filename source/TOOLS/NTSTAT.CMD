@echo off
setlocal
set _NTSTATLOG=\xp\ntstat.log
set _NTSTATCMD=nul
if "%_NTSLMBACKUP%" == "" goto nobackup
set _NTSTATCMD=\xp\ntstatsr.cmd
:nobackup
if "%1" == "all" goto statall
if "%1" == "nolist" goto statproj
if NOT "%1" == "" goto nextproj
:statproj
if "%NTPROJECTS%" == "" goto defproj
erase %_NTSTATLOG%
erase %_NTSTATCMD%
if EXIST \xp\ntadddel.cmd copy \xp\ntadddel.cmd %_NTSTATLOG%
call \xp\neptune\tools\ntstat.cmd %NTPROJECTS%
goto dolist
:statall
if "%NTPROJECTS_EXTRA%" == "" goto statproj
erase %_NTSTATLOG%
erase %_NTSTATCMD%
if EXIST \xp\ntadddel.cmd copy \xp\ntadddel.cmd %_NTSTATLOG%
call \xp\neptune\tools\ntstat.cmd %NTPROJECTS% %NTPROJECTS_EXTRA%
goto dolist
:defproj
erase %_NTSTATLOG%
erase %_NTSTATCMD%
if EXIST \xp\ntadddel.cmd copy \xp\ntadddel.cmd %_NTSTATLOG%
call \xp\neptune\tools\ntstat.cmd public
goto dolist
:nextproj
if "%1" == "" goto done
set _NTPROJ=%1
shift
cd \xp\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trypriv
if NOT EXIST slm.ini goto trypriv
echo Status for \NT\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trypriv
cd \xp\neptune\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trywin
if NOT EXIST slm.ini goto trywin
echo Status for \NT\PRIVATE\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trywin
cd \xp\neptune\windows\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trygdi
if NOT EXIST slm.ini goto trygdi
echo Status for \NT\PRIVATE\WINDOWS\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trygdi
cd \xp\neptune\windows\gdi\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trypub
if NOT EXIST slm.ini goto trypub
echo Status for \NT\PRIVATE\WINDOWS\GDI\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trypub
cd \xp\neptune\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto tryxpos
if NOT EXIST slm.ini goto tryxpos
echo Status for \NT\PUBLIC\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:tryxpos
cd \xp\neptune\xpos\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trynthals
if NOT EXIST slm.ini goto trynthals
echo Status for \NT\PRIVATE\NTOS\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trynthals
cd \xp\neptune\xpos\nthals\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto xposmp
if NOT EXIST slm.ini goto xposmp
echo Status for \NT\PRIVATE\NTOS\NTHALS\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:xposmp
cd \xp\neptune\xposmp\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trynet
if NOT EXIST slm.ini goto trynet
echo Status for \NT\PRIVATE\NTOSMP\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trynet
cd \xp\neptune\net\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto sdktools
if NOT EXIST slm.ini goto sdktools
echo Status for \NT\PRIVATE\NET\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:sdktools
cd \xp\neptune\sdktools\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trymini
if NOT EXIST slm.ini goto trymini
echo Status for \NT\PRIVATE\SDKTOOLS\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trymini
cd \xp\neptune\xpos\miniport\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto tryquery
if NOT EXIST slm.ini goto tryquery
echo Status for \NT\PRIVATE\NTOS\MINIPORT\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:tryquery
cd \xp\neptune\ofs\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trymon
if NOT EXIST slm.ini goto trymon
echo Status for \NT\PRIVATE\OFS\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:trymon
cd \xp\neptune\windows\spooler\monitors\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto trynetui
if NOT EXIST slm.ini goto trynetui
echo Status for \NT\PRIVATE\WINDOWS\SPOOLER\MONITORS\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
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
goto netuiproj
:donetui
cd \xp\neptune\net\ui 1>nul 2>nul
if ERRORLEVEL 1 goto netuiproj
if NOT EXIST slm.ini goto netuiproj
echo Status for \NT\PRIVATE\NET\UI project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj
:donetuiimp
cd \xp\neptune\net\ui\import 1>nul 2>nul
if ERRORLEVEL 1 goto netuiproj
if NOT EXIST slm.ini goto netuiproj
echo Status for \NT\PRIVATE\NET\UI\IMPORT project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj

:netuiproj
cd \xp\neptune\net\ui\%_NTPROJ% 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo Status for \NT\PRIVATE\NET\UI\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj

:dovctools
cd \xp\neptune\sdktools\vctools 1>nul 2>nul
if ERRORLEVEL 1 goto badproj
if NOT EXIST slm.ini goto badproj
echo Status for \NT\PRIVATE\sdktools\%_NTPROJ% project
status -z %_NTSTATCMD% -ro%_STATOPTIONS% >>%_NTSTATLOG%
goto nextproj

:badproj
echo %_NTPROJ% project does not exist.
goto nextproj
:dolist
if "%1" == "nolist" goto done
@echo on
rem list \xp\ntstat.log
:done
@endlocal
