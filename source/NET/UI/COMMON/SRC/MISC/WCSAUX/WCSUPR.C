/**********************************************************************/
/**                       Microsoft Windows/NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    wcsupr.c
    Wide-character strupr

    FILE HISTORY:
        beng        29-Mar-2000 Created
        beng        07-May-2000 Use official wchar.h headerfile
*/


#include <windows.h>
#include <wchar.h>

wchar_t * _wcsupr(wchar_t * pszArg)
{
    return CharUpperW(pszArg);
}

