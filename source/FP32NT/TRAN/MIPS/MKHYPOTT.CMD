setlocal
set include=g:\585f\xp\neptune\sdk\inc\crt;g:\585f\xp\neptune\sdk\inc
set lib=g:\585f\xp\neptune\sdk\lib\mips
cl -Zl -Z7 -Od -Bd hypott.c /link -debug:full -debugtype:both -pdb:none ..\obj\mips\hypotm.obj libc.lib kernel32.lib
@rem cl -Zl -Z7 -Od -Bd hypott.c /link -debug:full -debugtype:both -pdb:none ..\obj\mips\hypot.obj libc.lib kernel32.lib
endlocal
