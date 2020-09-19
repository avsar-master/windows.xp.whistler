@echo off
setlocal
net use \\rastaman\ntwin
if ERRORLEVEL 1 goto noconn
cd \xp\neptune\oak\bin
ssync -! delbuild.cmd
cd \xp\neptune\tools
ssync -! fixslm.cmd ntenlist.cmd ntstat.cmd ntsync.cmd
cd \xp\neptune\windows
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin windows -firs
cd \xp\neptune\windows\base
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin base -firs
cd \xp\neptune\windows\console
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin console -firs
cd \xp\neptune\windows\wincon
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin wincon -firs
cd \xp\neptune\windows\gdi
mv disp displays
if ERRORLEVEL 1 goto skip1
echo \xp\neptune\windows\gdi\disp RENAMED to \xp\neptune\windows\gdi\displays
:skip1
cd \xp\neptune\windows\gdi
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin gdi -firs
cd \xp\neptune\windows\gdi\displays
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin displays -firs
cd \xp\neptune\windows\gdi\displays
echo Erasing BUILD.BIN files in \xp\neptune\windows\gdi\displays
call \xp\neptune\oak\bin\delbuild.cmd .
cd \xp\neptune\windows\gdi\printers
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin printers -firs
cd \xp\neptune\windows\user
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin user -firs
cd \xp\neptune\windows\shell
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin shell -firs
cd \xp\neptune\windows
mv nls winnls
if ERRORLEVEL 1 goto skip2
echo \xp\neptune\windows\nls RENAMED to \xp\neptune\windows\winnls
:skip2
cd \xp\neptune\windows\winnls
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin winnls -firs
cd \xp\neptune\windows\winnls
echo Erasing BUILD.BIN files in \xp\neptune\windows\winnls
call \xp\neptune\oak\bin\delbuild.cmd .
cd \xp\neptune\windows\media
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin media -firs
cd \xp\neptune\windows\spooler
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin spooler -firs
cd \xp\neptune\windows\cmd
call \xp\neptune\tools\fixslm.cmd \\rastaman\ntwin cmd -firs
echo **********************************************************
echo
echo Now change your NTPROJECTS environment variable to contain
echo the actual projects out of the windows tree that you want.
echo
echo Then restart all of your RAZZLE screen groups and then type
echo NTSYNC
echo
echo **********************************************************
goto done
:noconn
echo ***
echo *** UNABLE TO CONNECT TO \\rastaman\ntwin
echo ***
echo *** Try NET LOGON to logout and log back in and the retry this script
echo ***
:done
endlocal
