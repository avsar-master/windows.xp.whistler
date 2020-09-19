/*++

Copyright (c) 2000 Microsoft Corporation

Module Name:

    sccrypt.h

Abstract:

    Password ncryption and decription routines.

Author:

    Rita Wong (ritaw)     27-Apr-2000

Revision History:

--*/

#ifndef _SCCRYPT_INCLUDED_
#define _SCCRYPT_INCLUDED_


DWORD
ScEncryptPassword(
    IN  SC_RPC_HANDLE ContextHandle,
    IN  LPWSTR Password,
    OUT LPBYTE *EncryptedPassword,
    OUT LPDWORD EncryptedPasswordSize
    );

DWORD
ScDecryptPassword(
    IN  SC_RPC_HANDLE ContextHandle,
    IN  LPBYTE EncryptedPassword,
    IN  DWORD EncryptedPasswordSize,
    OUT LPWSTR *Password
    );

#endif // _SCCRYPT_INCLUDED_
