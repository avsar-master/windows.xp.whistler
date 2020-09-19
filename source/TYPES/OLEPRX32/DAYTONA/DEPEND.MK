# 
# Built automatically 
# 
 
# 
# Source files 
# 
 
$(OBJDIR)\cguid_i.obj $(OBJDIR)\cguid_i.lst: .\cguid_i.c

$(OBJDIR)\call_as.obj $(OBJDIR)\call_as.lst: .\call_as.c \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h \
	$(BASEDIR)\neptune\sdk\inc\poppack.h \
	$(BASEDIR)\neptune\sdk\inc\pshpack4.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdcep.h \
	$(BASEDIR)\neptune\sdk\inc\rpcndr.h $(BASEDIR)\neptune\sdk\inc\rpcnsi.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h .\transmit.h

$(OBJDIR)\com_i.obj $(OBJDIR)\com_i.lst: .\com_i.c

$(OBJDIR)\ole2x_i.obj $(OBJDIR)\ole2x_i.lst: .\ole2x_i.c

$(OBJDIR)\dlldata.obj $(OBJDIR)\dlldata.lst: .\dlldata.c \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h \
	$(BASEDIR)\neptune\sdk\inc\poppack.h \
	$(BASEDIR)\neptune\sdk\inc\pshpack4.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdcep.h \
	$(BASEDIR)\neptune\sdk\inc\rpcndr.h $(BASEDIR)\neptune\sdk\inc\rpcnsi.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h

$(OBJDIR)\com_p.obj $(OBJDIR)\com_p.lst: .\com_p.c \
	$(BASEDIR)\neptune\sdk\inc\com.h $(BASEDIR)\neptune\sdk\inc\rpcproxy.h \
	$(BASEDIR)\neptune\sdk\inc\wtypes.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h \
	$(BASEDIR)\neptune\sdk\inc\poppack.h \
	$(BASEDIR)\neptune\sdk\inc\pshpack4.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdcep.h \
	$(BASEDIR)\neptune\sdk\inc\rpcndr.h $(BASEDIR)\neptune\sdk\inc\rpcnsi.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h

$(OBJDIR)\oleaut_i.obj $(OBJDIR)\oleaut_i.lst: .\oleaut_i.c

$(OBJDIR)\ole2x_p.obj $(OBJDIR)\ole2x_p.lst: .\ole2x_p.c \
	$(BASEDIR)\neptune\sdk\inc\ole2x.h $(BASEDIR)\neptune\sdk\inc\com.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h \
	$(BASEDIR)\neptune\sdk\inc\poppack.h \
	$(BASEDIR)\neptune\sdk\inc\pshpack4.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdcep.h \
	$(BASEDIR)\neptune\sdk\inc\rpcndr.h $(BASEDIR)\neptune\sdk\inc\rpcnsi.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h

$(OBJDIR)\transmit.obj $(OBJDIR)\transmit.lst: .\transmit.cxx \
	$(BASEDIR)\neptune\cinc\stdclass.hxx $(BASEDIR)\neptune\cinc\stdrpc.hxx \
	$(BASEDIR)\neptune\sdk\inc\cguid.h \
	$(BASEDIR)\neptune\sdk\inc\crt\stdlib.h \
	$(BASEDIR)\neptune\sdk\inc\objbase.h \
	$(BASEDIR)\neptune\sdk\inc\objerror.h \
	$(BASEDIR)\neptune\sdk\inc\oleauto.h \
	$(BASEDIR)\neptune\sdk\inc\pshpack4.h \
	$(BASEDIR)\neptune\sdk\inc\pshpack8.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcndr.h $(BASEDIR)\neptune\sdk\inc\winerror.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\poppack.h $(BASEDIR)\neptune\sdk\inc\rpcdce.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcnsi.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h .\transmit.h

# 
# Precompiled C++ header 
# 

!ifdef PXXFILE  
$(PCHDIR)\$(OBJDIR)\pch.pxh $(PCHDIR)\$(OBJDIR)\pch.lst: \
	$(TYPESDIR)\oleprx32\daytona\pch.cxx \
	$(BASEDIR)\neptune\cinc\stdclass.hxx $(BASEDIR)\neptune\cinc\stdrpc.hxx \
	$(BASEDIR)\neptune\sdk\inc\objerror.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h

.\$(OBJDIR)\transmit.obj :  $(PCHDIR)\$(OBJDIR)\pch.pxh

!endif # PXXFILE 

 
