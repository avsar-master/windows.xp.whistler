@rem BinPlace everything into the Binaries tree.  Used after a clean build to
@rem ensure that all the necessary files end up in the right place.
@rem
@rem Where %1 = built
@rem	or %1 = notbuilt
@rem
@rem OrsonH, JasonS
@rem __________________________________________________________________________

@echo on
%_ntdrive%
setlocal
set PLATFORM=i386
if NOT "%MIPS_R4000%" == "" set PLATFORM=mips
if NOT "%JENSEN%"     == "" set PLATFORM=alpha
if "%PLATFORM%" == "mips" goto setmips
if "%PLATFORM%" == "alpha" goto setalpha
set BINTREE=%_NT386TREE%
goto skipset

:setmips
set BINTREE=%_NTMIPSTREE%
set MIPSBUILD=mips
goto skipset

:setalpha
set BINTREE=%_NTALPHATREE%
set MIPSBUILD=alpha

:skipset
set BINPLACEFLAGS=-x -s %BINTREE%\symbols
if not "%1" == "built" goto CommonNotBuilt

REM
REM BUILT fILES=========================================================
REM

binplace %BINPLACEFLAGS% \xp\neptune\csr\server\obj\%PLATFORM%\csrss.exe
binplace %BINPLACEFLAGS% \xp\neptune\eventlog\server\obj\%PLATFORM%\eventlog.dll
binplace %BINPLACEFLAGS% \xp\neptune\lsa\server\obj\%PLATFORM%\lsass.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\alarmops\obj\%PLATFORM%\msrmnd32.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\appops\obj\%PLATFORM%\schdpl32.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\fullmsp\obj\%PLATFORM%\TRNNCX32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\imexdll\obj\%PLATFORM%\wizard32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\ncmsp\obj\%PLATFORM%\trnsch32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\schedule\obj\%PLATFORM%\MSSCHD32.dll
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\src\sert\obj\%PLATFORM%\SERT32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\appexec\obj\%PLATFORM%\APPXEC32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\banmsg\obj\%PLATFORM%\SCHMSG32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\bcc\obj\%PLATFORM%\BCC32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\emptywb\obj\%PLATFORM%\EMPTYW32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\filter\obj\%PLATFORM%\FILTER32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\impexp\obj\%PLATFORM%\IMPEXP32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\msft\obj\%PLATFORM%\msft32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\newphone\obj\%PLATFORM%\PHONE32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\oof\obj\%PLATFORM%\oof32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\sendfile\obj\%PLATFORM%\SENDFL32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\custom\src\xenix\obj\%PLATFORM%\XENIX32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\ab\obj\%PLATFORM%\AB32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mailmgr\obj\%PLATFORM%\MAILM32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mailspl\obj\%PLATFORM%\MAILSP32.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mapi\obj\%PLATFORM%\MAPIXX.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mapicli\obj\%PLATFORM%\Mapi32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mapisrv\obj\%PLATFORM%\MapiSrv.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\msmail\obj\%PLATFORM%\MSMAIL32.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mssfs\obj\%PLATFORM%\MSSFS32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\pabnsp\obj\%PLATFORM%\PABNSP32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\store\obj\%PLATFORM%\STORE32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\vforms\obj\%PLATFORM%\vform32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\wgpomgr\obj\%PLATFORM%\WGPOMG32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\ximail\obj\%PLATFORM%\XIMAIL32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\tools\tmpp\obj\%PLATFORM%\tmpp.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\layers2\src\demilayr\obj\%PLATFORM%\DEMIL32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\layers2\src\framewrk\obj\%PLATFORM%\FRAME32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\layers2\tools\stringpp\obj\%PLATFORM%\stringpp.exe
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\spell\csapi\obj\%PLATFORM%\mspell32.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bde\obj\%PLATFORM%\bde.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\ieuvddex\obj\%PLATFORM%\ntvdm.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdd\samples\mscdex\vdd\obj\%PLATFORM%\vcdex.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdmutils\forcedos\obj\%PLATFORM%\forcedos.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdmutils\graftabl\obj\%PLATFORM%\GRAFTABL.COM
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdmutils\pifedit\obj\%PLATFORM%\pifedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdmutils\win\obj\%PLATFORM%\win.com
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\user\USER.EXE
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\user\USER.MAP
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\user\USER.SYM
binplace %BINPLACEFLAGS% \xp\neptune\net\bh\%PLATFORM%\*.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\bh\%PLATFORM%\*.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\bh\%PLATFORM%\*.sys
binplace %BINPLACEFLAGS% \xp\neptune\net\bh\%PLATFORM%\rnal.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\detect\misc\netflx\obj\%PLATFORM%\netflx.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\netcmd\netcmd\obj\%PLATFORM%\net1.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\netcmd\netuse\obj\%PLATFORM%\net.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\portuas\obj\%PLATFORM%\portuas.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\auth\client\obj\%PLATFORM%\rascauth.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\auth\server\obj\%PLATFORM%\rassauth.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\common\src\eventlog\msgdll\obj\%PLATFORM%\rasmsg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\newsrv\adminapi\obj\%PLATFORM%\rasadmin.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\newsrv\gtwyprxy\obj\%PLATFORM%\rasgprxy.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\newsrv\nbfcpdll\obj\%PLATFORM%\rasnbipc.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\newsrv\netbios\obj\%PLATFORM%\rasgtwy.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\newsrv\suprprxy\obj\%PLATFORM%\rassprxy.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\newsrv\suprv\obj\%PLATFORM%\rassrv.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\engine\obj\%PLATFORM%\RASPPPEN.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\nbfcp\obj\%PLATFORM%\rasnbfcp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\raschap\obj\%PLATFORM%\raschap.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\rasipcp\obj\%PLATFORM%\rasipcp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\rasiphlp\obj\%PLATFORM%\rasiphlp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\rasipxcp\obj\%PLATFORM%\rasipxcp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\raspap\obj\%PLATFORM%\raspap.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ppp\rasppp\obj\%PLATFORM%\rasppp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\rasfile\obj\%PLATFORM%\rasfil32.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\rasman\isdn32\obj\%PLATFORM%\isdn.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\rasman\rasman32\dll\obj\%PLATFORM%\rasman.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\rasman\rasman32\exe\obj\%PLATFORM%\rasman.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\rasman\rasmxs32\obj\%PLATFORM%\rasmxs.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\rasman\serial32\obj\%PLATFORM%\rasser.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\admin\rasadmin\rasadmin\obj\%PLATFORM%\rasadmin.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\perf\obj\%PLATFORM%\rasctrs.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\rasdial\src\obj\%PLATFORM%\rasdial.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\rasmon\obj\%PLATFORM%\rasmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\rasphone\src\obj\%PLATFORM%\rasphone.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\setup\digi\isdn\obj\%PLATFORM%\digiinst.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\setup\res\obj\%PLATFORM%\RASRES.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\setup\src\obj\%PLATFORM%\rascfg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\messages\obj\%PLATFORM%\sfmmsg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\server\obj\%PLATFORM%\sfmsrv.sys
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\service\client\obj\%PLATFORM%\sfmapi.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\service\server\obj\%PLATFORM%\SfmSvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\sfmctrs\obj\%PLATFORM%\sfmctrs.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\ui\afpmgr\obj\%PLATFORM%\sfmmgr.cpl
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\atalk\atkctrs\obj\%PLATFORM%\atkctrs.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\atalk\driver\obj\%PLATFORM%\sfmatalk.sys
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\atalk\messages\obj\%PLATFORM%\sfmatmsg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\atalk\sockets\obj\%PLATFORM%\sfmwshat.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\drivers\lt200\obj\%PLATFORM%\lt200.sys
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\macprint\monitor\obj\%PLATFORM%\sfmmon.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\macprint\pstodib\print\psexe\obj\%PLATFORM%\sfmpsexe.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\macprint\pstodib\print\psprint\%PLATFORM%\sfmpsprt.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\macprint\pstodib\psqfont\obj\%PLATFORM%\sfmpsfnt.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\macprint\pstodib\ti\pstodib\%PLATFORM%\sfmpsdib.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\macprint\spooler\obj\%PLATFORM%\sfmprint.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\setup\bins\obj\%PLATFORM%\sfmatcfg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\setup\bins\obj\%PLATFORM%\SFMRES.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\setup\bins\obj\%PLATFORM%\SFMUTIL.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\smbtrace\obj\%PLATFORM%\smbtrace.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\agent\mibcc\obj\%PLATFORM%\mibcc.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\agent\proxy\obj\%PLATFORM%\snmp.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\agent\snmptrap\obj\%PLATFORM%\snmptrap.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\agent\snmputil\obj\%PLATFORM%\snmputil.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\dhcpmib\obj\%PLATFORM%\dhcptst.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\mibs\mib.bin
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\arp\obj\%PLATFORM%\arp.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\finger\obj\%PLATFORM%\finger.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\ftp\obj\%PLATFORM%\ftp.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\ftpsvc\ftpctrs\obj\%PLATFORM%\ftpctrs.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\hostname\obj\%PLATFORM%\hostname.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\ipconfig\obj\%PLATFORM%\ipconfig.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\lprmon\lpq\obj\%PLATFORM%\lpq.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\lprmon\lpr\obj\%PLATFORM%\lpr.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\lprmon\lprhelp\obj\%PLATFORM%\lprhelp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\lprmon\monitor\obj\%PLATFORM%\lprmon.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\nbtinfo\obj\%PLATFORM%\nbtstat.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\netstat\obj\%PLATFORM%\netstat.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\rcp\obj\%PLATFORM%\rcp.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\rexec\obj\%PLATFORM%\rexec.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\route\obj\%PLATFORM%\route.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\rsh\obj\%PLATFORM%\rsh.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\strmdbg\obj\%PLATFORM%\strmdbg.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\tftp\obj\%PLATFORM%\tftp.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\wintel\obj\%PLATFORM%\telnet.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpsvcs\lpd\obj\%PLATFORM%\lpdsvc.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpsvcs\simptcp\obj\%PLATFORM%\simptcp.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpsvcs\tcpsvcs\obj\%PLATFORM%\tcpsvcs.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\wins\mib\obj\%PLATFORM%\winstst.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\wins\server\client\obj\%PLATFORM%\winscl.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\wins\server\server\nms\obj\%PLATFORM%\wins.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\wins\srvtst\net\obj\%PLATFORM%\winsdrv.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\at\atcmd\obj\%PLATFORM%\at.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\browser\client\obj\%PLATFORM%\browdeb.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\browser\client\obj\%PLATFORM%\browstat.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\logonsrv\server\obj\%PLATFORM%\nltest.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\msgsvc\server\obj\%PLATFORM%\msgsvc.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\ntlmssp\server\obj\%PLATFORM%\ssptest.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\rpl\convert\obj\%PLATFORM%\rplmgrd.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\rpl\rplcnv\obj\%PLATFORM%\rplcnv.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\rpl\rplinst\obj\%PLATFORM%\rplinst.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\rpl\server\obj\%PLATFORM%\rplsvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcdlls\upssvc\obj\%PLATFORM%\ups.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcimgs\at\obj\%PLATFORM%\atsvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\svcimgs\lmrepl\obj\%PLATFORM%\lmrepl.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\admin\eventvwr\eventvwr\obj\%PLATFORM%\eventvwr.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\admin\rplmgr\rplmgr\obj\%PLATFORM%\rplmgr.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\admin\server\bin\obj\%PLATFORM%\srvmgr.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\admin\server\cpl\obj\%PLATFORM%\srvmgr.cpl
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\admin\user\miniuser\obj\%PLATFORM%\musrmgr.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\admin\user\user\obj\%PLATFORM%\usrmgr.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\ftpmgr\cpl\obj\%PLATFORM%\ftpmgr.cpl
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\ftpmgr\ftpsmx\obj\%PLATFORM%\ftpsmx.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\ncpa\bin\obj\%PLATFORM%\ncpa.cpl
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\ncpa\ipx\bin\obj\%PLATFORM%\ipxcfg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\ncpa\tcpip\bin\obj\%PLATFORM%\tcpcfg.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\nwc\nwc\obj\%PLATFORM%\nwc.cpl
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\rhino\common\ipadrdll\obj\%PLATFORM%\ipadrdll.dll
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\rhino\dhcp\obj\%PLATFORM%\dhcpadmn.exe
binplace %BINPLACEFLAGS% \xp\neptune\net\ui\rhino\wins\obj\%PLATFORM%\winsadmn.exe
binplace %BINPLACEFLAGS% \xp\neptune\nt1ole\scm\daytona\obj\%PLATFORM%\scm.exe
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% \xp\neptune\xpos\arcinst\obj\alpha\arcinst.exe
if "%MIPSBUILD%" == ""     binplace %BINPLACEFLAGS% \xp\neptune\xpos\boot\bldr\obj\%PLATFORM%\ntldr
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% \xp\neptune\xpos\boot\bldr\obj\%PLATFORM%\osloader.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\xpos\boot\bldr\obj\%PLATFORM%\osloader.exe
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% \xp\neptune\xpos\boot\setup\obj\%PLATFORM%\setupldr.bin
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% \xp\neptune\xpos\setup\obj\%PLATFORM%\setupldr
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\xpos\setup\obj\%PLATFORM%\setupldr
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\digibrd\setupdll\obj\%PLATFORM%\dgconfig.dll
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\sound\jazz\obj\%PLATFORM%\jazzsnd.sys
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\sound\mipssnd\obj\%PLATFORM%\mipssnd.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\sound\mvaudio\obj\%PLATFORM%\MVAUDIO.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\sound\sbnew\obj\%PLATFORM%\sndblst.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\sound\soundsys\obj\%PLATFORM%\sndsys.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\sound\synth\obj\%PLATFORM%\synth.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\init\mp\obj\%PLATFORM%\ntkrnlmp.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\init\up\obj\%PLATFORM%\xposkrnl.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\miniport\trantor\exe\%PLATFORM%\t128.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\miniport\trantor\exe\%PLATFORM%\t13b.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\miniport\trantor\exe\%PLATFORM%\tmv1.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\ne3200\ne3200.bin
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\testprot\tpctl\obj\%PLATFORM%\tpctl.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\testprot\tpdiff.new\obj\%PLATFORM%\tpdiff.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\testprot\tpdrvr\obj\%PLATFORM%\tpdrvr.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\ubnei\ubnei.bin
binplace %BINPLACEFLAGS% \xp\neptune\xpos\streams\isotp\tp4serv\setup\obj\%PLATFORM%\plumbing.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\streams\mcsxns\ub\service\obj\%PLATFORM%\ubnbsvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\streams\mcsxns\xns\service\obj\%PLATFORM%\mcsxnsvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\streams\nwlink\ipx\service\obj\%PLATFORM%\nwlnksvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\streams\nwlink\ipxnb\service\obj\%PLATFORM%\nwnblink.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\tdi\isn\rip\obj\%PLATFORM%\isnrip.sys
binplace %BINPLACEFLAGS% \xp\neptune\xpos\tdi\isn\ipxroute\obj\%PLATFORM%\ipxroute.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\tdi\tcpip\utils\icmp\obj\%PLATFORM%\ping.exe
binplace %BINPLACEFLAGS% \xp\neptune\xpos\tdi\tcpip\utils\icmp\obj\%PLATFORM%\tracert.exe
binplace %BINPLACEFLAGS% \xp\neptune\nw\install\setupdll\obj\%PLATFORM%\nwcfg.dll
binplace %BINPLACEFLAGS% \xp\neptune\nw\nw16\drv\NETWARE.DRV
binplace %BINPLACEFLAGS% \xp\neptune\nw\nw16\tsr\obj\NW16.EXE
binplace %BINPLACEFLAGS% \xp\neptune\nw\service\nwsvc\obj\%PLATFORM%\nwsvc.exe
binplace %BINPLACEFLAGS% \xp\neptune\nw\vwipxspx\tsr\obj\VWIPXSPX.EXE
binplace %BINPLACEFLAGS% \xp\neptune\posix\programs\hello\obj\%PLATFORM%\psxhello.exe
binplace %BINPLACEFLAGS% \xp\neptune\posix\programs\pax\obj\%PLATFORM%\pax.exe
binplace %BINPLACEFLAGS% \xp\neptune\posix\programs\psxses\obj\%PLATFORM%\posix.exe
binplace %BINPLACEFLAGS% \xp\neptune\posix\psxss\obj\%PLATFORM%\psxss.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\locator\lib\%PLATFORM%\locator.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\midl20\lib\%PLATFORM%\midl.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\midlnew\erec\obj\%PLATFORM%\midleb.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\midlnew\pg\obj\%PLATFORM%\midlpg.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\midlnew\yacc\obj\%PLATFORM%\midlyacc.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\runtime\rpcepmpr\server\bin\%PLATFORM%\rpcss.exe
binplace %BINPLACEFLAGS% \xp\neptune\rpc\uuidgen\%PLATFORM%\uuidgen.exe
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\a2coff\obj\%PLATFORM%\a2coff.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\adduser\obj\%PLATFORM%\adduser.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\alias\obj\%PLATFORM%\alias.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\bin2c\obj\%PLATFORM%\bin2c.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\build\obj\%PLATFORM%\build.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cacls\obj\%PLATFORM%\cacls.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cap\capsetup\obj\%PLATFORM%\capsetup.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cap\dumpsrc\obj\%PLATFORM%\capdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cat\obj\%PLATFORM%\cat.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cfront\src\obj\%PLATFORM%\cfront.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\checkrel\obj\%PLATFORM%\checkrel.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\chkslm\obj\%PLATFORM%\chkslm.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\chmode\obj\%PLATFORM%\chmode.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\as0\obj\%PLATFORM%\as0.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\as1\obj\%PLATFORM%\as1.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\cfe\obj\%PLATFORM%\cfe.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\cfe\obj\%PLATFORM%\cpp.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\dis\obj\%PLATFORM%\dis.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\driver\obj\%PLATFORM%\cc.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\ugen\obj\%PLATFORM%\ugen.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\uopt\obj\%PLATFORM%\uopt.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\upas\obj\%PLATFORM%\upas.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cntfs\obj\%PLATFORM%\cntfs.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cntrtext\lodctr\obj\%PLATFORM%\lodctr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cntrtext\unlodctr\obj\%PLATFORM%\unlodctr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\compdir\obj\%PLATFORM%\compdir.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\compact\obj\%PLATFORM%\compact.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cp\obj\%PLATFORM%\cp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ddespy\obj\%PLATFORM%\ddespy.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\delnode\obj\%PLATFORM%\delnode.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\diff\obj\%PLATFORM%\diff.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\diskedit\obj\%PLATFORM%\diskedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\diskmon\obj\%PLATFORM%\diskmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\diskperf\obj\%PLATFORM%\diskperf.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\dlgedit\obj\%PLATFORM%\dlgedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\dosdev\obj\%PLATFORM%\dosdev.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\drwatson\obj\%PLATFORM%\drwtsn32.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\dskdump\obj\%PLATFORM%\dskdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\dskimage\obj\%PLATFORM%\dskimage.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\du\obj\%PLATFORM%\du.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\dumpgrp\obj\%PLATFORM%\dumpgrp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\dumpgrp\obj\%PLATFORM%\fix31grp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ech\obj\%PLATFORM%\ech.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\echotime\obj\%PLATFORM%\echotime.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\editreg\obj\%PLATFORM%\editreg.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\exp\obj\%PLATFORM%\exp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\fcom\obj\%PLATFORM%\fcom.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\fontedit\obj\%PLATFORM%\fontedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\gensrv\obj\%PLATFORM%\gensrv.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\gutils\obj\%PLATFORM%\gutils.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\hd\obj\%PLATFORM%\hd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\he\obj\%PLATFORM%\he.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\head\obj\%PLATFORM%\head.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\hextract\obj\%PLATFORM%\hextract.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\hsplit\obj\%PLATFORM%\hsplit.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagedit\obj\%PLATFORM%\imagedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\bind.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\binplace.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\checkfix.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\dbgdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\imagechk.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\rebase.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\smashlck.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\splitsym.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\undname.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagehlp\obj\%PLATFORM%\verfix.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\infilter\obj\%PLATFORM%\infilter.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ini\obj\%PLATFORM%\ini.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\kdexts\p_alpha\obj\%PLATFORM%\kdextalp.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\kdexts\p_i386\obj\%PLATFORM%\kdextx86.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\kdexts\p_mips\obj\%PLATFORM%\kdextmip.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\kernprof\obj\%PLATFORM%\kernprof.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\kill\obj\%PLATFORM%\empty.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\kill\obj\%PLATFORM%\kill.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\list\obj\%PLATFORM%\list.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\listmung\obj\%PLATFORM%\listmung.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\lztest\obj\%PLATFORM%\lztest.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\loc\obj\%PLATFORM%\loc.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ls\obj\%PLATFORM%\ls.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\makeani\obj\%PLATFORM%\makeani.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mapmsg\obj\%PLATFORM%\mapmsg.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mip2coff\obj\%PLATFORM%\mip2coff.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\lineedit.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\testctrl.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\TESTDLGS.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\testevnt.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\TESTSCRN.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\testvw32.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\lib\%PLATFORM%\ws1.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\ntdlgs\app\obj\%PLATFORM%\testdlgs.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\ntdrvr\src\obj\%PLATFORM%\testdrvr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\ntsnap\obj\%PLATFORM%\testscrn.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mttf\main\obj\%PLATFORM%\mttf.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mttf\setup\obj\%PLATFORM%\getmttf.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mttf\vwr\obj\%PLATFORM%\mttfvwr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\munge\obj\%PLATFORM%\munge.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mv\obj\%PLATFORM%\mv.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\netjoin\obj\%PLATFORM%\netjoin.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\newinvtp\obj\%PLATFORM%\winvtp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ntsd\%PLATFORM%kd\obj\%PLATFORM%\%PLATFORM%kd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ntsd\cdb\obj\%PLATFORM%\cdb.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ntsd\alphakd\obj\%PLATFORM%\alphakd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ntsd\i386kd\obj\%PLATFORM%\i386kd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ntsd\mipskd\obj\%PLATFORM%\mipskd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ntsd\ntsd\obj\%PLATFORM%\ntsd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\objdir\obj\%PLATFORM%\objdir.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\parcomp\obj\%PLATFORM%\parcomp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\parcomp\obj\%PLATFORM%\parsync.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\perfmon\obj\%PLATFORM%\perfmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\perfmtr\obj\%PLATFORM%\drivers.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\perfmtr\obj\%PLATFORM%\perfmtr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\perfmtr\obj\%PLATFORM%\pmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\perfmtr\obj\%PLATFORM%\poolmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\perfmtr\obj\%PLATFORM%\top.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ppr\obj\%PLATFORM%\ppr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\profile\obj\%PLATFORM%\profile.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\pstat\obj\%PLATFORM%\pcall.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\pstat\obj\%PLATFORM%\pstat.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\pview\obj\%PLATFORM%\pview.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\pviewer\obj\%PLATFORM%\pviewer.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\qgrep\obj\%PLATFORM%\qgrep.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\random\obj\%PLATFORM%\random.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rathole\obj\%PLATFORM%\rathole.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rcdump\obj\%PLATFORM%\rcdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rcpp\obj\%PLATFORM%\rcpp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\readline\obj\%PLATFORM%\readline.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\regdiff\obj\%PLATFORM%\regdiff.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\regini\obj\%PLATFORM%\regdmp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\regini\obj\%PLATFORM%\regini.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\regtogrp\obj\%PLATFORM%\regtogrp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\remote\obj\%PLATFORM%\remote.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rescan\obj\%PLATFORM%\rescan.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rescan\obj\%PLATFORM%\setpriv.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\resmon\obj\%PLATFORM%\objmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\resmon\obj\%PLATFORM%\resmon.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\restools\cvtres\obj\%PLATFORM%\cvtres.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\restools\rc\obj\%PLATFORM%\rc.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\restools\rltools\rlman\obj\%PLATFORM%\rlman.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rm\obj\%PLATFORM%\rm.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\roshare\obj\%PLATFORM%\roshare.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\secedit\app\obj\%PLATFORM%\secedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\secedit\dll\obj\%PLATFORM%\secedit.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\seclist\obj\%PLATFORM%\seclist.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\setlink\obj\%PLATFORM%\setlink.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\shutdown\obj\%PLATFORM%\shutdown.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\simbad\obj\%PLATFORM%\simbad.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\sleep\obj\%PLATFORM%\sleep.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\slmnew\slm\obj\%PLATFORM%\*.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\slmnew\util\obj\%PLATFORM%\cookie.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\slmnew\util\obj\%PLATFORM%\merge.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\slmnew\util\obj\%PLATFORM%\slmdiff.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\slmnew\util\obj\%PLATFORM%\unmerge.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\solidpp\obj\%PLATFORM%\solidpp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\spy\app\obj\%PLATFORM%\spy.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\spy\dll\obj\%PLATFORM%\hook.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\startpgm\obj\%PLATFORM%\startpgm.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\strings\obj\%PLATFORM%\strings.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\sync\obj\%PLATFORM%\sync.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\takeown\obj\%PLATFORM%\takeown.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\tc\obj\%PLATFORM%\tc.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\tee\obj\%PLATFORM%\tee.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\timer\obj\%PLATFORM%\ntimer.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\timer\obj\%PLATFORM%\timer.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\tlist\obj\%PLATFORM%\tlist.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\topdesk\app\obj\%PLATFORM%\topdesk.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\topdesk\dll\obj\%PLATFORM%\tophook.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\touch\obj\%PLATFORM%\touch.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\trans\obj\%PLATFORM%\trans.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\tz\obj\%PLATFORM%\tz.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\uixport\obj\%PLATFORM%\uixport.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\undel\obj\%PLATFORM%\undel.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\upd\obj\%PLATFORM%\upd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\updrn\obj\%PLATFORM%\updrn.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vadump\obj\%PLATFORM%\vadump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\cvdump\obj\%PLATFORM%\cvdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\cvpack\obj\%PLATFORM%\cvpack.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\link\coff\obj\%PLATFORM%\link.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\link\stubs\obj\%PLATFORM%\dumpbin.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\link\stubs\obj\%PLATFORM%\lib.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\link\stubs\obj\%PLATFORM%\link32.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\pdb\src\tools\pdbdump\obj\%PLATFORM%\pdbdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\mc\obj\%PLATFORM%\mc.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\nmake\obj\%PLATFORM%\nmake.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vdmperf\obj\%PLATFORM%\vdmperf.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vi\obj\%PLATFORM%\vi.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\walk\obj\%PLATFORM%\walk.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wap\convert\obj\%PLATFORM%\apf32cvt.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wap\dump\obj\%PLATFORM%\apf32dmp.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wc\obj\%PLATFORM%\wc.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wcshdr\obj\%PLATFORM%\wcshdr.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\where\obj\%PLATFORM%\where.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\winbench\obj\%PLATFORM%\winbench.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\windiff\windiff\obj\%PLATFORM%\windiff.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\winobj\obj\%PLATFORM%\winobj.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wintools\clb\obj\%PLATFORM%\clb.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wintools\ctl3d\dll\obj\%PLATFORM%\winmsd.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wintools\winmsd\obj\%PLATFORM%\winmsd.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wperf\obj\%PLATFORM%\wperf.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ws\obj\%PLATFORM%\ws.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wst\wstcat\obj\%PLATFORM%\wstcat.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wst\wstdump\obj\%PLATFORM%\wstdump.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wst\wstune\obj\%PLATFORM%\wstune.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\wzmail\mail1.0\obj\%PLATFORM%\wzmail.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\ync\obj\%PLATFORM%\ync.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\zoomin\obj\%PLATFORM%\zoomin.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\zwapi\obj\%PLATFORM%\zwapi.exe
binplace %BINPLACEFLAGS% \xp\neptune\sm\server\obj\%PLATFORM%\smss.exe
binplace %BINPLACEFLAGS% \xp\neptune\types\oleprx32\daytona\obj\%PLATFORM%\ole2pr32.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\aclconv\obj\%PLATFORM%\aclconv.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\attrib\obj\%PLATFORM%\attrib.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\autochk\daytona\obj\%PLATFORM%\autochk.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\autoconv\obj\%PLATFORM%\autoconv.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\chcp\obj\%PLATFORM%\chcp.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\chkdsk\obj\%PLATFORM%\chkdsk.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\comp\obj\%PLATFORM%\comp.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\convert\obj\%PLATFORM%\convert.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\cudbfs\obj\%PLATFORM%\cudbfs.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\cufat\src\obj\%PLATFORM%\cufat.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\cuhpfs\obj\%PLATFORM%\cuhpfs.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\dblspace\obj\%PLATFORM%\dblspace.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\diskcomp\obj\%PLATFORM%\diskcomp.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\diskcopy\obj\%PLATFORM%\diskcopy.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\doskey\obj\%PLATFORM%\doskey.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\fc\obj\%PLATFORM%\fc.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\fdisk\obj\%PLATFORM%\windisk.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\find\obj\%PLATFORM%\find.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\findstr\obj\%PLATFORM%\findstr.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\fmifs\src\obj\%PLATFORM%\fmifs.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\format\obj\%PLATFORM%\format.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\getnt\dist\obj\%PLATFORM%\dist.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\getnt\getnt\obj\%PLATFORM%\getnt.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\help\obj\%PLATFORM%\help.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\ifsutil\src\obj\%PLATFORM%\ifsutil.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\keyb\obj\%PLATFORM%\keyb.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\label\obj\%PLATFORM%\label.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\filter\obj\%PLATFORM%\filter.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\justify\obj\%PLATFORM%\justify.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\mepparty\obj\%PLATFORM%\mepparty.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\mhelp\obj\%PLATFORM%\mhelp.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\pmatch\obj\%PLATFORM%\pmatch.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\tglcase\obj\%PLATFORM%\tglcase.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\ulcase\obj\%PLATFORM%\ulcase.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\extens\winclip\obj\%PLATFORM%\winclip.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\help\mshelp\obj\%PLATFORM%\mshelp.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\mep\src\obj\%PLATFORM%\mep.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\mode\obj\%PLATFORM%\mode.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\more\obj\%PLATFORM%\more.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\xpbackup\src\obj\%PLATFORM%\xpbackup.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\print\obj\%PLATFORM%\print.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\recover\obj\%PLATFORM%\recover.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\regedit\src\obj\%PLATFORM%\regedt32.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\replace\obj\%PLATFORM%\replace.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\restore\src\obj\%PLATFORM%\restore.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\sort\obj\%PLATFORM%\sort.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\subst\obj\%PLATFORM%\subst.exe
binplace %BINPLACEFLAGS% \xp\neptune\utils\tree\obj\%PLATFORM%\tree.com
binplace %BINPLACEFLAGS% \xp\neptune\utils\ufat\src\obj\%PLATFORM%\ufat.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\uhpfs\src\obj\%PLATFORM%\uhpfs.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\ulib\src\obj\%PLATFORM%\ulib.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\untfs\src\obj\%PLATFORM%\untfs.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\ureg\src\obj\%PLATFORM%\ureg.dll
binplace %BINPLACEFLAGS% \xp\neptune\utils\xcopy\obj\%PLATFORM%\xcopy.exe
binplace %BINPLACEFLAGS% \xp\neptune\windbg\dm\obj\%PLATFORM%\dm.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\dmkd\p_alpha\obj\%PLATFORM%\dmkdalp.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\dmkd\p_i386\obj\%PLATFORM%\dmkdx86.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\dmkd\p_mips\obj\%PLATFORM%\dmkdmip.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\eecxx\p_alpha\obj\%PLATFORM%\eecxxalp.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\eecxx\p_i386\obj\%PLATFORM%\eecxxx86.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\eecxx\p_mips\obj\%PLATFORM%\eecxxmip.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\em\p_alpha\obj\%PLATFORM%\emalp.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\em\p_i386\obj\%PLATFORM%\emx86.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\em\p_mips\obj\%PLATFORM%\emmip.dll
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% \xp\neptune\windbg\dm32s\obj\%PLATFORM%\dm32s.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\help\obj\windbg.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windbg\remote\pipe\obj\%PLATFORM%\tlpipe.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\remote\serial\obj\%PLATFORM%\tlser.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\remote\shell\obj\%PLATFORM%\windbgrm.exe
binplace %BINPLACEFLAGS% \xp\neptune\windbg\shcv\obj\%PLATFORM%\shcv.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\symcvt\symcvt\obj\%PLATFORM%\symcvt.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\symcvt\symedit\obj\%PLATFORM%\symedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\windbg\tlloc\obj\%PLATFORM%\tlloc.dll
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% \xp\neptune\windbg\tlremote\tlser32s\obj\%PLATFORM%\tlser32s.dll
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% \xp\neptune\windbg\win32s\shell\obj\%PLATFORM%\wdbg32s.exe
binplace %BINPLACEFLAGS% \xp\neptune\windbg\win32s\tlser\win32\obj\%PLATFORM%\tlser32.dll
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% \xp\neptune\windbg\win32s\tlser\win32s\obj\%PLATFORM%\tlser32s.dll
binplace %BINPLACEFLAGS% \xp\neptune\windbg\windbg\obj\%PLATFORM%\windbg.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\base\client\obj\%PLATFORM%\dh.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\cmd\obj\%PLATFORM%\cmd.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\aboutwep\obj\%PLATFORM%\aboutwep.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\carddll\obj\%PLATFORM%\cards.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\cruel\obj\%PLATFORM%\cruel.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\freecell\obj\%PLATFORM%\freecell.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\golf\obj\%PLATFORM%\golf.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\oldtp\obj\%PLATFORM%\taipei.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\pegged\obj\%PLATFORM%\pegged.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\snake\obj\%PLATFORM%\snake.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\tictac\obj\%PLATFORM%\tictac.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\winmine\obj\%PLATFORM%\winmine.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\apps\winbez\obj\%PLATFORM%\winbez.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\fonts\trmn\obj\%PLATFORM%\*.fon
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\test\ft\obj\%PLATFORM%\ft.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\tools\ntres\obj\%PLATFORM%\PlotGPC.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\codecs\%PLATFORM%\iccvid.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\lib\%PLATFORM%\mciavi32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\lib\%PLATFORM%\msvfw32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\lib\%PLATFORM%\msvidc32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\lib\%PLATFORM%\msrle32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\cdplayer\obj\%PLATFORM%\cdplayer.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\drivers\mvaudio\dll\obj\%PLATFORM%\MVAUDIO.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\drivers\sndsys32\dll\obj\%PLATFORM%\sndsys32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mcicda\obj\%PLATFORM%\mcicda.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mciseq\obj\%PLATFORM%\mciseq.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mciwave\obj\%PLATFORM%\mciwave.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mmdrv\obj\%PLATFORM%\mmdrv.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mplayer2\obj\%PLATFORM%\MPlay32.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\msacm\gsm610\obj\%PLATFORM%\msgsm610.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\msacm\imaadpcm\obj\%PLATFORM%\imaadpcm.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\msacm\msacm\msacm.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\msacm\msacmmap\obj\%PLATFORM%\msacm32.drv
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\msacm\msadpcm\obj\%PLATFORM%\msadpcm.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mvfs32\obj\%PLATFORM%\mvfs32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\sndblst\obj\%PLATFORM%\sndblst.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\sndvol\obj\%PLATFORM%\sndvol32.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\soundrec\obj\%PLATFORM%\SndRec32.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\synth\obj\%PLATFORM%\synth.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\netdde\src\ddeshare\obj\%PLATFORM%\ddeshare.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\netdde\src\nddeagnt\obj\%PLATFORM%\nddeagnt.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\netdde\src\ndeapi\server\obj\%PLATFORM%\nddeapir.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\netdde\src\netbios\obj\%PLATFORM%\netbios.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\netdde\src\netdde\obj\%PLATFORM%\netdde.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\screg\sc\bootok\obj\%PLATFORM%\bootok.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\screg\sc\bootvrfy\obj\%PLATFORM%\bootvrfy.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\screg\sc\server\daytona\obj\%PLATFORM%\services.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\autosetp\obj\%PLATFORM%\autosetp.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\acllist\obj\%PLATFORM%\acllist.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\cats\obj\%PLATFORM%\cats.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\dosnet\obj\%PLATFORM%\dosnet.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\infs\obj\%PLATFORM%\infs.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\layout\obj\%PLATFORM%\layout.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\makedisk\obj\%PLATFORM%\makedisk.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\acllist.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\cats.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\dosnet.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\infs.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\layout.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\makedisk.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\shares.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\obj\%PLATFORM%\size.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\share\obj\%PLATFORM%\shares.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\size\obj\%PLATFORM%\size.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\inf\newinf\ntcd\%PLATFORM%\*.inf
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\inf\newinf\ntcd\%PLATFORM%\*.txt
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\inf\newinf\ntcd\%PLATFORM%\txtsetup.sif
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\localinf\obj\%PLATFORM%\local.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\moricons\obj\%PLATFORM%\moricons.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\patch\obj\%PLATFORM%\update.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\patchdll\obj\%PLATFORM%\patchdll.dll 
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\setacl\obj\%PLATFORM%\setacl.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\setupdll\obj\%PLATFORM%\setupdll.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\src\obj\%PLATFORM%\setup.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\stripinf\obj\%PLATFORM%\stripinf.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\textmode\kernel\obj\%PLATFORM%\setupdd.sys
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\textmode\setupldr
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\textmode\user\obj\%PLATFORM%\usetup.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\winnt32\obj\%PLATFORM%\winnt32.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\calc\obj\%PLATFORM%\calc.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\cardfile\obj\%PLATFORM%\cardfile.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\clipbook\clipview\obj\%PLATFORM%\CLIPBRD.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\clipbook\datasrv\obj\%PLATFORM%\CLIPSRV.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\clock\obj\%PLATFORM%\clock.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\notepad\obj\%PLATFORM%\notepad.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\packager\obj\%PLATFORM%\packgr32.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\paintbrs\obj\%PLATFORM%\pbrush.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\spechars\obj\%PLATFORM%\charmap.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\terminal\obj\%PLATFORM%\terminal.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\unipad\obj\%PLATFORM%\unipad.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\accesory\winchat\bin\%PLATFORM%\winchat.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\cpanel\obj\%PLATFORM%\control.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\cursors\obj\%PLATFORM%\cursors.cpl
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\drivers\obj\%PLATFORM%\drivers.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\main\obj\%PLATFORM%\main.cpl
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\midi\obj\%PLATFORM%\midimap.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\multimed\obj\%PLATFORM%\multimed.cpl
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\bezier\obj\%PLATFORM%\ssbezier.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\default\obj\%PLATFORM%\scrnsave.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\logon\obj\%PLATFORM%\logon.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\marquee\obj\%PLATFORM%\ssmarque.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\mystify\obj\%PLATFORM%\ssmyst.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\stars\obj\%PLATFORM%\ssstars.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\sound\obj\%PLATFORM%\sound.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\ups\obj\%PLATFORM%\ups.cpl
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\video\obj\%PLATFORM%\display.cpl
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\convgrp\obj\%PLATFORM%\convgrp.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\games\reversi\obj\%PLATFORM%\reversi.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\games\sol\obj\%PLATFORM%\sol.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\grptoreg\obj\%PLATFORM%\grptoreg.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\lz\dos\compress\obj\%PLATFORM%\compress.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\lz\dos\expand\obj\%PLATFORM%\expand.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\progman\obj\%PLATFORM%\progman.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\taskman\obj\%PLATFORM%\taskman.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\upedit\obj\%PLATFORM%\upedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\winfile\obj\%PLATFORM%\winfile.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\winver\obj\%PLATFORM%\winver.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\printman\obj\%PLATFORM%\printman.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\spoolss\server\obj\%PLATFORM%\spoolss.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\user\kbdlyout\obj\%PLATFORM%\kbd*.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\user\kbdlyout\optlayts\obj\%PLATFORM%\kbd*.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\user\mpnotify\obj\%PLATFORM%\mpnotify.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\user\savedump\obj\%PLATFORM%\savedump.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\user\userinit\obj\%PLATFORM%\userinit.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\user\winlogon\daytona\obj\%PLATFORM%\winlogon.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\winhelp\ftengine\obj\%PLATFORM%\fteng32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\winhelp\ftui\obj\%PLATFORM%\ftui32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\winhelp\mvapi\obj\%PLATFORM%\mvapi32.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\winhelp\winhelp\obj\%PLATFORM%\winhlp32.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdk\lib\%PLATFORM%\*.dll
binplace %BINPLACEFLAGS% \xp\neptune\sdk\lib\%PLATFORM%\*.drv
binplace %BINPLACEFLAGS% \xp\neptune\sdk\lib\%PLATFORM%\*.sys
binplace %BINPLACEFLAGS% \xp\neptune\sdk\lib\%PLATFORM%\ntvdm.exe

REM
REM COPIED FILES========================================================
REM

:CommonNotBuilt
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bandit2\extern\usa\schdplus.hlp
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\msmail32.ini
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\schdpl32.ini
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\lang\usa\extern\msp32_am.lex
binplace %BINPLACEFLAGS% \xp\neptune\mailplus\bullet2\src\mapi16\mapi.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\*.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\autoexec.nt
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\config.nt
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\country.sys
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\lanman.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\regedit.hlp
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\regedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\sysedit.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\system.ini
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\winhelp.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\bin86\%PLATFORM%\*.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\backup\backup.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\graphics\GRAPHICS.PRO
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\edit.com
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\edit.hlp
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\gorilla.bas
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\money.bas
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\msherc.com
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\nibbles.bas
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\qbasic.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\qbasic.hlp
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\qbasic\remline.bas
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\softpc\data\cmos.ram
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\softpc\data\profile.spc
binplace %BINPLACEFLAGS% \xp\neptune\net\netcmd\net.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\common\inc\modem.inf
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\common\inc\pad.inf
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\common\inc\switch.inf
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\pcimac\idp_xfs.bin
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\admin\rasadmin\xlate\rasadmin.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\common\xlate\rasgloss.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\perf\rasctrnm.h
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\perf\rasctrs.ini
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\rasphone\xlate\rasphone.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\setup\rasread.txt
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\setup\xlate\rassetup.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\ras\src\ui\setup\digi\isdn\isdnhelp.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\sfmctrs\sfmctrnm.h
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\sfmctrs\sfmctrs.ini
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\afp\ui\xlate\sfmmgr.hlp
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\atalk\atkctrs\atkctrnm.h
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\atalk\atkctrs\atkctrs.ini
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\setup\infs\sfmicons.inf
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\setup\infs\sfmmap.inf
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\uam\sfmuam.ifo
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\uam\sfmuam.rsc
binplace %BINPLACEFLAGS% \xp\neptune\net\sfm\uam\sfmuam.txt
binplace %BINPLACEFLAGS% \xp\neptune\net\snmp\mibs\*.mib
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\hosts
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\hosts.shp
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\lmhosts
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\lmhosts.shp
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\lmhosts.sam
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\networks
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\protocol
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\quotes
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\inetdb\services
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\ftpsvc\ftpctrs\ftpctrs.h
binplace %BINPLACEFLAGS% \xp\neptune\net\sockets\tcpcmd\ftpsvc\ftpctrs\ftpctrs.ini
if not "%MIPSBUILD%" == "alpha" goto skippal
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\xpos\fw\alpha\pal\checked\*.pal
if "%XPDEBUG%" == ""	binplace %BINPLACEFLAGS% \xp\neptune\xpos\fw\alpha\pal\free\*.pal

:skippal
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\digibrd\images\*.bin
binplace %BINPLACEFLAGS% \xp\neptune\xpos\dd\digibrd\setupdll\dgconfig.hlp
binplace %BINPLACEFLAGS% \xp\neptune\xpos\ndis\netflex\netflx.bin
binplace %BINPLACEFLAGS% \xp\neptune\nw\install\wksta\nwperfm.h
binplace %BINPLACEFLAGS% \xp\neptune\nw\install\wksta\nwdoc.hlp
binplace %BINPLACEFLAGS% \xp\neptune\nw\install\wksta\nwperf.ini
binplace %BINPLACEFLAGS% \xp\neptune\oleutest\olebvt.cmd
binplace %BINPLACEFLAGS% \xp\neptune\oleutest\oleutest.cmd
binplace %BINPLACEFLAGS% \xp\neptune\posix\build.psx
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\c900\bin\*.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\c900\bin\*.err
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\c900\bin\*.dll
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\c900\bin\*.msg
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\sdktools\clmips\cfe\err.cc
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.exe
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.err
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.dll
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.msg
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\0readme
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.exe
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.err
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.dll
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.hlp
if "%MIPSBUILD%" == "alpha" binplace %BINPLACEFLAGS% c:\bldtools\cl\%PLATFORM%\*.msg
if "%MIPSBUILD%" == "alpha" copy c:\bldtools\cl\%PLATFORM%\*.txt                                               %BINTREE%\mstools
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cntrtext\perfini\perfc009.dat
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\cntrtext\perfini\perfh009.dat
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\imagedit\edithlp.hlp
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mstest\ntdrvr\src\mstest.hlp
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\mttf\main\mttf.ini
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\rcpp\rcpp.err
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\topdesk\app\topdesk.hlp
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\cvpack\obj\%PLATFORM%\cvpack.err
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\vctools\nmake\obj\%PLATFORM%\nmake.err
binplace %BINPLACEFLAGS% \xp\neptune\utils\help\doshelp.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windows\ep\freecell\freecell.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\fonts\*.cpi
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\fonts\*.fon
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\fonts\*.fot
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\fonts\*.ttf
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp20022\hp20022.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp20036\hp20036.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp60022\hp60022.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp60036\hp60036.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp650c22\hp650c22.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp650c36\hp650c36.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hp7550pl\hp7550pl.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hpdesign\hpdesign.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hpdmrxmx\hpdmrxmx.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hpdmsx\hpdmsx.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hpdpp22\hpdpp22.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hpdpp36\hpdpp36.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\msplot\mini\hpgl2pen\hpgl2pen.pcd
binplace %BINPLACEFLAGS% \xp\neptune\windows\gdi\printers\pscript\ppd\*.ppd
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\clock.avi
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\mciavi32\vfw16\*.dll
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\avi\mciavi32\vfw16\*.drv
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\mvopl3\mvopl3.pat
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\sounds\*.mid
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\sounds\*.wav
binplace %BINPLACEFLAGS% \xp\neptune\windows\media\synth\synth.pat
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\readme.txt
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\bom\wdl.trm
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\inf\beta\i386\*.bin
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\inf\beta\*.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\inf\beta\xports.inf
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\textmode\winnt\winnt.exe
binplace %BINPLACEFLAGS% \xp\neptune\windows\setup\textmode\kernel\setupreg.hiv
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\bitmaps\*.bmp
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\cursors\anis\*.ani
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\cursors\anis\*.cur
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\midi\midimap.cfg
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\control\scrnsave\black16.scr
binplace %BINPLACEFLAGS% \xp\neptune\windows\shell\progman\*.grp
copy	 %BINTREE%\system32\taskman.exe									       %BINTREE%
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\drivers.ini
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\localspl\pcl.sep
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\localspl\pscript.sep
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\localspl\pslanman.sep
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\localspl\sysprint.sep
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\monitors\hpmon\hpmon.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\monitors\decmon\help\DECPSMON.HLP
binplace %BINPLACEFLAGS% \xp\neptune\windows\spooler\printers.ini
binplace %BINPLACEFLAGS% \xp\neptune\windows\win.ini
binplace %BINPLACEFLAGS% \xp\neptune\windows\winfile.ini
binplace %BINPLACEFLAGS% \xp\neptune\windows\winhelp\hlp\rpc10wh.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windows\winhelp\hlp\winhelp.hlp
binplace %BINPLACEFLAGS% \xp\neptune\windows\winnls\data\*.nls
binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\%PLATFORM%\cmidl.exe
binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\%PLATFORM%\includes.exe
binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\%PLATFORM%\mktyplib.exe
binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\%PLATFORM%\sed.exe
binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\_default.pif
copy	\xp\neptune\oak\bin\setup16.inf									       %BINTREE%\system\setup.inf
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\jzsetup.exe
if "%MIPSBUILD%" == "mips" binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\arcinst.*
if "%MIPSBUILD%" == "" binplace %BINPLACEFLAGS% \xp\neptune\oak\bin\ntdetect.com
copy	\xp\neptune\oak\bin\regnet.ini									       %BINTREE%\registry.ini
binplace %BINPLACEFLAGS% \xp\neptune\sdk\bin\%PLATFORM%\*.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdk\bin\*.bat
binplace %BINPLACEFLAGS% \xp\neptune\sdk\bin\*.dat
binplace %BINPLACEFLAGS% \xp\neptune\sdk\bin\*.err
binplace %BINPLACEFLAGS% \xp\neptune\sdk\bin\*.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdk\bin\*.hlp
binplace %BINPLACEFLAGS% \xp\neptune\sdk\lib\system.mdb
binplace %BINPLACEFLAGS% \xp\neptune\sdk\lib\%PLATFORM%\crtdll.dll
binplace %BINPLACEFLAGS% \\ntbldsrv\release\betadem6\*
binplace %BINPLACEFLAGS% \\ntbldsrv\release\nt_help.fin\*
binplace %BINPLACEFLAGS% \\ntbldsrv\release\winhelp.hlp\*.hlp
binplace %BINPLACEFLAGS% \\ntbldsrv\release\netcon\%PLATFORM%\*.*
binplace %BINPLACEFLAGS% \\ntbldsrv\release\misc\16-bit\*
binplace %BINPLACEFLAGS% \\ntbldsrv\release\readme\*.wri
binplace %BINPLACEFLAGS% \\ntbldsrv\release\readme\*.txt
binplace %BINPLACEFLAGS% \\ntbldsrv\release\readme\readme
binplace %BINPLACEFLAGS% \\ntbldsrv\release\readme\setup.txt
binplace %BINPLACEFLAGS% \\ntbldsrv\release\reskit\%PLATFORM%\*.*
binplace %BINPLACEFLAGS% \\ntbldsrv\release\raid\*
binplace %BINPLACEFLAGS% \\romulus\daytona\xp\intel\sdk\*.hlp
binplace %BINPLACEFLAGS% \\romulus\daytona\xp\intel\sdk\*.hdx
binplace %BINPLACEFLAGS% \\romulus\daytona\xp\intel\sdk\*.ind
binplace %BINPLACEFLAGS% \\romulus\daytona\xp\intel\sdk\*.ini

@rem --------------------------------------------------------------------------
@rem This section needs to change when we start building these after beta.
net use \\BLW\Drop2 kjashbcd
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \\BLW\Drop2\OLE2Auto\oa94\081994.613\Debug\%Platform%\OLEAut32.DLL
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \\BLW\Drop2\OLE2Auto\oa94\081994.613\Debug\%Platform%\StdOLE32.TLb
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \\BLW\Drop2\OLE2Auto\oa94\081994.613\Retail\%Platform%\OLEAut32.DLL
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \\BLW\Drop2\OLE2Auto\oa94\081994.613\Retail\%Platform%\StdOLE32.TLb
net use \\BLW\Drop2 /d
@rem --------------------------------------------------------------------------

if "%MIPSBUILD%" == "mips" goto callmvdm
if "%MIPSBUILD%" == "alpha" goto callmvdm

if "%1" == "notbuilt" goto X86NotBuilt
REM
REM Built Files
REM
tc	 garbage											       %BINTREE%\wdl\video\avga
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\append\append.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\command\COMMAND.COM
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\debug\DEBUG.EXE
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\edlin\EDLIN.EXE
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\exe2bin\EXE2BIN.EXE
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\fastopen\FASTOPEN.EXE
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\graphics\GRAPHICS.COM
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\keyb\kb16.com
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\loadfix\LOADFIX.COM
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\mem\mem.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\nlsfunc\nlsfunc.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\setver\setver.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\cmd\share\share.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\dev\ansi\ansi.sys
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\dev\himem\himem.sys
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\dev\keyboard\KEYBOARD.SYS
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\doskrnl\bios\ntio.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\doskrnl\bios\ntio.sys
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\doskrnl\dos\ntdos.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\doskrnl\dos\ntdos.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\doskrnl\dos\ntdos.sys
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dos\v86\redir\obj\redir.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dpmi\dosx.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\dpmi\dosx.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\commdlg\commdlg.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\commdlg\commdlg.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\ddeml\retail\ddeml.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\ddeml\retail\ddeml.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\comm\comm.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\comm\comm.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\display\vga.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\display\vga.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\keyboard\keyboard.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\keyboard\KEYBOARD.SYM
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\mouse\mouse.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\mouse\mouse.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\sound\sound.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\drivers\sound\sound.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\gdi\gdi.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\gdi\gdi.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\gdi\gdi.sym
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\debug2\krnl286.exe
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\debug2\krnl286.map
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\debug2\krnl286.sym
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\debug3\krnl386.exe
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\debug3\krnl386.map
if "%XPDEBUG%" == "cvp" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\debug3\krnl386.sym
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\retail2\krnl286.exe
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\retail2\krnl286.map
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\retail2\krnl286.sym
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\retail3\krnl386.exe
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\retail3\krnl386.map
if "%XPDEBUG%" == "" binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\kernel31\retail3\krnl386.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\mciole\MCIOLE16.SYM
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\mciole\MCIOLE16.DLL
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\mmsystem\mmsystem.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\mmsystem\mmsystem.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\ole\server\retail\olesvr.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\ole\server\retail\olesvr.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\ole\server\retail\olesvr.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\shell\shell.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\shell\shell.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\sherlock\drwatson.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\system\system.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\system\system.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\test\shell\wowexec.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\test\shell\wowexec.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\timer\timer.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\timer\timer.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\toolhelp\toolhelp.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\toolhelp\toolhelp.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\toolhelp\toolhelp.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\user\user.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\user\user.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\user\user.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\wfwnet\wfwnet.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\wfwnet\wfwnet.drv
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\winsock\winsock.dll
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\winsock\winsock.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\winspool\winspool.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\winspool\winspool.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\wowdeb\wowdeb.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\wowdeb\wowdeb.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\wowdeb\wowdeb.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\write\write.exe
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\write\write.map
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\wow16\write\write.sym
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdd\samples\mscdex\tsr\MSCDEXNT.EXE
binplace %BINPLACEFLAGS% \xp\neptune\mvdm\vdd\samples\hpscan\hpscan16.sys
binplace %BINPLACEFLAGS% \xp\neptune\os2\os2ses\obj\%PLATFORM%\os2.exe
binplace %BINPLACEFLAGS% \xp\neptune\os2\os2ss\obj\%PLATFORM%\os2ss.exe
binplace %BINPLACEFLAGS% \xp\neptune\os2\server\obj\%PLATFORM%\os2srv.exe
binplace %BINPLACEFLAGS% \xp\neptune\sdktools\masm\obj\%PLATFORM%\masm386.exe

REM
REM Copied Files
REM

:X86NotBuilt
copy			 \xp\neptune\xpos\video\avga\oem_vid						       %BINTREE%\wdl\video\avga
copy			 \xp\neptune\xpos\video\avga\txtsetup.oem					       %BINTREE%\wdl\video\avga
copy			 \xp\neptune\xpos\video\avga\oemsetup.inf					       %BINTREE%\wdl\video\avga
binplace %BINPLACEFLAGS% \xp\neptune\os2\client\thunk\doscalls.dll
binplace %BINPLACEFLAGS% \xp\neptune\os2\client\thunk\netapi.os2
binplace %BINPLACEFLAGS% \xp\neptune\os2\msg\oso001.*
md													       %BINTREE%\system

goto end

:callmvdm
call getmvdm

:end
set MIPSBUILD=
set BINTREE=
set BINPLACEFLAGS=
set PLATFORM=
endlocal
