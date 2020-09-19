@rem Put a checkin request in \\XPBldSrv\Checkins\Requests.
@rem
@rem JasonS
@rem __________________________________________________________________________

@echo off
if not "%Verbose%"=="" echo on
if "%1"=="" goto Usage

:MoveOne
if not exist \\XPBldSrv\CheckIns\Requests goto Error
echo.
echo Copying %1 to \\XPBldSrv\CheckIns\Requests\%1...
copy %1 \\XPBldSrv\CheckIns\Requests > nul
shift
if "%1"=="" goto End
goto MoveOne

:Error
echo.
echo Error: Can't see \\XPBldSrv\CheckIns\Requests.
goto End

:Usage
echo.
echo Usage: %0 ListOfRequestedBuildMailFiles...

:End
