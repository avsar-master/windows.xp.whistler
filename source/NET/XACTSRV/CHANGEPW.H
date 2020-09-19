/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    ChangePw.h

Abstract:

    This module implements password change from downlevel clients.
    XsChangePasswordSam is called by XsNetUserPasswordSet2 in
    apiuser.c.  I've put this in a seperate file because it #includes
    a private SAM header.

Author:

    Dave Hart (davehart) 31-Apr-2000

Revision History:

--*/

NET_API_STATUS
XsChangePasswordSam (
    IN PUNICODE_STRING UserName,
    IN PVOID OldPassword,
    IN PVOID NewPassword,
    IN BOOLEAN Encrypted
    );
