/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Program.h

Abstract:

    This module contains the prototypes for the program menu support
    functions.

Author:

    Ramon J. San Andres (ramonsa)  07-July-2000

Environment:

    Win32, User Mode

--*/


extern  BOOLEAN ExitingDebugger;

VOID    ProgramOpen( void );
BOOLEAN ProgramClose( void );
VOID    ProgramSave( void );
VOID    ProgramSaveAs( void );
VOID    ProgramDelete( void );
VOID    ProgramSaveDefaults( void );

VOID    ProgramOpenPath( char *Path );
