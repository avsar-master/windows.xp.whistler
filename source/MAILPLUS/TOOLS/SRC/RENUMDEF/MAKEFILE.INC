executable:
  link32 -out:obj\$(BUILDCPU)\renumdef.exe @<<
-machine:$(BUILDCPU)
-align:0x1000 
-subsystem:console 
-entry:mainCRTStartup 
obj\$(BUILDCPU)\renumdef.obj
obj\$(BUILDCPU)\renumdef.lib
$(BASEDIR)\neptune\sdk\lib\$(BUILDCPU)\kernel32.lib
$(BASEDIR)\neptune\sdk\lib\$(BUILDCPU)\libc.lib
<<
