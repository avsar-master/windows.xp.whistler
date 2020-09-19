@echo off
if %1.==. goto usage
if %1.==?. goto usage
if %1.==-?. goto usage
if %1.==/?. goto usage
net use o: /delete
net use o: \\xpretail\bkup$
net use p: /delete
net use p: \\ntx86bld\bkup$
net use q: /delete
net use q:  \\jazzfreebld\bkup$
net use r: /delete
net use r: \\jazzkylesh\bkup$
net use s: /delete
net use s: \\alphafree\bkup$
net use t: /delete
net use t:  \\alphachk\bkup$

REM HACK due to tools for x86 being on x86chk instead of xpretail due to drive space
xpbackup backup o:\bldtools p:\tools o:\nt p:\xp\public q:\tools q:\xp\public r:\xp\public s:\tools s:\xp\public t:\xp\public /v /HC:ON /D "Build %1 sources, tools, and publics"
REM xpbackup backup o:\bldtools o:\tools o:\nt p:\xp\public q:\tools q:\xp\public r:\xp\public s:\tools s:\xp\public t:\xp\public /v /HC:ON /D "Build %1 sources, tools, and publics"
REM end of HACK - to undo, un-REM above line and delete rest of hack.

net use o: /d
net use p: /d
net use q: /d
net use r: /d
net use s: /d
net use t: /d
goto done
:usage
echo USAGE: tpbksrc ^<Build#^>
:done
