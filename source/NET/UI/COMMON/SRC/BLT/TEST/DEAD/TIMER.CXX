/**********************************************************************/
/**			  Microsoft LAN Manager 		     **/
/**		Copyright(c) Microsoft Corp., 1990, 2000	     **/
/**********************************************************************/

/*
    timer.cxx
    Test application: main application module

    FILE HISTORY:
	beng	    02-Jan-2000     Created
	beng	    03-Feb-2000     Modified to use lmui.hxx et al
	beng	    14-Feb-2000     Added BLT
	beng	    14-Mar-2000     Removed obsolete vhInst;
				    included about.cxx,hxx
	beng	    01-Apr-2000     Uses new BLT APPSTART
	beng	    10-May-2000     Updated with standalone client window
	beng	    14-May-2000     ... and with App window
	beng	    21-May-2000     LBAPP created from APPFOO
	terryk	    22-May-2000     Modified to timer test apps.

*/

#define DEBUG

#define INCL_DOSERRORS
#define INCL_NETERRORS
#define INCL_WINDOWS
#define INCL_WINDOWS_GDI
#include <lmui.hxx>

extern "C"
{
    #include <time.h>
    #include <netlib.h>
    #include "timer.h"
}

#include <uiassert.hxx>

#define INCL_BLT_SPIN_GROUP 
#define INCL_BLT_CLIENT
#define INCL_BLT_APP
#define INCL_BLT_TIMER
#include <blt.hxx>
#include <heap.hxx>

#include <string.hxx>
#include <dbgstr.hxx>


const TCHAR szIconResource[] = "FooIcon";
const TCHAR szMenuResource[] = "FooMenu";

const NLS_STR szMainWindowTitle;


class FOO_WND: public APP_WINDOW
{
private:
    BLT_TIMER Timer1;
    BLT_TIMER Timer2;
    BLT_TIMER Timer3;
    BLT_TIMER Timer4;
public:
    FOO_WND();
    ~FOO_WND();
};

FOO_WND * pwndApp = 0;

extern "C"
{
	LONG _export FAR PASCAL TimerProc1( HWND hWnd, WORD wMsg, WORD wParam,
	LONG lParam )
	{
        static int i=0;
        TCHAR pszBuf[40];

        wsprintf( pszBuf, "Timer 1 ( .1 sec ) - Click # %d", i++);
        HDC dc=GetDC( pwndApp->QueryHwnd() );
        TextOut( dc, 10, 10, pszBuf, strlenf( pszBuf ));
        ReleaseDC( pwndApp->QueryHwnd(), dc );
		return 0;
	};
	LONG _export FAR PASCAL TimerProc2( HWND hWnd, WORD wMsg, WORD wParam,
	LONG lParam )
	{
        static int i=0;
        TCHAR pszBuf[40];

        wsprintf( pszBuf, "Timer 2 ( .5 sec ) - Click # %d", i++);
        HDC dc=GetDC( pwndApp->QueryHwnd() );
        TextOut( dc, 10, 30, pszBuf, strlenf( pszBuf ));
        ReleaseDC( pwndApp->QueryHwnd(), dc );
		return 0;
	};
	LONG _export FAR PASCAL TimerProc3( HWND hWnd, WORD wMsg, WORD wParam,
	LONG lParam )
	{
        static int i=0;
        TCHAR pszBuf[40];

        wsprintf( pszBuf, "Timer 3 (  2 sec ) - Click # %d", i++);
        HDC dc=GetDC( pwndApp->QueryHwnd() );
        TextOut( dc, 10, 50, pszBuf, strlenf( pszBuf ));
        ReleaseDC( pwndApp->QueryHwnd(), dc );
		return 0;
	};
	LONG _export FAR PASCAL TimerProc4( HWND hWnd, WORD wMsg, WORD wParam,
	LONG lParam )
	{
        static int i=0;
        TCHAR pszBuf[100];
        long lTime;
        struct tm *Time;

        time( &lTime);
		Time = localtime( &lTime );

        wsprintf( pszBuf, "Current Time: %2d:%2d:%2d", Time->tm_hour, 
				Time->tm_min, Time->tm_sec );
        HDC dc=GetDC( pwndApp->QueryHwnd() );
        TextOut( dc, 10, 70, pszBuf, strlenf( pszBuf ));
        ReleaseDC( pwndApp->QueryHwnd(), dc );
		return 0;
	};
}



FOO_WND::FOO_WND()
    : APP_WINDOW(szMainWindowTitle, szIconResource, szMenuResource ),
    Timer1 ( NULL, 100, (FARPROC) TimerProc1 ),
    Timer2 ( NULL, 500, (FARPROC) TimerProc2 ),
    Timer3 ( NULL, 2000, (FARPROC) TimerProc3 ),
    Timer4 ( NULL, 1000, (FARPROC) TimerProc4 )
{
    if (QueryError())
	return;
}


FOO_WND::~FOO_WND()
{
}


BOOL APPSTART::Init(
    TCHAR * pszCmdLine,
    INT    nShow)
{
    szMainWindowTitle="listbox";
    UNREFERENCED(pszCmdLine);
    UNREFERENCED(nShow);

    FOO_WND *pwnd = new FOO_WND;

    if (!pwnd)
	return FALSE;
    if (!*pwnd)
    {
	delete pwnd;
	return FALSE;
    }

    pwnd->Show();
    pwnd->Repaint();
    pwnd->RepaintNow();

    ::pwndApp = pwnd;

    return TRUE;
}


VOID APPSTART::Term()
{
    delete ::pwndApp;
}
