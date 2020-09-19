rc -r -id:\softpc\host\inc -ic:\xp\neptune\sdk\inc -ic:\xp\neptune\sdk\inc\crt -di386 %1.rc
cvtres -i386 %1 -o %1.obj
chmode -r %1.obj
del %1.res
