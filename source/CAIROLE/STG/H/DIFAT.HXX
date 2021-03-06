//+-------------------------------------------------------------------------
//
//  Microsoft Windows
//  Copyright (C) Microsoft Corporation, 2000 - 2000.
//
//  File:	difat.hxx
//
//  Contents:	Double-indirect Fat class headers
//
//  Classes:	CDIFat
//		CDIFatVector
//
//  Functions:	
//
//  History:    02-Sep-92 	PhilipLa	Created.
//
//--------------------------------------------------------------------------

#ifndef __DIFAT_HXX__
#define __DIFAT_HXX__

//+-------------------------------------------------------------------------
//
//  Class:      CDIFat (dif)
//
//  Purpose:    Double Indirect Fat class for MSF
//
//  Interface:  See below.
//
//  History:    11-May-92 	PhilipLa	Created.
//
//--------------------------------------------------------------------------

class CDIFat
{
    
public:
    CDIFat();
#ifndef REF
    CDIFat(CDIFat *pfatOld);
#endif //!REF
    inline ~CDIFat();

    VOID Empty(VOID);

    
    SCODE   GetFatSect(const FSINDEX oSect, SECT *psect);
    SCODE   SetFatSect(const FSINDEX oSect, const SECT sect);
    
    SCODE   GetSect(const FSINDEX oSect, SECT *psect);
    
    SCODE   Init(CMStream *pmsParent, const FSINDEX cFatSect);
#ifndef REF
    inline void InitCopy(CDIFat *pfatOld);
#endif //!REF
    SCODE   InitConvert(CMStream *pmsParent, SECT sectMax);
    SCODE InitNew(CMStream *pmsParent);

#ifndef REF
    SCODE   Lookup(const SECT sect, SECT *psectRet);

    SCODE   Fixup(CMStream * pmsShadow);
    
    SCODE   Remap(const FSINDEX oSect, SECT *psectReturn);
    
    SCODE   RemapSelf(VOID);
#endif //!REF
    
    SCODE   Flush(void);

    inline void SetParent(CMStream *pms);    
private:
    
    CFatVector _fv;
    CMStream DFBASED * _pmsParent;
    FSINDEX _cfsTable;
    
    SCODE   Resize(FSINDEX fsiSize);
    
    inline VOID SectToPair(
            SECT sect,
            FSINDEX *pipfs,
            FSOFFSET *pisect) const;
    
    SECT    PairToSect(FSINDEX ipfs, FSOFFSET isect) const;
    
};


//+-------------------------------------------------------------------------
//
//  Method:     CDIFat::~CDIFat, public
//
//  Synopsis:   CDIFat destructor
//
//  History:    11-May-92   PhilipLa    Created.
//
//--------------------------------------------------------------------------

inline CDIFat::~CDIFat()
{
    msfDebugOut((DEB_ITRACE, "In  CDIFat destructor\n"));
    msfDebugOut((DEB_ITRACE, "Out CDIFat destructor\n"));
}

#ifndef REF
//+-------------------------------------------------------------------------
//
//  Method:     CDIFat::InitCopy, public
//
//  Synopsis:   Init function for copying
//
//  Arguments:  [pfatOld] -- reference to CDIFat to be copied.
//
//  Returns:    S_OK if call completed OK.
//
//  Algorithm:  *Finish This*
//
//  History:    11-May-92   PhilipLa    Created.
//
//  Notes:
//
//--------------------------------------------------------------------------

inline void CDIFat::InitCopy(CDIFat *pfatOld)
{
    msfDebugOut((DEB_ITRACE, "In  CDIFat copy constructor\n"));

    _pmsParent = pfatOld->_pmsParent;
    _cfsTable = pfatOld->_cfsTable;

    _fv.InitCommon(pfatOld->_fv.GetSectBlock(), pfatOld->_fv.GetSectTable());
    _fv.InitCopy(&pfatOld->_fv);
    
    msfDebugOut((DEB_ITRACE, "Out CDIFat copy constructor\n"));
}
#endif //!REF

inline VOID CDIFat::SectToPair(FSINDEX sect, FSINDEX *pipfs, FSOFFSET *pisect) const
{
    msfAssert(sect >= CSECTFAT);
    
    sect = sect - CSECTFAT;
    *pipfs = (FSINDEX)(sect / _fv.GetSectTable());
    *pisect = (FSOFFSET)(sect % _fv.GetSectTable());
}

inline SECT CDIFat::PairToSect(FSINDEX ipfs, FSOFFSET isect) const
{
    return ipfs * _fv.GetSectTable() + isect + CSECTFAT;
}



inline void CDIFat::SetParent(CMStream *pms)
{
    _pmsParent = P_TO_BP(CMStream DFBASED *, pms);
    _fv.SetParent(pms);
}




#endif //__DIFAT_HXX__
