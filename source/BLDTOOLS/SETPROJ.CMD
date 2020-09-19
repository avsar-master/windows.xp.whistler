@rem
@rem where all good build options go to be accounted for
@rem

@echo off
if not "%Verbose%"=="" echo on

set xpprojects=arcinst
set xpprojects=%xpprojects% base
set xpprojects=%xpprojects% bh
set xpprojects=%xpprojects% cairole
set xpprojects=%xpprojects% cinc
set xpprojects=%xpprojects% cmd
set xpprojects=%xpprojects% decmon
set xpprojects=%xpprojects% displays
set xpprojects=%xpprojects% ep
set xpprojects=%xpprojects% eventlog
set xpprojects=%xpprojects% gdi
set xpprojects=%xpprojects% mailplus
set xpprojects=%xpprojects% media
set xpprojects=%xpprojects% mvdm
set xpprojects=%xpprojects% nbt
set xpprojects=%xpprojects% ncrdrive
set xpprojects=%xpprojects% net
set xpprojects=%xpprojects% netui
set xpprojects=%xpprojects% xpos
set xpprojects=%xpprojects% nw
set xpprojects=%xpprojects% nwc
set xpprojects=%xpprojects% ole
set xpprojects=%xpprojects% ole3
set xpprojects=%xpprojects% oleutest
set xpprojects=%xpprojects% opengl
set xpprojects=%xpprojects% posix
set xpprojects=%xpprojects% printers
set xpprojects=%xpprojects% private
set xpprojects=%xpprojects% public
set xpprojects=%xpprojects% ras
set xpprojects=%xpprojects% rpc
set xpprojects=%xpprojects% sdktools
set xpprojects=%xpprojects% setup
set xpprojects=%xpprojects% sfm
set xpprojects=%xpprojects% shell
set xpprojects=%xpprojects% sockets
set xpprojects=%xpprojects% spooler
set xpprojects=%xpprojects% streams
set xpprojects=%xpprojects% testprot
set xpprojects=%xpprojects% types
set xpprojects=%xpprojects% types2
set xpprojects=%xpprojects% user
set xpprojects=%xpprojects% utils
set xpprojects=%xpprojects% vctools
set xpprojects=%xpprojects% wincon
set xpprojects=%xpprojects% windbg
set xpprojects=%xpprojects% windows
set xpprojects=%xpprojects% winhelp
set xpprojects=%xpprojects% winnls

goto set%processor_architecture%

goto end
:setx86
set xpprojects=%xpprojects% halncr os2

goto end
:setmips
set xpprojects=%xpprojects%

goto end
:setalpha
set xpprojects=%xpprojects%

:end
