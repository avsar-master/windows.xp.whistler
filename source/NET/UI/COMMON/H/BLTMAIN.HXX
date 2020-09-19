/**********************************************************************/
/**                       Microsoft Windows/NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    bltmain.hxx
    Definition of BLT C-linkage glue function

    This file coordinates the various "clients" of BltMain.  It
    must remain C includable, since C sourcefiles include it.

    FILE HISTORY:
        beng        01-Apr-2000 Created
        beng        24-Apr-2000 Removed pszCmdLine from proto
        beng        03-Aug-2000 Removed nPrevInst from proto
*/


#if defined(__cplusplus)
extern "C"
{
#endif

  INT BltMain(HINSTANCE hInst, INT nShow);

#if defined(__cplusplus)
}
#endif
