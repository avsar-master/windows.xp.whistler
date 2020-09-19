@rem
@rem This renames CairoDirectories
@rem

@echo off
if not "%Verbose%"=="" echo on

if "%1" == "back" goto back

ren %_XPDRIVE%\xp\neptune\nt1ole    nt1ole.sav
ren %_XPDRIVE%\xp\neptune\types     types.sav
ren %_XPDRIVE%\xp\neptune\ctypes    ctypes.sav
ren %_XPDRIVE%\xp\neptune\ofs	    ofs.sav
ren %_XPDRIVE%\xp\neptune\lnktrack  lnktrack.sav
ren %_XPDRIVE%\xp\neptune\common    common.sav
ren %_XPDRIVE%\xp\neptune\dsys	    dsys.sav
ren %_XPDRIVE%\xp\neptune\forms     forms.sav
ren %_XPDRIVE%\xp\neptune\cshell    cshell.sav
ren %_XPDRIVE%\xp\neptune\view	    view.sav
ren %_XPDRIVE%\xp\neptune\csetup    csetup.sav

goto done
:back
ren %_XPDRIVE%\xp\neptune\nt1ole.sav	   nt1ole
ren %_XPDRIVE%\xp\neptune\types.sav	   types
ren %_XPDRIVE%\xp\neptune\ctypes.sav	   ctypes
ren %_XPDRIVE%\xp\neptune\ofs.sav	   ofs
ren %_XPDRIVE%\xp\neptune\lnktrack.sav	   lnktrack
ren %_XPDRIVE%\xp\neptune\common.sav	   common
ren %_XPDRIVE%\xp\neptune\dsys.sav	   dsys
ren %_XPDRIVE%\xp\neptune\forms.sav	   forms
ren %_XPDRIVE%\xp\neptune\cshell.sav	   cshell
ren %_XPDRIVE%\xp\neptune\view.sav	   view
ren %_XPDRIVE%\xp\neptune\csetup.sav	   csetup

:done
