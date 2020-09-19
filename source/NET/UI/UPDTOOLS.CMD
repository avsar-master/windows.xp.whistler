@if "%_XPDRIVE%"=="" goto notdef
%_XPDRIVE%
if not "%BASEDIR%"=="" (cd %BASEDIR%\PUBLIC || goto dirfail)
if     "%BASEDIR%"=="" (cd \NT\PUBLIC || goto dirfail)
net use z: /d
net use z: \\NTFREE\SOURCES
@if errorlevel 1 goto netfail
tc /irt     z:\neptune\oak	      .\oak
tc /irt     z:\neptune\sdk\bin	      .\sdk\bin
tc /irt     z:\neptune\sdk\lib\i386    .\sdk\lib\i386
chmode -r                             .\sdk\lib\coffbase.txt
copy	    z:\neptune\sdk\lib\coffbase.txt  .\sdk\lib
tc /irt     z:\neptune\sdk\inc	      .\sdk\inc
tc /irt     z:\neptune\tools	      .\tools
@goto done
:netfail
@echo ERROR: Unable to establish connection to \\NTFREE\SOURCES
@goto done
:dirfail
@echo ERROR: Unable to locate target subtree
@goto done
:notdef
@echo ERROR: _NTDRIVE environment variable is not defined
@goto done
:done
