############################################################################
#
#   Copyright (C) 2000, Microsoft Corporation.
#
#   All rights reserved.
#
############################################################################

#
#   Name of target.  Include an extension (.dll, .lib, .exe)
#   If the target is part of the release, set RELEASE to 1.
#

TARGET	            = helper.lib
TARGET_DESCRIPTION  = "Helper Code for Service Object Server and Client"


#
#   Source files.  Remember to prefix each name with .\
#

CXXFILES    = .\helper.cxx \
              .\myclsid.cxx

CFILES	    = .\svobj_x.c \
              .\svobj_y.c

IDLFILES    = .\svobj.idl

RCFILES     =

#MIDL 66 is rather buggy
USEMIDL76   = TRUE

#IDLFLAGS    = /confirm

CFLAGS	    = -D__WIN32__

#
#   Libraries and other object files to link.
#

DEFFILE     =

LIBS	    =

OBJFILES    =

#
#   Precompiled headers.
#

PXXFILE     =
PFILE       =

CINC	    = $(CINC) -I$(COMMON)\types

# -I$(IMPORT)\xp\h\sdk -I$(IMPORT)\xp\h\sdk\crt \
#		      -I$(IMPORT)\xp\h\oak -I$(IMPORT)\xp\h\xpos

MTHREAD     = 1

