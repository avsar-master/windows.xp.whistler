IF "%2"=="command1" GOTO TryAgain
%_XPDRIVE%
cd \xp\neptune\tools
call ntenv

:TryAgain
remote /c %1 %2
sleep 20
GOTO TryAgain
