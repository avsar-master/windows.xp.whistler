@setlocal
@if "%1" == "" goto bogus
cd \xp\neptune\sdk\lib
fcom /b %1\libcmt.lib \\orville\razzle\src\neptune\sdk\lib\%1\libcmt.lib
fcom /b %1\libc.lib \\orville\razzle\src\neptune\sdk\lib\%1\libc.lib
fcom /b %1\ntcrt.lib \\orville\razzle\src\neptune\sdk\lib\%1\ntcrt.lib
@goto done
:bogus
@echo usage: DIFFLIBS i386 | mips
:done
@endlocal
