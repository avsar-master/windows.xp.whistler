/**********************************************************************/
/**                       Microsoft Windows NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    NCPASTRS.HXX:  String manipulation routines header file


    FILE HISTORY:
        DavidHov    10/31/92     Created

*/

#ifndef _NCPASTRS_HXX_
#define _NCPASTRS_HXX_


  //  UNICODE-safe version of "strchr()".

extern const TCHAR * SafeStrChr ( const TCHAR * pchString, TCHAR chSought ) ;

  //  Convert a hex string to binary

extern DWORD CvtHex ( const TCHAR * pszDword ) ;

  //  Convert a decimal string to binary

extern DWORD CvtDec ( const TCHAR * pszDword ) ;

  //  Convert string to binary based on "0xYYYY" format

extern DWORD CvtDecOrHex ( const TCHAR * pszDword ) ;

  //  Return the active length of a buffer of
  //    UNICODE NUL-terminated strings.

extern LONG ParamBufferSize ( const TCHAR * pszBuff ) ;

  //  Convert a number to a string

extern TCHAR * IntToStr ( LONG lDec, TCHAR * pszOutput, INT iBase ) ;

  //  Convert a SETUP-style text handle to an HKEY

extern HKEY  CvtRegHandle   ( const TCHAR * pchSetupHandle ) ;
extern PVOID CvtSetupHandle ( const TCHAR * pchSetupHandle ) ;
extern TCHAR * CreateSetupHandle ( PVOID pv, TCHAR * pszBuffer ) ;

  //  Convert a vector of LPSTRs to UNICODE equivalent

extern TCHAR * * CvtArgs ( const LPSTR * apszArgs, DWORD nArgs ) ;

  //   Free the result of a call to CvtArgs

extern void FreeArgs ( TCHAR * * patchArgs, DWORD nArgs ) ;


   /*
    *    Convert a SETUP INF list into a packed string of strings,
    *      delimited by a double zero (NUL NUL).
    */
extern TCHAR * CvtList (
     const TCHAR * pszList,
     TCHAR * pszBuffer,
     DWORD cchBuffSize ) ;


/*************************************************************************

    NAME:	TEXT_BUFFER

    SYNOPSIS:	Simple buffer class for an extensible buffer
		of text information, primarily used to support
		simple concatenation.

    INTERFACE:

    PARENT:	BUFFER

    USES:

    CAVEATS:

    NOTES:

    HISTORY:
	DavidHov    1/24/92	    Created

**************************************************************************/
#define TEXT_BUFF_INIT_SIZE  4000

class TEXT_BUFFER : public NLS_STR
{
public:
    TEXT_BUFFER ( UINT uiInitSize = TEXT_BUFF_INIT_SIZE,
                  BOOL fUseCrLf = FALSE ) ;
    BOOL Cat ( TCHAR bNext ) ;		// Store a character
    BOOL Cat ( const TCHAR * pchNext ) ; // Store a string
    BOOL Cat ( int i ) ;		// Store a number
    BOOL Eol () ;			// Store a line break
private:
    BOOL _fUseCrLf ;                    // If FALSE, line delimiter is space
};


#endif // _NCPASTRS_HXX_
