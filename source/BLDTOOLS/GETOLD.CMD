@if "%MachineName%"=="alphachk"	  set GetOldSource=\\NTAlpha1\ChkBins.612
@if "%MachineName%"=="alphafree"   set GetOldSource=\\NTAlpha1\FreeBins.612
@if "%MachineName%"=="jazzkylesh"  set GetOldSource=\\NTJazz1\ChkBins.612
@if "%MachineName%"=="jazzfreebld" set GetOldSource=\\NTJazz1\FreeBins.612
@if "%MachineName%"=="ntx86bld"	  set GetOldSource=\\NTx861\ChkBins.612
@if "%MachineName%"=="xpretail"	  set GetOldSource=\\NTx861\FreeBins.612

rem MailPlus currently does not need to be copied.  This section has been left
rem in the script in case we need it later.
goto AfterMailPlus

:BeforeMailPlus
copy %GetOldSource%\xp\msmail32.ini                         %Binaries%\XP
copy %GetOldSource%\xp\schdpl32.ini                         %Binaries%\XP

copy %GetOldSource%\xp\dump\msft32.dll                      %Binaries%\XP\Dump
copy %GetOldSource%\xp\dump\PHONE32.dll                     %Binaries%\XP\Dump
copy %GetOldSource%\xp\dump\oof32.dll                       %Binaries%\XP\Dump
copy %GetOldSource%\xp\dump\tmpp.exe                        %Binaries%\XP\Dump

if "%XPDEBUG%"=="cvp" copy %GetOldSource%\xp\idw\SERT32.dll %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\TRNNCX32.dll                     %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\wizard32.dll                     %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\APPXEC32.dll                     %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\BCC32.dll                        %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\EMPTYW32.dll                     %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\FILTER32.dll                     %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\XENIX32.dll                      %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\XIMAIL32.dll                     %Binaries%\XP\IDW
copy %GetOldSource%\xp\idw\stringpp.exe                     %Binaries%\XP\IDW

copy %GetOldSource%\xp\system32\msrmnd32.exe                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\schdpl32.exe                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\trnsch32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MSSCHD32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\SCHMSG32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\IMPEXP32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\SENDFL32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\AB32.dll                    %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MAILM32.dll                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MAILSP32.exe                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MAPIXX.dll                  %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\Mapi32.dll                  %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MapiSrv.exe                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MSMAIL32.exe                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\MSSFS32.dll                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\PABNSP32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\STORE32.dll                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\vform32.dll                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\WGPOMG32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\DEMIL32.dll                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\FRAME32.dll                 %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\mspell32.dll                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\schdplus.hlp                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\msp32_am.lex                %Binaries%\XP\System32
copy %GetOldSource%\xp\system32\mapi.dll		    %Binaries%\XP\System32
:AfterMailPlus

:BeforeMPlay32
copy %GetOldSource%\NT\System32\MPlay32.Exe		    %Binaries%\XP\System32
:AfterMPlay32
