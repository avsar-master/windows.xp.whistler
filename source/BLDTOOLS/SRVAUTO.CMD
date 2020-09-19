@echo off
if "%binaries%"=="" goto notset
if "%cairobins%"=="" goto notset
if "%xp_root%"=="" goto notset
if "%bkupdrive%"=="" goto notset
if "%bindrive%"=="" goto notset


net share binaries=%binaries%
net share cairobin=%cairobins%
net share sources=%xp_root%
if %username%==xpretail net share legobins=%bindrive%\legobins
net share bkup$=%bkupdrive%

roshare -u redmond\richards xpwins\v-sjen "northamerica\nt group" xpwins\ntbuild "redmond\nt group" "northerneurope\nt group" "redmond\lonnym" -s binaries sources cairobin bkup$
goto done

:notset
echo Some of these environment variables not set:
echo BINARIES = %binaries%
echo CAIROBINS = %cairobins%
echo NT_ROOT = %xp_root%
echo BKUPDRIVE = %bkupdrive%
echo BINDRIVE = %bindrive%
:done
