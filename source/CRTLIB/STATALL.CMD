@echo off
setlocal
set _statflags=-oabf$qcz
erase crtstat.log
cd \xp\neptune\crtlib
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\crt32
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\crt32st
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\crt32nt
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\crt32dll
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\crt32psx
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\fp32
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\fp32st
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\fp32nt
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
cd \xp\neptune\fp32dll
ech Checking status for
cd
status %_statflags% nul >>..\crtlib\crtstat.log
endlocal
