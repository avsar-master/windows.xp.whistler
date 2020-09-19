!ifdef ALPHA
SECTION_ALIGNMENT= 0x10000
!else
SECTION_ALIGNMENT= 0x1000
!endif

executable:
  link32 -out:obj\$(BUILDCPU)\tmpp.exe @<<
-machine:$(BUILDCPU)
-align:$(SECTION_ALIGNMENT)
-subsystem:console 
-entry:mainCRTStartup 
obj\$(BUILDCPU)\tmpp.obj
obj\$(BUILDCPU)\tmpp.lib
$(BASEDIR)\neptune\sdk\lib\$(BUILDCPU)\kernel32.lib
$(BASEDIR)\neptune\sdk\lib\$(BUILDCPU)\libc.lib
<<
