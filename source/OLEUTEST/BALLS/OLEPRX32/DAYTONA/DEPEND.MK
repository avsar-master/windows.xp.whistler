# 
# Built automatically 
# 
 
# 
# Source files 
# 
 
$(OBJDIR)\cguid_i.obj $(OBJDIR)\cguid_i.lst: .\cguid_i.c

$(OBJDIR)\dlldata.obj $(OBJDIR)\dlldata.lst: .\dlldata.c \
	$(BASEDIR)\neptune\oleutest\balls\oleprx32\daytona\iballs.h \
	$(BASEDIR)\neptune\oleutest\balls\oleprx32\daytona\ibtest.h \
	$(BASEDIR)\neptune\oleutest\balls\oleprx32\daytona\icube.h \
	$(BASEDIR)\neptune\oleutest\balls\oleprx32\daytona\iloop.h \
	$(BASEDIR)\neptune\oleutest\balls\oleprx32\daytona\rpctst.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\iballs.h .\icube.h

$(OBJDIR)\dllentry.obj $(OBJDIR)\dllentry.lst: .\dllentry.c \
	$(BASEDIR)\neptune\sdk\inc\crt\malloc.h \
	$(BASEDIR)\neptune\sdk\inc\crt\process.h \
	$(BASEDIR)\neptune\sdk\inc\crt\stdlib.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h

$(OBJDIR)\iballs_i.obj $(OBJDIR)\iballs_i.lst: .\iballs_i.c

$(OBJDIR)\icube_i.obj $(OBJDIR)\icube_i.lst: .\icube_i.c

$(OBJDIR)\ibtest_p.obj $(OBJDIR)\ibtest_p.lst: .\ibtest_p.c \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\ibtest.h

$(OBJDIR)\iballs_p.obj $(OBJDIR)\iballs_p.lst: .\iballs_p.c \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\iballs.h .\icube.h

$(OBJDIR)\ibtest_i.obj $(OBJDIR)\ibtest_i.lst: .\ibtest_i.c

$(OBJDIR)\ibtest_i.obj $(OBJDIR)\ibtest_i.lst: .\ibtest_i.c

$(OBJDIR)\iloop_i.obj $(OBJDIR)\iloop_i.lst: .\iloop_i.c

$(OBJDIR)\icube_p.obj $(OBJDIR)\icube_p.lst: .\icube_p.c \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\icube.h .\iballs.h .\icube.h

$(OBJDIR)\rpctst_i.obj $(OBJDIR)\rpctst_i.lst: .\rpctst_i.c

$(OBJDIR)\iloop_p.obj $(OBJDIR)\iloop_p.lst: .\iloop_p.c \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\iloop.h

$(OBJDIR)\rawrpc_x.obj $(OBJDIR)\rawrpc_x.lst: .\rawrpc_x.c

$(OBJDIR)\libmain.obj $(OBJDIR)\libmain.lst: .\libmain.cxx

$(OBJDIR)\transmit.obj $(OBJDIR)\transmit.lst: .\transmit.cxx \
	$(BASEDIR)\neptune\cinc\stdclass.hxx $(BASEDIR)\neptune\cinc\stdrpc.hxx \
	$(BASEDIR)\neptune\sdk\inc\advsnk.h $(BASEDIR)\neptune\sdk\inc\bndctx.h \
	$(BASEDIR)\neptune\sdk\inc\efrmte.h $(BASEDIR)\neptune\sdk\inc\estatd.h \
	$(BASEDIR)\neptune\sdk\inc\estats.h $(BASEDIR)\neptune\sdk\inc\estrng.h \
	$(BASEDIR)\neptune\sdk\inc\monikr.h $(BASEDIR)\neptune\sdk\inc\prsist.h \
	$(BASEDIR)\neptune\sdk\inc\pstrm.h $(BASEDIR)\neptune\sdk\inc\rot.h \
	$(BASEDIR)\neptune\sdk\inc\rpcferr.h $(BASEDIR)\neptune\sdk\inc\storag.h \
	$(BASEDIR)\neptune\sdk\inc\stream.h $(BASEDIR)\neptune\sdk\inc\varnt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\transmit.h

$(OBJDIR)\rpctst_p.obj $(OBJDIR)\rpctst_p.lst: .\rpctst_p.c \
	$(BASEDIR)\neptune\sdk\inc\crt\excpt.h \
	$(BASEDIR)\neptune\sdk\inc\crt\memory.h \
	$(BASEDIR)\neptune\sdk\inc\crt\string.h $(BASEDIR)\neptune\sdk\inc\rpc.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdce.h $(BASEDIR)\neptune\sdk\inc\rpcdce2.h \
	$(BASEDIR)\neptune\sdk\inc\rpcdcep.h $(BASEDIR)\neptune\sdk\inc\rpcndr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnsi.h $(BASEDIR)\neptune\sdk\inc\rpcnsip.h \
	$(BASEDIR)\neptune\sdk\inc\rpcnterr.h \
	$(BASEDIR)\neptune\sdk\inc\rpcproxy.h $(BASEDIR)\neptune\sdk\inc\unknwn.h \
	$(BASEDIR)\neptune\sdk\inc\winerror.h $(BASEDIR)\neptune\sdk\inc\wtypes.h \
	.\rpctst.h

# 
# Precompiled C++ header 
# 

!ifdef PXXFILE  
$(PCHDIR)\$(OBJDIR)\pch.pxh $(PCHDIR)\$(OBJDIR)\pch.lst: \
	$(BASEDIR)\neptune\oleutest\balls\oleprx32\daytona\pch.cxx \
	$(BASEDIR)\neptune\cinc\stdclass.hxx $(BASEDIR)\neptune\cinc\stdrpc.hxx \
	$(BASEDIR)\neptune\sdk\inc\rpcferr.h

.\$(OBJDIR)\transmit.obj :  $(PCHDIR)\$(OBJDIR)\pch.pxh

.\$(OBJDIR)\libmain.obj :  $(PCHDIR)\$(OBJDIR)\pch.pxh

!endif # PXXFILE 

 
