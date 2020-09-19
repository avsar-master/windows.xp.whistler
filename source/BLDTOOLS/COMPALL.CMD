@echo off
if "%1" == "" goto usage

echo Comparing x86 servers...
call compare \\xpx861\freebins.%1 \\xpx862\freebins.%1 \\xpx863\freebins.%1 \\xpx864\freebins.%1 \\xpx865\freebins.%1 > %tmp%\freebins.out
call compare \\xpx861\chkbins.%1  \\xpx862\chkbins.%1  \\xpx863\chkbins.%1  \\xpx864\chkbins.%1  \\xpx865\chkbins.%1  > %tmp%\chkbins.out
call compare \\xpx861\freepub.%1  \\xpx862\freepub.%1  \\xpx863\freepub.%1  \\xpx864\freepub.%1  \\xpx865\freepub.%1  > %tmp%\freepub.out
call compare \\xpx861\chkpub.%1   \\xpx862\chkpub.%1   \\xpx863\chkpub.%1   \\xpx864\chkpub.%1   \\xpx865\chkpub.%1   > %tmp%\chkpub.out
call compare \\xpx861\ascdfree.%1 \\xpx862\ascdfree.%1 \\xpx863\ascdfree.%1 \\xpx864\ascdfree.%1 \\xpx865\ascdfree.%1 > %tmp%\lmcdfree.out
call compare \\xpx861\ascdchk.%1  \\xpx862\ascdchk.%1  \\xpx863\ascdchk.%1  \\xpx864\ascdchk.%1  \\xpx865\ascdchk.%1  > %tmp%\lmcdchk.out
call compare \\xpx861\ntcdfree.%1 \\xpx862\ntcdfree.%1 \\xpx863\ntcdfree.%1 \\xpx864\ntcdfree.%1 \\xpx865\ntcdfree.%1 > %tmp%\ntcdfree.out
call compare \\xpx861\ntcdchk.%1  \\xpx862\ntcdchk.%1  \\xpx863\ntcdchk.%1  \\xpx864\ntcdchk.%1  \\xpx865\ntcdchk.%1  > %tmp%\ntcdchk.out

echo Comparing MIPS servers...
call compare \\xpjazz1\freebins.%1 \\xpjazz2\freebins.%1                                                             >> %tmp%\freebins.out
call compare \\xpjazz1\chkbins.%1  \\xpjazz2\chkbins.%1                                                              >> %tmp%\chkbins.out
call compare \\xpjazz1\freepub.%1  \\xpjazz2\freepub.%1                                                              >> %tmp%\freepub.out
call compare \\xpjazz1\chkpub.%1   \\xpjazz2\chkpub.%1                                                               >> %tmp%\chkpub.out
call compare \\xpjazz1\ascdfree.%1 \\xpjazz2\ascdfree.%1                                                             >> %tmp%\lmcdfree.out
call compare \\xpjazz1\ascdchk.%1  \\xpjazz2\ascdchk.%1                                                              >> %tmp%\lmcdchk.out
call compare \\xpjazz1\ntcdfree.%1 \\xpjazz2\ntcdfree.%1                                                             >> %tmp%\ntcdfree.out
call compare \\xpjazz1\ntcdchk.%1  \\xpjazz2\ntcdchk.%1                                                              >> %tmp%\ntcdchk.out

echo Comparing Alpha servers...
call compare \\xpalpha1\freebins.%1 \\xpalpha2\freebins.%1                                                           >> %tmp%\freebins.out
call compare \\xpalpha1\chkbins.%1  \\xpalpha2\chkbins.%1                                                            >> %tmp%\chkbins.out
call compare \\xpalpha1\freepub.%1  \\xpalpha2\freepub.%1                                                            >> %tmp%\freepub.out
call compare \\xpalpha1\chkpub.%1   \\xpalpha2\chkpub.%1                                                             >> %tmp%\chkpub.out
call compare \\xpalpha1\ascdfree.%1 \\xpalpha2\ascdfree.%1                                                           >> %tmp%\lmcdfree.out
call compare \\xpalpha1\ascdchk.%1  \\xpalpha2\ascdchk.%1                                                            >> %tmp%\lmcdchk.out
call compare \\xpalpha1\ntcdfree.%1 \\xpalpha2\ntcdfree.%1                                                           >> %tmp%\ntcdfree.out
call compare \\xpalpha1\ntcdchk.%1  \\xpalpha2\ntcdchk.%1                                                            >> %tmp%\ntcdchk.out
list %tmp%\*.out

goto end

:usage
echo.
echo usage: compall buildnumber
:end
