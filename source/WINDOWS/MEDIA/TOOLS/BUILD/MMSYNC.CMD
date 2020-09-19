SETLOCAL
%_XPDRIVE%
cd\xp\neptune\windows\inc
ssync %1 %2 %3

cd\xp\neptune\windows\media
ssync -r %1 %2 %3

cd\xp\neptune\xpos\dd\sound
ssync -r %1 %2 %3

cd\xp\neptune\windows\shell
ssync -r %1 %2 %3

cd\xp\neptune\sdk\inc
ssync %1 %2 %3

ENDLOCAL
