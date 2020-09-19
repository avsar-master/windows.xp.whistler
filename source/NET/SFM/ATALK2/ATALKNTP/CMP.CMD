
cl386 -nologo -I i386\ -I ..\..\h -I c:\ntdriver\neptune\inc -I c:\ntdriver\inc -I h -I ..\portable\h -I d:\xp\neptune\oak\inc -I d:\xp\neptune\sdk\inc -I d:\xp\neptune\sdk\inc\crt  -Di386=1 -DCONDITION_HANDLING=1 -DNT_UP=1 -DDBG -DNT_INST=0 -W3 /c /Zel %1
