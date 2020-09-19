obj\$(TARGET_DIRECTORY)\mkmsg.exe: obj\$(TARGET_DIRECTORY)\mkmsg.obj
    link -machine:$(TARGET_DIRECTORY) -out:obj\$(TARGET_DIRECTORY)\mkmsg.exe obj\$(TARGET_DIRECTORY)\mkmsg.obj $(BASEDIR)\neptune\sdk\lib\$(TARGET_DIRECTORY)\crtdll.lib
