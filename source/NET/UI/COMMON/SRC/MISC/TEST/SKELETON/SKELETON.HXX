/**********************************************************************/
/**                       Microsoft Windows/NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    skeleton.hxx
    Everything a unit test needs to coordinate with the skeleton

    FILE HISTORY:
        beng        06-Jul-2000 Created
        beng        21-Nov-2000 Includes BLT and dbgstr
        beng        16-Mar-2000 Changes to cdebug
        beng        13-Aug-2000 USE_CONSOLE broken in dllization
*/

// #define USE_CONSOLE

// Prototype.  This function will be called by the unit test.

VOID RunTest();

// Unit test reports via a stream "cdebug."  Under Windows (BLT)
// this maps to aux; under OS/2, or the NT console, it's stdout.

#include <dbgstr.hxx>
