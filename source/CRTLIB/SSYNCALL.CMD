@echo off
setlocal
cd \xp\neptune\crt32nt
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\crt32
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\crt32st
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\crt32dll
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\crt32psx
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\fp32
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\fp32st
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\fp32nt
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\fp32dll
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
cd \xp\neptune\crtlib
ech Syncing
cd
ssync -aq%_SYNCOPTIONS%
endlocal
