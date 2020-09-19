//+--------------------------------------------------------------
//
//  Microsoft Windows
//  Copyright (C) Microsoft Corporation, 2000 - 2000.
//
//  File:	ascii.hxx
//
//  Contents:	WCHAR header for ASCII layer
//
//---------------------------------------------------------------

#ifndef __ASCII_HXX__
#define __ASCII_HXX__

SCODE DfOpenStorageOnILockBytesW(ILockBytes *plkbyt,
                                 IStorage *pstgPriority,
                                 DWORD grfMode,
                                 SNBW snbExclude,
                                 DWORD reserved,
                                 IStorage **ppstgOpen,
                                 CLSID *pcid);

#endif // #ifndef __ASCII_HXX__
