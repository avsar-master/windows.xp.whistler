@echo off
setlocal
set _comment=%1
if '%_comment%' == '' set _comment="NTLOCK command script"
%_XPDRIVE%
cd \xp\public
cookie -w -c %_comment%
endlocal
