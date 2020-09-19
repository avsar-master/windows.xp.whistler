!if exist(..\$(TARGET_DIRECTORY).inc)
!include ..\$(TARGET_DIRECTORY).inc
!endif

obj\$(TARGET_DIRECTORY)\usrstubs.obj: \
    $(TARGET_DIRECTORY)\usrstubs.$(ASM_SUFFIX) obj\$(TARGET_DIRECTORY)\ntdll.def

ntdll.xtr: $(_XPROOT)\neptune\xpos\ke\services.tab
    gensrv -f ntdll.xtr $(_XPROOT)\neptune\xpos\ke

$(TARGET_DIRECTORY)\usrstubs.$(ASM_SUFFIX): $(_XPROOT)\neptune\xpos\ke\services.tab
    gensrv -d $(TARGET_DIRECTORY) -e $(ASM_SUFFIX) $(TARGET_BRACES) $(_XPROOT)\neptune\xpos\ke

obj\$(TARGET_DIRECTORY)\ntdll.def: ..\ntdlldef.src ..\$(TARGET_DIRECTORY)def.src ntdll.xtr
    copy ..\ntdlldef.src+..\$(TARGET_DIRECTORY)def.src+ntdll.xtr obj\$(TARGET_DIRECTORY)\ntdll.pp
    $(TARGET_CPP) /EP $(CDEFINES) obj\$(TARGET_DIRECTORY)\ntdll.pp > obj\$(TARGET_DIRECTORY)\ntdll.def
    -del obj\$(TARGET_DIRECTORY)\ntdll.pp

..\ntdll.rc: ..\ntstatus.rc ..\MSG00001.bin
