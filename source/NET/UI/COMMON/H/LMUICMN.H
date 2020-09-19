/**********************************************************************/
/**                       Microsoft Windows/NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    lmuicmn.h
    Definitions for the common LMUI libraries

    This file must remain C-includable.

    FILE HISTORY:
        beng        30-Jul-2000 Created
*/

extern "C"
{
    // BLT corresponds to the module handle for lmuicmn0.dll,
    // which contains (or attempts to contain) all the GUI components.

    extern HMODULE hmodBlt;

    // BASE corresponds to the module handle for lmuicmn1.dll,
    // which contains LMOBJ, the registry classes, etc.

    extern HMODULE hmodBase;
}

