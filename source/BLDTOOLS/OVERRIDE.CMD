@echo off
REM This batch file is used to do the "manual overrides" for each build.
REM It is normally done just before getall.
REM

REM This section replaces current mail and sched+ binaries from 549
setlocal
if %processor_architecture%==x86 set mailshare=xpx861
if %processor_architecture%==MIPS set mailshare=xpjazz1
if %processor_architecture%==ALPHA set mailshare=xpalpha1
xcopy /s \\%mailshare%\mail.549 %binaries%\nt
endlocal
