
REM
REM Note:   The D:\fre_* directories on are \\BillR7,
REM         that is, NOT the D: drivers where the media
REM         goes - this is on other machines.
REM

if "%1"=="" goto SYNTAX

diamwrap -m2 -x .sym -d \\xpx861\ntcdfree.%1\*.*    d:\fre_x86
diamwrap -m2 -x .sym -d \\xpalpha1\ntcdfree.%1\*.*  d:\fre_alpha
diamwrap -m2 -x .sym -d \\xpjazz1\ntcdfree.%1\*.*   d:\fre_mips

:SYNTAX
@Echo Syntax:   FREBUILD Build#,   ie.   FREBUILD 648

