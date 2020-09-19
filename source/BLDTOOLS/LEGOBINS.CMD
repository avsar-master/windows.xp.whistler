@rem
@rem updates legoized binaries to legobins directory
@rem

@echo off
if not "%Verbose%"=="" echo on

if not "%username%"=="xpretail" goto done
call legolist
upd /anf %XP_ROOT%\neptune\sdk\lib\i386 d:\legobins %legodllExt%                             | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\sdk\lib\i386 d:\legobins %legoexeExt%                             | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\sdk\lib\i386 d:\legobins %legosysExt%                             | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\sdk\lib\i386 d:\legobins %legodrvExt%                             | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\progman\obj\i386 d:\legobins %legodllExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\progman\obj\i386 d:\legobins %legoexeExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\progman\obj\i386 d:\legobins %legosysExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\progman\obj\i386 d:\legobins %legodrvExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\winfile\obj\i386 d:\legobins %legodllExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\winfile\obj\i386 d:\legobins %legoexeExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\winfile\obj\i386 d:\legobins %legosysExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\shell\winfile\obj\i386 d:\legobins %legodrvExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\lsa\server\obj\i386 d:\legobins %legodllExt%                     | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\lsa\server\obj\i386 d:\legobins %legoexeExt%                     | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\lsa\server\obj\i386 d:\legobins %legosysExt%                     | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\lsa\server\obj\i386 d:\legobins %legodrvExt%                     | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\spooler\spoolss\server\obj\i386 d:\legobins %legodllExt% | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\spooler\spoolss\server\obj\i386 d:\legobins %legoexeExt% | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\spooler\spoolss\server\obj\i386 d:\legobins %legosysExt% | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\windows\spooler\spoolss\server\obj\i386 d:\legobins %legodrvExt% | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\afp\server\mp\obj\i386 d:\legobins %legodllExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\afp\server\mp\obj\i386 d:\legobins %legoexeExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\afp\server\mp\obj\i386 d:\legobins %legosysExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\afp\server\mp\obj\i386 d:\legobins %legodrvExt%          | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\atalk\driver\mp\obj\i386 d:\legobins %legodllExt%        | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\atalk\driver\mp\obj\i386 d:\legobins %legoexeExt%        | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\atalk\driver\mp\obj\i386 d:\legobins %legosysExt%        | qgrep -v "no source file matching"
upd /anf %XP_ROOT%\neptune\net\sfm\atalk\driver\mp\obj\i386 d:\legobins %legodrvExt%        | qgrep -v "no source file matching"
:done
