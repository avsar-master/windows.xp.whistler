/**********************************************************************/
/**                       Microsoft Windows/NT                       **/
/**                Copyright(c) Microsoft Corp., 2000                **/
/**********************************************************************/

/*
    bltapp.cxx
    APPLICATION class implementation

    FILE HISTORY:
        rustanl     17-Jun-2000 Created, mostly from APPSTART
        rustanl     15-Jul-2000 Code review changes (no functional
                                differences).  CR attended by
                                BenG, ChuckC, Hui-LiCh, TerryK, RustanL.
        beng        17-Oct-2000 Moved WinMain into this module
        beng        29-Jun-2000 Removed WinMain to the .hxx file
*/

#include "pchblt.hxx"   // Precompiled header

/*******************************************************************

    NAME:       APPLICATION::APPLICATION

    SYNOPSIS:   APPLICATION constructor.

    ENTRY:      hInstance -         Application's instance handle
                nCmdShow -          Show-window type (open/icon)

    EXIT:       _fMsgPopupIsInit -  TRUE if the MsgPopup mechanism was
                                    installed, and FALSE otherwise.
                                    If this mechanism was successfully
                                    installed, MsgPopup can be used to
                                    display messages.  _fMsgPopupIsInit
                                    is used in APPLICATION::Run.

    NOTES:
        Need to think about command-line access someday.
        Needs to pass along nCmdShow to BLT and Do The Right Thing.

    HISTORY:
        rustanl     17-Jun-2000 Created
        rustanl     09-Jul-2000 Added MEM_MASTER::Init
        rustanl     09-Sep-2000 Intialize BLT_MASTER_TIMER
        beng        18-Oct-2000 Win32 conversion
        beng        24-Apr-2000 Change command-line support
        beng        03-Aug-2000 Dllization of resources

********************************************************************/

APPLICATION::APPLICATION( HINSTANCE hInstance, INT nCmdShow,
                          UINT idMinR, UINT idMaxR,
                          UINT idMinS, UINT idMaxS )
    : _hInstance( hInstance ),
      _fMsgPopupIsInit( FALSE )
{
    if ( QueryError() != NERR_Success )
        return;

    UNREFERENCED( nCmdShow );

#if !defined(WIN32) // only needed for Win16
    ::init_strlib();
#endif

#if !defined(WIN32) // ditto
    if ( ! MEM_MASTER::Init() )
    {
        // This should never happen because MEM_MASTER::Init only
        // allocates some 30 bytes out of the local heap (in the
        // automatic data segment).  If this fails, it is probably
        // due to a programmer error, viz. not specifying a
        // "HEAP" in the .def file.
        //
        ReportError( BLT::MapLastError(ERROR_GEN_FAILURE) );
        return;
    }
#endif

    APIERR err = BLT::Init( _hInstance, idMinR, idMaxR, idMinS, idMaxS );
    if ( err != NERR_Success )
    {
        ReportError( err );
        return;
    }

    _fMsgPopupIsInit = TRUE;        // MsgPopup is now available

    err = BLT_MASTER_TIMER::Init();
    if ( err != NERR_Success )
    {
        ReportError( err );
        return;
    }
}


/*******************************************************************

    NAME:       APPLICATION::~APPLICATION

    SYNOPSIS:   APPLICATION destructor

    HISTORY:
        rustanl     17-Jun-2000 Created
        rustanl     09-Jul-2000 Added MEM_MASTER::Term
        rustanl     09-Sep-2000 Added BLT_MASTER_TIMER::Term
        beng        18-Oct-2000 Win32 conversion
        DavidHov    22-Nov-2000 Heap Residue checking for Win32
        beng        04-Aug-2000 Dllization

********************************************************************/

APPLICATION::~APPLICATION()
{
    BLT_MASTER_TIMER::Term();

    BLT::Term( _hInstance );

#if !defined(WIN32)
    if ( ! MEM_MASTER::Term() )
    {
        // There was some memory residue from allocations.  Warn
        // the programmer.
        //
        DBGEOL("APPLICATION termination: some memory residue exists");
    }
#else
    // The Win32 version checks its heap at DLL process detach time
#endif
}


/*******************************************************************

    NAME:       APPLICATION::Run

    SYNOPSIS:   Allows the application to run, by:
                    - verifying its construction
                    - running its message loop

    ENTRY:      An APPLICATION object after all of its constructors
                have been called.

    RETURNS:    The application's return code (from the pump).

    NOTES:
        This is a virtual member function.

        This method is analogous to DIALOG_WINDOW::Process.

    HISTORY:
        rustanl     17-Jun-2000 Created
        beng        09-Jul-2000 Added new FilterMessage scheme
        rustanl     29-Aug-2000 Virtualized Run
        beng        07-Oct-2000 Uses HAS_MESSAGE_PUMP::RunMessagePump

********************************************************************/

INT APPLICATION::Run()
{
    UIASSERT( QueryError() == NERR_Success );   // otherwise, this method
                                                // shouldn't have been
                                                // called

    return RunMessagePump();
}


/*******************************************************************

    NAME:       APPLICATION::DisplayCtError

    SYNOPSIS:   Displays a constructor error

    ENTRY:      err -       The error to be displayed

    NOTES:      Since construction failed, MsgPopup may not be
                available.  If so, no error is displayed.

    HISTORY:
        rustanl     04-Sep-2000     Created

********************************************************************/

VOID APPLICATION::DisplayCtError( APIERR err )
{
    ASSERTSZ( (err != NERR_Success), "APPLICATION construction failed" );

    if ( _fMsgPopupIsInit )
    {
        ::MsgPopup( (HWND)NULL, err );
    }
}


/*******************************************************************

    NAME:       APPLICATION::IsSystemInitialized

    SYNOPSIS:   Determines if the *system* is properly initialized.

    RETURNS:    BOOL - TRUE if system init OK, FALSE otherwise.

    NOTES:      This is a static method.

    HISTORY:
        keithmo     13-May-1993     Created

********************************************************************/

BOOL APPLICATION::IsSystemInitialized( VOID )
{
    return ( ::GetDesktopWindow() != NULL );

}   // APPLICATION::IsSystemInitialized

