REM
REM  Set to your local copy of the import tree from \\flipper\wb\src\import
REM
set IMPORT=d:\xp\import

REM
REM  Not needed if running from RAZZLE screen group
REM
set BASEDIR=d:\nt

REM
REM  Set to your local copy of the common tree from \\flipper\wb\src\common
REM
REM  Note that I've copied it under my import tree
REM
set COMMON=d:\xp\import\common

REM
REM  This is Henry's TCP tree.  Note that you must also have built in this
REM  tree (we pick up the cxport.obj directly).
REM
set TCP=d:\xp\tcp

REM
REM  Point to the nbt project and the dhcp project, respectively
REM
set DHCP=d:\xp\neptune\net\sockets\tcpcmd\dhcp\client\vxd
set NBT=d:\xp\neptune\xpos\nbt

REM
REM  Points to the Snowball NDIS3 tree
REM
set NDIS3=d:\xp\import\ndis3

REM
REM  Points to the Chicago NDIS3 tree
REM
set NDIS31=d:\xp\import\ndis31


set DEFDIR=.
set DEFDRIVE=D:
set SLMREMOTE=\\flipper\wb\src
set BLDHOST=DOS

PATH=%IMPORT%\COMMON\BIN;%IMPORT%\c8386\BINR;%PATH%
