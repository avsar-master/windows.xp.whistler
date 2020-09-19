SETLOCAL
%_XPDRIVE%

del \xp\neptune\windows\media\tools\build\buildwrn.*
del \xp\neptune\windows\media\tools\build\builderr.*
del \xp\neptune\windows\media\tools\build\buildlog.*

cd\xp\neptune\windows\media
build %1 test mcitest
copy build.log \xp\neptune\windows\media\tools\build\buildlog.med
copy build.wrn \xp\neptune\windows\media\tools\build\buildwrn.med
copy build.err \xp\neptune\windows\media\tools\build\builderr.med

cd\xp\neptune\xpos\dd\sound
build %1
copy build.log \xp\neptune\windows\media\tools\build\buildlog.dd
copy build.wrn \xp\neptune\windows\media\tools\build\buildwrn.dd
copy build.err \xp\neptune\windows\media\tools\build\builderr.dd

cd\xp\neptune\windows\shell\control\multimed
build %1
copy build.log \xp\neptune\windows\media\tools\build\buildlog.mm
copy build.wrn \xp\neptune\windows\media\tools\build\buildwrn.mm
copy build.err \xp\neptune\windows\media\tools\build\builderr.mm

cd\xp\neptune\windows\shell\control\sound
build %1
copy build.log \xp\neptune\windows\media\tools\build\buildlog.snd
copy build.wrn \xp\neptune\windows\media\tools\build\buildwrn.snd
copy build.err \xp\neptune\windows\media\tools\build\builderr.snd

cd\xp\neptune\windows\shell\control\midi
build %1
copy build.log \xp\neptune\windows\media\tools\build\buildlog.mid
copy build.wrn \xp\neptune\windows\media\tools\build\buildwrn.mid
copy build.err \xp\neptune\windows\media\tools\build\builderr.mid

cd\xp\neptune\windows\shell\control\drivers
build %1
copy build.log \xp\neptune\windows\media\tools\build\buildlog.drv
copy build.wrn \xp\neptune\windows\media\tools\build\buildwrn.drv
copy build.err \xp\neptune\windows\media\tools\build\builderr.drv
ENDLOCAL
