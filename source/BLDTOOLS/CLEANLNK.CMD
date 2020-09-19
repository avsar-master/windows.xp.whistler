@rem
@rem For Clean Linking the system
@rem

@echo off
if not "%Verbose%"=="" echo on

%_XPDRIVE%
cd \xp\neptune\sdk\lib
del /s /a-r **
call buildall b1
call buildall -l b1
cd \xp\neptune\sdktools\imagehlp
build -z
cd \xp\neptune\sdktools\cap\penter
build -z
cd \xp\neptune\sdktools\ntsd
build -z
cd \xp\neptune\utils\mep
build -z
cd \xp\neptune\mvdm
ren makefil0 mkfl
build -z
build -z
ren mkfl makefil0
cd \xp\neptune\posix\rtl
build -z
call buildall -l b2
call buildall -l b3
