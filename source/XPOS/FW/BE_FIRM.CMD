echo off
goto start

/******************************************************************

NT/Alpha AXP firmware build script
Copyright (c) 1993  Digital Equipment Corporation

John DeRosa     16-July-2000


This will compile and link the NT/Alpha AXP firmware package.

At the moment this is geared to Jensen.


Parameters:

        -c      says to do a build -c.

*********************************************************************/


:start

rem
rem Define variables used in the build process.
rem

rem The top-level of the working NT sources directory tree.
set BuildPool=\nt



rem
rem Analyze command line parameters.
rem

set BuildSwitch=
if "%1"=="-c" set BuildSwitch=-c


rem
rem Build the firmware.
rem

echo *** Building bldr files... ***
cd %BuildPool%\neptune\xpos\bldr
build %BuildSwitch%
if not errorlevel 0 goto ERROREXIT

echo *** Building hal files... ***
cd %BuildPool%\neptune\xpos\nthals\hal0jens
build %BuildSwitch%
if not errorlevel 0 goto ERROREXIT

echo *** Building rtl files... ***
cd %BuildPool%\neptune\xpos\rtl
build %BuildSwitch%
if not errorlevel 0 goto ERROREXIT

echo *** Building fw files... ***
cd %BuildPool%\neptune\xpos\fw
build %BuildSwitch%
if not errorlevel 0 goto ERROREXIT

goto NORMALEXIT


rem
rem Here on some kind of error.
rem

:ERROREXIT

echo ???
echo ??? ERROR during build.  Build terminated with extreme prejudice.
echo ???




rem
rem Here to exit the procedure.
rem

:NORMALEXIT


copy %BuildPool%\neptune\xpos\bldr\build.log %BuildPool%\neptune\xpos\fw\be_firm.log
type %BuildPool%\neptune\xpos\nthals\hal0jens\build.log >> %BuildPool%\neptune\xpos\fw\be_firm.log
type %BuildPool%\neptune\xpos\rtl\build.log >> %BuildPool%\neptune\xpos\fw\be_firm.log
rem
rem type %BuildPool%\neptune\xpos\ke\build.log >> %BuildPool%\neptune\xpos\fw\be_firm.log
rem
type %BuildPool%\neptune\xpos\fw\build.log >> %BuildPool%\neptune\xpos\fw\be_firm.log

echo *** Build done.  Look in fw\be_firm.log for merged build logs.
echo *** Check the obj\alpha area.

rem
rem return to the firmware directory
rem

cd %BuildPool%\neptune\xpos\fw

@echo on

