setlocal
set include=d:\xp\neptune\sdk\inc\crt;d:\xp\neptune\sdk\inc
set lib=d:\xp\neptune\sdk\lib\mips;c:\585f\xp\neptune\sdk\lib\mips
cl -Fc -Zl -Ox -Zi -Bd powt.c /link -debug:full -debugtype:both -pdb:none ..\obj\mips\powm.obj libc.lib kernel32.lib
endlocal
