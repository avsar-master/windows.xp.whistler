/**********************************************************************/
/**                       Microsoft Windows/NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    wcslwr.c
    Wide-character strlwr

    FILE HISTORY:
        beng        29-Mar-2000 Created
        beng        07-May-2000 Use official wchar.h headerfile
*/


#include <windows.h>
#include <wchar.h>

wchar_t * _wcslwr(wchar_t * pszArg)
{
    return CharLowerW(pszArg);
}

