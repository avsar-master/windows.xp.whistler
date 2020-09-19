echo Sending symbol files to \\XPLab...
set TarDebug=Free
if "%NTDebug%"=="cvp" set TarDebug=Chk
Tar -cvf \\XPLab\SymTar\%Processor_Architecture%%TarDebug%1.Tar -C /Binaries/NT Symbols 2>&1 | Tee C:\BldTools\TarSyms.Log
Tar -cvf \\XPLab\SymTar\%Processor_Architecture%%TarDebug%2.Tar -C /Binaries/NT/mstools i386kd.exe mipskd.exe alphakd.exe kdextx86.dll kdextmip.dll kdextalp.dll 2>&1 | Tee -a C:\BldTools\TarSyms.Log
Tar -cvf \\XPLab\SymTar\%Processor_Architecture%%TarDebug%3.Tar -C /Binaries/NT/system32 imagehlp.dll ntsdexts.dll userexts.dll ntsd.exe 2>&1 | Tee -a C:\BldTools\TarSyms.Log
echo Tar is done. > \\XPLab\SymTar\%Processor_Architecture%%TarDebug%.End
