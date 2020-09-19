@echo off
if "%1" == "" goto usage

echo Comparing x86 servers...
call combld \\xpretail\binaries  \\xpx862\freebins.%1 | qgrep xpx862 > %tmp%\x86fre.out
call combld \\ntx86bld\binaries  \\xpx862\chkbins.%1  | qgrep xpx862 > %tmp%\x86chk.out

echo Comparing MIPS servers...
call combld \\jazzfreebld\binaries \\xpjazz1\freebins.%1 | qgrep xpjazz1 > %tmp%\jazzfre.out
call combld \\jazzkylesh\binaries  \\xpjazz1\chkbins.%1  | qgrep xpjazz1 > %tmp%\jazzchk.out

echo Comparing Alpha servers...
call combld \\alphafree\binaries  \\xpalpha1\freebins.%1 | qgrep xpalpha1 > %tmp%\axpfree.out
call combld \\alphachk\binaries    \\xpalpha1\chkbins.%1 | qgrep xpalpha1 > %tmp%\axpchk.out
list %tmp%\*.out

goto end

:usage
echo.
echo usage: compbld buildnumber
:end
