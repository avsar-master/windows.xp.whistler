@echo off
setlocal
set _targetcpu=
if "%1" == "-alpha" set _targetcpu=alpha
if "%1" == "alpha" set _targetcpu=alpha
if "%1" == "ALPHA" set _targetcpu=alpha
if "%1" == "-mips" set _targetcpu=mips
if "%1" == "mips" set _targetcpu=mips
if "%1" == "MIPS" set _targetcpu=mips
if "%1" == "-i386" set _targetcpu=386
if "%1" == "-386" set _targetcpu=386
if "%1" == "386" set _targetcpu=386
if "%_targetcpu%" == "" goto bogus
call \xp\neptune\crtlib\ghostcrt.cmd mt  %_targetcpu%
call \xp\neptune\crtlib\ghostcrt.cmd nt  %_targetcpu%
call \xp\neptune\crtlib\ghostcrt.cmd st  %_targetcpu%
call \xp\neptune\crtlib\ghostcrt.cmd dll %_targetcpu%
call \xp\neptune\crtlib\ghostcrt.cmd psx %_targetcpu%
call \xp\neptune\crtlib\ghostfp.cmd mt   %_targetcpu%
call \xp\neptune\crtlib\ghostfp.cmd nt   %_targetcpu%
call \xp\neptune\crtlib\ghostfp.cmd st   %_targetcpu%
call \xp\neptune\crtlib\ghostfp.cmd dll  %_targetcpu%
goto done
:bogus
echo Usage: GHOSTALL [MB] (386 or MIPS or ALPHA)
:done
endlocal
