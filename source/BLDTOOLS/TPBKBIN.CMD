@echo off
if %1.==. goto usage
if %1.==?. goto usage
if %1.==-?. goto usage
if %1.==/?. goto usage
net use o: /delete
net use o: \\xpx861\freebins.%1
net use p: /delete
net use p: \\xpx861\chkbins.%1
net use q: /delete
net use q:  \\xpjazz1\freebins.%1
net use r: /delete
net use r: \\xpjazz1\chkbins.%1
net use s: /delete
net use s: \\xpalpha1\freebins.%1
net use t: /delete
net use t:  \\xpalpha1\chkbins.%1
net use u: /delete
net use u: \\xpx861\freepub.%1
net use v: /delete
net use v: \\xpx861\chkpub.%1
net use w: /delete
net use w: \\xpjazz1\freepub.%1
net use x: /delete
net use x: \\xpjazz1\chkpub.%1
net use y: /delete
net use y: \\xpalpha1\freepub.%1
net use z: /delete
net use z:  \\xpalpha1\chkpub.%1
xpbackup backup o: p: q: r: s: T: U: V: W: X: Y: Z: /v /HC:ON /D "Build %1 release binaries and publics"
net use o: /d
net use p: /d
net use q: /d
net use r: /d
net use s: /d
net use t: /d
net use u: /d
net use v: /d
net use w: /d
net use x: /d
net use y: /d
net use z: /d
goto done
:usage
echo USAGE: tpbkbin ^<Build#^>
:done

