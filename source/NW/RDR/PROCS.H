/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    Procs.h

Abstract:

    This module defines all of the globally used procedures in the NetWare
    redirector.

Author:

    Colin Watson    [ColinW]    15-Dec-2000

Revision History:

--*/

#ifndef _NWPROCS_
#define _NWPROCS_

#ifndef QFE_BUILD
#define IFS 1
#define NWFASTIO 1
#endif

#ifdef IFS

    #include <ntifs.h>

#else

    #include <xpos.h>
    #include <ntioapi.h>
    #include <zwapi.h>
    #include <FsRtl.h>

#endif

#include <string.h>
#include <Tdi.h>
#include <TdiKrnl.h>
#include <Status.h>
#include <nwstatus.h>

//  Netware and Netware redirector specific includes

#ifndef DBG
#define DBG 0
#endif

#if !DBG
#undef NWDBG
#endif

#if NWDBG
#define PAGED_DBG 1
#endif
#ifdef PAGED_DBG
#undef PAGED_CODE
#define PAGED_CODE() \
    struct { ULONG bogus; } ThisCodeCantBePaged; \
    ThisCodeCantBePaged; \
    if (KeGetCurrentIrql() > APC_LEVEL) { \
	KdPrint(( "EX: Pageable code called at IRQL %d\n", KeGetCurrentIrql() )); \
        ASSERT(FALSE); \
        }
#define PAGED_CODE_CHECK() if (ThisCodeCantBePaged) ;
extern ULONG ThisCodeCantBePaged;
#else
#define PAGED_CODE_CHECK()
#endif

#include <NtDDNwfs.h>
#include "Const.h"
#include "Nodetype.h"
#include "ncp.h"
#include "Struct.h"
#include "Data.h"
#include "Exchange.h"
#include <NwEvent.h>

//  Attach.c

NTSTATUS
ProcessFindNearest(
    IN struct _IRP_CONTEXT* pIrpContext,
    IN ULONG BytesAvailable,
    IN PUCHAR RspData
    );

NTSTATUS
CrackPath (
    IN PUNICODE_STRING BaseName,
    OUT PUNICODE_STRING DriveName,
    OUT PWCHAR DriveLetter,
    OUT PUNICODE_STRING ServerName,
    OUT PUNICODE_STRING VolumeName,
    OUT PUNICODE_STRING PathName,
    OUT PUNICODE_STRING FileName,
    OUT PUNICODE_STRING FullName OPTIONAL
    );

NTSTATUS
CreateScb(
    OUT PSCB *Scb,
    IN PIRP_CONTEXT pIrpC,
    IN PUNICODE_STRING Server,
    IN PUNICODE_STRING UserName,
    IN PUNICODE_STRING Password,
    IN BOOLEAN DeferLogon,
    IN BOOLEAN DeleteConnection
    );

VOID
DestroyAllScb(
    VOID
    );

VOID
InitializeAttach (
    VOID
    );

NTSTATUS
OpenScbSockets(
    PIRP_CONTEXT pIrpC,
    PNONPAGED_SCB pNpScb
    );

PNONPAGED_SCB
SelectConnection(
    PNONPAGED_SCB NpScb
    );

VOID
NwLogoffAndDisconnect(
    PIRP_CONTEXT pIrpContext,
    PNONPAGED_SCB pNpScb
    );

VOID
NwLogoffAllServers(
    PIRP_CONTEXT pIrpContext,
    PLARGE_INTEGER Uid
    );

VOID
NwDeleteScb(
    PSCB pScb
    );

NTSTATUS
NegotiateBurstMode(
    PIRP_CONTEXT pIrpContext,
    PNONPAGED_SCB pNpScb
    );

VOID
RenegotiateBurstMode(
    PIRP_CONTEXT pIrpContext,
    PNONPAGED_SCB pNpScb
    );

NTSTATUS
QueryServersAddress(
    PIRP_CONTEXT pIrpContext,
    PNONPAGED_SCB pNearestScb,
    PUNICODE_STRING pServerName,
    IPXaddress *pServerAddress
    );

VOID
TreeConnectScb(
    IN PSCB Scb
    );

NTSTATUS
TreeDisconnectScb(
    IN PIRP_CONTEXT IrpContext,
    IN PSCB Scb
    );

VOID
ReconnectScb(
    IN PIRP_CONTEXT IrpContext,
    IN PSCB pScb
    );

//  Cache.c

ULONG
CacheRead(
    IN PNONPAGED_FCB NpFcb,
    IN ULONG FileOffset,
    IN ULONG BytesToRead,
    IN PVOID UserBuffer
#if NWFASTIO
    , IN BOOLEAN WholeBufferOnly
#endif
    );

BOOLEAN
CacheWrite(
    IN PIRP_CONTEXT IrpContext,
    IN PNONPAGED_FCB NpFcb,
    IN ULONG FileOffset,
    IN ULONG BytesToWrite,
    IN PVOID UserBuffer
    );

ULONG
CalculateReadAheadSize(
    IN PIRP_CONTEXT IrpContext,
    IN PNONPAGED_FCB NpFcb,
    IN ULONG CacheReadSize,
    IN ULONG FileOffset,
    IN ULONG ByteCount
    );

NTSTATUS
FlushCache(
    PIRP_CONTEXT IrpContext,
    PNONPAGED_FCB NpFcb
    );

//  Callback.c


NTSTATUS
SynchronousResponseCallback (
    IN PIRP_CONTEXT pIrpContext,
    IN ULONG BytesAvailable,
    IN PUCHAR RspData
    );

NTSTATUS
AsynchResponseCallback (
    IN PIRP_CONTEXT pIrpContext,
    IN ULONG BytesAvailable,
    IN PUCHAR RspData
    );

NTSTATUS
NcpSearchFileCallback (
    IN PIRP_CONTEXT pIrpContext,
    IN ULONG BytesIndicated,
    IN ULONG BytesAvailable,
    OUT ULONG *BytesTaken,
    IN PUCHAR RspData
    );

// Cleanup.c

NTSTATUS
NwFsdCleanup (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

//  Close.c

NTSTATUS
NwFsdClose (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

//  Create.c

NTSTATUS
NwFsdCreate (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

//  Convert.c

NTSTATUS
pNwErrorToNtStatus(
    UCHAR Error
    );

NTSTATUS
NwBurstResultToNtStatus(
    ULONG Result
    );

#define NwErrorToNtStatus( STATUS ) \
    (STATUS == 0 )? STATUS_SUCCESS : pNwErrorToNtStatus(STATUS)

NTSTATUS
NwConnectionStatusToNtStatus(
    UCHAR NwStatus
    );

UCHAR
NtDesiredAccessToNwShareFlags(
    ULONG DesiredAccess
    );

UCHAR
NtAttributesToNwAttributes(
    ULONG FileAttributes
    );

UCHAR
NtShareAccessToNwShareFlags(
    ULONG NtShareFlags
    );

LARGE_INTEGER
NwDateTimeToNtTime(
    USHORT Date,
    USHORT Time
    );

NTSTATUS
NwNtTimeToNwDateTime (
    IN LARGE_INTEGER NtTime,
    IN PUSHORT NwDate,
    IN PUSHORT NwTime
    );

//  Data.c

VOID
NwInitializeData(
    VOID
    );

//  Debug.c

#ifdef NWDBG

ULONG
NwMemDbg (
    IN PCH Format,
    ...
    );

VOID
RealDebugTrace(
    IN LONG Indent,
    IN ULONG Level,
    IN PCH Message,
    IN PVOID Parameter
    );

VOID
dump(
    IN ULONG Level,
    IN PVOID far_p,
    IN ULONG  len
    );

VOID
dumpMdl(
    IN ULONG Level,
    IN PMDL Mdl
    );

PVOID
NwAllocatePool(
    ULONG Type,
    ULONG Size,
    BOOLEAN RaiseStatus
    );

VOID
NwFreePool(
    PVOID Buffer
    );

PIRP
NwAllocateIrp(
    CCHAR Size,
    BOOLEAN ChargeQuota
    );

VOID
NwFreeIrp(
    PIRP Irp
    );

PMDL
NwAllocateMdl(
    PVOID Va,
    ULONG Length,
    BOOLEAN Secondary,
    BOOLEAN ChargeQuota,
    PIRP Irp
    );

VOID
NwFreeMdl(
    PMDL Mdl
    );

#else
#define dump( level, pointer, length ) { NOTHING;}
#endif


//  Deviosup.c

VOID
NwMapUserBuffer (
    IN OUT PIRP Irp,
    IN KPROCESSOR_MODE AccessMode,
    OUT PVOID *UserBuffer
    );

VOID
NwLockUserBuffer (
    IN OUT PIRP Irp,
    IN LOCK_OPERATION Operation,
    IN ULONG BufferLength
    );

//  Dir.c

NTSTATUS
NwFsdDirectoryControl (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

//  Encrypt.c

VOID
RespondToChallenge(
    IN PUCHAR achObjectId,
    IN POEM_STRING Password,
    IN PUCHAR pChallenge,
    OUT PUCHAR pResponse
    );

//  Exchange.c

BOOLEAN
AppendToScbQueue(
    IN PIRP_CONTEXT IrpContext,
    IN PNONPAGED_SCB NpScb
    );

VOID
PreparePacket(
    PIRP_CONTEXT pIrpContext,
    PIRP pOriginalIrp,
    PMDL pMdl
    );

NTSTATUS
PrepareAndSendPacket(
    PIRP_CONTEXT    pIrpContext
    );

NTSTATUS
SendPacket(
    PIRP_CONTEXT    pIrpContext,
    PNONPAGED_SCB   pNpScb
    );

VOID
SendNow(
    IN PIRP_CONTEXT IrpContext
    );

VOID
SetEvent(
    IN PIRP_CONTEXT IrpContext
    );

NTSTATUS
_cdecl
ExchangeWithWait(
    PIRP_CONTEXT    pIrpContext,
    PEX             pEx,
    char*           f,
    ...                         //  format specific parameters
    );

NTSTATUS
_cdecl
BuildRequestPacket(
    PIRP_CONTEXT    pIrpContext,
    PEX             pEx,
    char*           f,
    ...                       //  format specific parameters
    );

NTSTATUS
_cdecl
ParseResponse(
    PIRP_CONTEXT IrpContext,
    PUCHAR RequestHeader,
    ULONG RequestLength,
    char*  f,
    ...                       //  format specific parameters
    );

NTSTATUS
ParseNcpResponse(
    PIRP_CONTEXT IrpContext,
    PNCP_RESPONSE Response
    );

BOOLEAN
VerifyResponse(
    PIRP_CONTEXT pIrpContext,
    PVOID Response
    );

VOID
FreeReceiveIrp(
    PIRP_CONTEXT IrpContext
    );

NTSTATUS
NewRouteRetry(
    IN PIRP_CONTEXT pIrpContext
    );

NTSTATUS
NewRouteBurstRetry(
    IN PIRP_CONTEXT pIrpContext
    );

ULONG
MdlLength (
    register IN PMDL Mdl
    );

VOID
NwProcessSendBurstFailure(
    PNONPAGED_SCB NpScb,
    USHORT MissingFragmentCount
    );

VOID
NwProcessSendBurstSuccess(
    PNONPAGED_SCB NpScb
    );

VOID
NwProcessReceiveBurstFailure(
    PNONPAGED_SCB NpScb,
    USHORT MissingFragmentCount
    );

VOID
NwProcessReceiveBurstSuccess(
    PNONPAGED_SCB NpScb
    );

VOID
NwProcessPositiveAck(
    PNONPAGED_SCB NpScb
    );

//  Errorlog.c

VOID
_cdecl
Error(
    IN ULONG UniqueErrorCode,
    IN NTSTATUS NtStatusCode,
    IN PVOID ExtraInformationBuffer,
    IN USHORT ExtraInformationLength,
    IN USHORT NumberOfInsertionStrings,
    ...
    );

//  FileInfo.c

NTSTATUS
NwFsdQueryInformation (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

NTSTATUS
NwFsdSetInformation (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

NTSTATUS
NwDeleteFile(
    IN PIRP_CONTEXT pIrpContext
    );

ULONG
OccurenceCount (
    IN PUNICODE_STRING String,
    IN WCHAR SearchChar
    );

#if NWFASTIO
BOOLEAN
NwFastQueryBasicInfo (
    IN PFILE_OBJECT FileObject,
    IN BOOLEAN Wait,
    IN OUT PFILE_BASIC_INFORMATION Buffer,
    OUT PIO_STATUS_BLOCK IoStatus,
    IN PDEVICE_OBJECT DeviceObject
    );

BOOLEAN
NwFastQueryStandardInfo (
    IN PFILE_OBJECT FileObject,
    IN BOOLEAN Wait,
    IN OUT PFILE_STANDARD_INFORMATION Buffer,
    OUT PIO_STATUS_BLOCK IoStatus,
    IN PDEVICE_OBJECT DeviceObject
    );
#endif

//  Filobsup.c

VOID
NwSetFileObject (
    IN PFILE_OBJECT FileObject OPTIONAL,
    IN PVOID FsContext,
    IN PVOID FsContext2
    );

NODE_TYPE_CODE
NwDecodeFileObject (
    IN PFILE_OBJECT FileObject,
    OUT PVOID *FsContext,
    OUT PVOID *FsContext2
    );

BOOLEAN
NwIsIrpTopLevel (
    IN PIRP Irp
    );

//  Fsctl.c

NTSTATUS
NwFsdFileSystemControl (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

NTSTATUS
NwCommonFileSystemControl (
    IN PIRP_CONTEXT IrpContext
    );

NTSTATUS
NwFsdDeviceIoControl (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

PLOGON
FindUser(
    IN PLARGE_INTEGER Uid,
    IN BOOLEAN ExactMatch
    );

LARGE_INTEGER
GetUid(
    IN PSECURITY_SUBJECT_CONTEXT SubjectSecurityContext
    );

//  FspDisp.c

VOID
NwFspDispatch (
    IN PVOID Context
    );

NTSTATUS
NwPostToFsp (
    IN PIRP_CONTEXT IrpContext,
    IN BOOLEAN MarkIrpPending
    );

// hack.c

NTSTATUS
_cdecl
BuildNcpResponse(
    PIRP_CONTEXT    pIrpC,
    char*           f,
    char            Error,
    char            Status,
    ...
    );

NTSTATUS
HackSendMessage(
    PIRP_CONTEXT    pIrpContext
    );

NTSTATUS
_cdecl
HackParseResponse(
    PUCHAR Response,
    char*  FormatString,
    ...                       //  format specific parameters
    );

//  Ipx.c

NTSTATUS
IpxOpenHandle(
    OUT PHANDLE pHandle,
    OUT PDEVICE_OBJECT* ppDeviceObject,
    OUT PFILE_OBJECT* pFileObject,
    IN PVOID EaBuffer OPTIONAL,
    IN ULONG EaLength
    );

NTSTATUS
IpxOpen(
    VOID
    );

VOID
IpxClose(
    VOID
    );

VOID
BuildIpxAddress(
    IN ULONG NetworkAddress,
    IN PUCHAR NodeAddress,
    IN USHORT Socket,
    OUT PTA_IPX_ADDRESS NetworkName
    );

VOID
BuildIpxAddressEa (
    IN ULONG NetworkAddress,
    IN PUCHAR NodeAddress,
    IN USHORT Socket,
    OUT PVOID NetworkName
    );

NTSTATUS
SetEventHandler (
    IN PIRP_CONTEXT pIrpC,
    IN PNW_TDI_STRUCT pTdiStruc,
    IN ULONG EventType,
    IN PVOID pEventHandler,
    IN PVOID pContext
    );

NTSTATUS
GetMaximumPacketSize(
    IN PIRP_CONTEXT pIrpContext,
    IN PNW_TDI_STRUCT pTdiStruct,
    OUT PULONG pMaximumPacketSize
    );

NTSTATUS
GetNewRoute(
    IN PIRP_CONTEXT pIrpContext
    );

NTSTATUS
GetTickCount(
    IN PIRP_CONTEXT pIrpContext,
    OUT PUSHORT HopCount
    );

#ifndef QFE_BUILD

NTSTATUS
SubmitLineChangeRequest(
    VOID
    );

#endif

//  Lock.c

NTSTATUS
NwFsdLockControl (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

VOID
NwFreeLocksForIcb(
    PIRP_CONTEXT pIrpContext,
    PICB Icb
    );

//  Lockcode.c

VOID
NwReferenceUnlockableCodeSection (
    VOID
    );

VOID
NwDereferenceUnlockableCodeSection (
    VOID
    );

BOOLEAN
NwUnlockCodeSections(
    BOOLEAN BlockIndefinitely
    );

//  Pid.c

BOOLEAN
NwInitializePidTable(
    VOID
    );

NTSTATUS
NwMapPid(
    IN ULONG Pid32,
    OUT PUCHAR Pid8
    );

VOID
NwSetEndOfJobRequired(
    IN UCHAR Pid8
    );

VOID
NwUnmapPid(
    IN UCHAR Pid8,
    IN PIRP_CONTEXT IrpContext OPTIONAL
    );

VOID
NwUninitializePidTable(
    VOID
    );

//  Read.c

NTSTATUS
NwFsdRead(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

VOID
BurstReadTimeout(
    PIRP_CONTEXT IrpContext
    );

NTSTATUS
ResubmitBurstRead (
    IN PIRP_CONTEXT IrpContext
    );

#if NWFASTIO
BOOLEAN
NwFastRead (
    IN PFILE_OBJECT FileObject,
    IN PLARGE_INTEGER FileOffset,
    IN ULONG Length,
    IN BOOLEAN Wait,
    IN ULONG LockKey,
    OUT PVOID Buffer,
    OUT PIO_STATUS_BLOCK IoStatus,
    IN PDEVICE_OBJECT DeviceObject
    );
#endif

//  Scavenger.c

VOID
NwScavengerRoutine(
    IN PWORK_QUEUE_ITEM WorkItem
    );

BOOLEAN
NwAllocateExtraIrpContext(
    OUT PIRP_CONTEXT *ppIrpContext,
    IN PNONPAGED_SCB pScb
    );

VOID
NwFreeExtraIrpContext(
    IN PIRP_CONTEXT pIrpContext
    );

//  Security.c

NTSTATUS
MakeUidServer(
    PUNICODE_STRING UidServer,
    PLARGE_INTEGER Uid,
    PUNICODE_STRING Server
    );

NTSTATUS
Logon(
    IN PIRP_CONTEXT IrpContext
    );

VOID
FreeLogon(
    IN PLOGON Logon
    );

NTSTATUS
Logoff(
    IN PIRP_CONTEXT IrpContext
    );

NTSTATUS
UpdateUsersPassword(
    IN PUNICODE_STRING UserName,
    IN PUNICODE_STRING Password,
    OUT PLARGE_INTEGER Uid
    );

NTSTATUS
UpdateServerPassword(
    PIRP_CONTEXT IrpContext,
    IN PUNICODE_STRING ServerName,
    IN PUNICODE_STRING UserName,
    IN PUNICODE_STRING Password,
    IN PLARGE_INTEGER Uid
    );

//  String.c

NTSTATUS
DuplicateStringWithString (
    OUT PSTRING DestinationString,
    IN PSTRING SourceString,
    IN POOL_TYPE PoolType
    );


NTSTATUS
DuplicateUnicodeStringWithString (
    OUT PUNICODE_STRING DestinationString,
    IN PUNICODE_STRING SourceString,
    IN POOL_TYPE PoolType
    );

NTSTATUS
SetUnicodeString (
    IN PUNICODE_STRING Destination,
    IN ULONG Length,
    IN PWCHAR Source
    );

VOID
MergeStrings(
    IN PUNICODE_STRING Destination,
    IN PUNICODE_STRING S1,
    IN PUNICODE_STRING S2,
    IN ULONG Type
    );

//  Strucsup.c

VOID
NwInitializeRcb (
    IN PRCB Rcb
    );

VOID
NwDeleteRcb (
    IN PRCB Rcb
    );

PFCB
NwCreateFcb (
    IN PUNICODE_STRING FileName,
    IN PSCB Scb,
    IN PVCB Vcb
    );

PFCB
NwFindFcb (
    IN PSCB Scb,
    IN PVCB Vcb,
    IN PUNICODE_STRING FileName,
    IN PDCB Dcb OPTIONAL
    );

VOID
NwDereferenceFcb (
    IN PIRP_CONTEXT IrpContext,
    IN PFCB Fcb
    );

PICB
NwCreateIcb (
    IN USHORT Type,
    IN PVOID Associate
    );

VOID
NwVerifyIcb (
    IN PICB Icb
    );

VOID
NwVerifyIcbSpecial(
    IN PICB Icb
    );

VOID
NwVerifyScb (
    IN PSCB Scb
    );

VOID
NwDeleteIcb (
    IN PIRP_CONTEXT IrpContext OPTIONAL,
    IN PICB Icb
    );

PVCB
NwFindVcb (
    IN PIRP_CONTEXT IrpContext,
    IN PUNICODE_STRING VolumeName,
    IN ULONG ShareType,
    IN WCHAR DriveLetter,
    IN BOOLEAN ExplicitConnection,
    IN BOOLEAN FindExisting
    );

PVCB
NwCreateVcb (
    IN PIRP_CONTEXT IrpContext,
    IN PSCB Scb,
    IN PUNICODE_STRING VolumeName,
    IN ULONG ShareType,
    IN WCHAR DriveLetter,
    IN BOOLEAN ExplicitConnection
    );

VOID
NwDereferenceVcb (
    IN PVCB Vcb,
    IN PIRP_CONTEXT IrpContext OPTIONAL
    );

VOID
NwCleanupVcb(
    IN PVCB pVcb,
    IN PIRP_CONTEXT pIrpContext
    );

VOID
NwCloseAllVcbs(
    PIRP_CONTEXT pIrpContext
    );

VOID
NwReopenVcbHandlesForScb (
    IN PIRP_CONTEXT IrpContext,
    IN PSCB Scb
    );

ULONG
NwInvalidateAllHandles (
    PLARGE_INTEGER Uid
    );

ULONG
NwInvalidateAllHandlesForScb (
    PSCB Scb
    );

BOOLEAN
IsFatNameValid (
    IN PUNICODE_STRING FileName
    );

//  Timer.c

VOID
StartTimer(
    );

VOID
StopTimer(
    );

//  Util.c

VOID
CopyBufferToMdl(
    PMDL DestinationMdl,
    ULONG DataOffset,
    PVOID SourceData,
    ULONG SourceByteCount
    );

//  VolInfo.c

NTSTATUS
NwFsdQueryVolumeInformation (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

NTSTATUS
NwFsdSetVolumeInformation (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

//  WorkQue.c

PIRP_CONTEXT
AllocateIrpContext (
    PIRP pIrp
    );

VOID
FreeIrpContext (
    PIRP_CONTEXT IrpContext
    );

VOID
InitializeIrpContext (
    VOID
    );

VOID
UninitializeIrpContext (
    VOID
    );

VOID
NwCompleteRequest (
    PIRP_CONTEXT IrpContext,
    NTSTATUS Status
    );

VOID
NwAppendToQueueAndWait(
    PIRP_CONTEXT IrpContext
    );

VOID
NwDequeueIrpContext(
    IN PIRP_CONTEXT IrpContext,
    IN BOOLEAN OwnSpinLock
    );

VOID
NwCancelIrp (
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

PIRP
NwAllocateSendIrp (
    PIRP_CONTEXT IrpContext
    );

PMINI_IRP_CONTEXT
AllocateMiniIrpContext (
    PIRP_CONTEXT IrpContext
    );

VOID
FreeMiniIrpContext (
    PMINI_IRP_CONTEXT MiniIrpContext
    );

//  Write.c

NTSTATUS
NwFsdWrite(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

NTSTATUS
DoWrite(
    PIRP_CONTEXT IrpContext,
    LARGE_INTEGER ByteOffset,
    ULONG BufferLength,
    PVOID WriteBuffer,
    PMDL WriteMdl
    );

NTSTATUS
NwFsdFlushBuffers(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp
    );

NTSTATUS
ResubmitBurstWrite(
    PIRP_CONTEXT IrpContext
    );

#if NWFASTIO
BOOLEAN
NwFastWrite (
    IN PFILE_OBJECT FileObject,
    IN PLARGE_INTEGER FileOffset,
    IN ULONG Length,
    IN BOOLEAN Wait,
    IN ULONG LockKey,
    OUT PVOID Buffer,
    OUT PIO_STATUS_BLOCK IoStatus,
    IN PDEVICE_OBJECT DeviceObject
    );
#endif

//
//  A function that returns finished denotes if it was able to complete the
//  operation (TRUE) or could not complete the operation (FALSE) because the
//  wait value stored in the irp context was false and we would have had
//  to block for a resource or I/O
//

typedef BOOLEAN FINISHED;

//
//  Miscellaneous support routines
//

//
//  This macro returns TRUE if a flag in a set of flags is on and FALSE
//  otherwise.  It is followed by two macros for setting and clearing
//  flags
//

#define FlagOn(Flags,SingleFlag)        ((Flags) & (SingleFlag))
#define BooleanFlagOn(Flags,SingleFlag) ((BOOLEAN)((((Flags) & (SingleFlag)) != 0)))

#define SetFlag(Flags,SingleFlag) { \
    (Flags) |= (SingleFlag);        \
}


#define ClearFlag(Flags,SingleFlag) { \
    (Flags) &= ~(SingleFlag);         \
}

//
//  The following macro is used to determine if an FSD thread can block
//  for I/O or wait for a resource.  It returns TRUE if the thread can
//  block and FALSE otherwise.  This attribute can then be used to call
//  the FSD & FSP common work routine with the proper wait value.
//

#define CanFsdWait(IRP) IoIsOperationSynchronous(IRP)

//
//  This macro takes a pointer (or ulong) and returns its rounded up word
//  value
//

#define WordAlign(Ptr) (                \
    ((((ULONG)(Ptr)) + 1) & 0xfffffffe) \
    )

//
//  This macro takes a pointer (or ulong) and returns its rounded up longword
//  value
//

#define LongAlign(Ptr) (                \
    ((((ULONG)(Ptr)) + 3) & 0xfffffffc) \
    )

//
//  This macro takes a pointer (or ulong) and returns its rounded up quadword
//  value
//

#define QuadAlign(Ptr) (                \
    ((((ULONG)(Ptr)) + 7) & 0xfffffff8) \
    )

//
//  The following two macro are used by the Fsd/Fsp exception handlers to
//  process an exception.  The first macro is the exception filter used in the
//  Fsd/Fsp to decide if an exception should be handled at this level.
//  The second macro decides if the exception is to be finished off by
//  completing the IRP, and cleaning up the Irp Context, or if we should
//  bugcheck.  Exception values such as STATUS_FILE_INVALID (raised by
//  VerfySup.c) cause us to complete the Irp and cleanup, while exceptions
//  such as accvio cause us to bugcheck.
//
//  The basic structure for fsd/fsp exception handling is as follows:
//
//  NwFsdXxx(...)
//  {
//      try {
//
//          ...
//
//      } except(NwExceptionFilter( IrpContext, GetExceptionCode() )) {
//
//          Status = NwProcessException( IrpContext, Irp, GetExceptionCode() );
//      }
//
//      Return Status;
//  }
//
//  To explicitly raise an exception that we expect, such as
//  STATUS_FILE_INVALID, use the below macro NwRaiseStatus().  To raise a
//  status from an unknown origin (such as CcFlushCache()), use the macro
//  NwNormalizeAndRaiseStatus.  This will raise the status if it is expected,
//  or raise STATUS_UNEXPECTED_IO_ERROR if it is not.
//
//  Note that when using these two macros, the original status is placed in
//  IrpContext->ExceptionStatus, signaling NwExceptionFilter and
//  NwProcessException that the status we actually raise is by definition
//  expected.
//

LONG
NwExceptionFilter (
    IN PIRP Irp,
    IN PEXCEPTION_POINTERS ExceptionPointer
    );

NTSTATUS
NwProcessException (
    IN PIRP_CONTEXT IrpContext,
    IN NTSTATUS ExceptionCode
    );

//
//  VOID
//  NwRaiseStatus (
//      IN NT_STATUS Status
//  );
//
//

#define NwRaiseStatus(IRPCONTEXT,STATUS) {   \
    ExRaiseStatus( (STATUS) );                \
    KeBugCheck( NW_FILE_SYSTEM );            \
}

//
//  VOID
//  NwNormalAndRaiseStatus (
//      IN NT_STATUS Status
//  );
//

#define NwNormalizeAndRaiseStatus(IRPCONTEXT,STATUS) {                         \
    if ((STATUS) == STATUS_VERIFY_REQUIRED) { ExRaiseStatus((STATUS)); }        \
    ExRaiseStatus(FsRtlNormalizeNtstatus((STATUS),STATUS_UNEXPECTED_IO_ERROR)); \
    KeBugCheck( NW_FILE_SYSTEM );                                              \
}

//
//  The Following routine makes a popup
//

#define NwRaiseInformationalHardError(STATUS,NAME) {               \
    UNICODE_STRING Name;                                                       \
    if (NT_SUCCESS(RtlOemStringToCountedUnicodeString(&Name, (NAME), TRUE))) { \
        IoRaiseInformationalHardError(Status, &Name, (Irp == NULL ?\
             NULL : &(Irp->Tail.Overlay.Thread)->Tcb));            \
        RtlFreeUnicodeString(&Name);                                           \
    }                                                                          \
}


//
//  The following macros are used to establish the semantics needed
//  to do a return from within a try-finally clause.  As a rule every
//  try clause must end with a label call try_exit.  For example,
//
//      try {
//              :
//              :
//
//      try_exit: NOTHING;
//      } finally {
//
//              :
//              :
//      }
//
//  Every return statement executed inside of a try clause should use the
//  try_return macro.  If the compiler fully supports the try-finally construct
//  then the macro should be
//
//      #define try_return(S)  { return(S); }
//
//  If the compiler does not support the try-finally construct then the macro
//  should be
//
//      #define try_return(S)  { S; goto try_exit; }
//

#define try_return(S) { S; goto try_exit; }


#if NWDBG
#define InternalError(String) {                             \
    DbgPrint("Internal NetWare Redirector Error ");         \
    DbgPrint String;                                        \
    DbgPrint("\nFile %s, Line %d\n", __FILE__, __LINE__);   \
    ASSERT(FALSE);                                          \
}
#else
#define InternalError(String) {NOTHING;}
#endif

#define DbgPrintf DbgPrint

//
//  Reference and dereference Macros.
//

#define NwReferenceScb( pNpScb ) \
        ASSERT( (pNpScb)->NodeTypeCode == NW_NTC_SCBNP ); \
        ExInterlockedIncrementLong( &(pNpScb)->Reference, &(pNpScb)->NpScbInterLock )

#define NwDereferenceScb( pNpScb ) \
        ASSERT( (pNpScb)->NodeTypeCode == NW_NTC_SCBNP ); \
        ExInterlockedDecrementLong( &(pNpScb)->Reference, &(pNpScb)->NpScbInterLock )

//
//  VCB macros must be called with the RCB resource held.
//

#define NwReferenceVcb( pVcb )      ++(pVcb)->Reference; DebugTrace(0, Dbg, "Referencing VCB %X\n", pVcb )

//
// Resource acquisition and release macros
//

#if NWDBG

VOID
NwAcquireExclusiveRcb(
    PRCB Rcb,
    BOOLEAN Wait
    );

VOID
NwAcquireSharedRcb(
    PRCB Rcb,
    BOOLEAN Wait
    );

VOID
NwReleaseRcb(
    PRCB Rcb
    );

VOID
NwAcquireExclusiveFcb(
    PNONPAGED_FCB pFcb,
    BOOLEAN Wait
    );

VOID
NwAcquireSharedFcb(
    PNONPAGED_FCB pFcb,
    BOOLEAN Wait
    );

VOID
NwReleaseFcb(
    PNONPAGED_FCB pFcb
    );

VOID
NwAcquireOpenLock(
    VOID
    );

VOID
NwReleaseOpenLock(
    VOID
    );

#else

#define NwAcquireExclusiveRcb( Rcb, Wait )  \
    ExAcquireResourceExclusive( &((Rcb)->Resource), Wait )

#define NwAcquireSharedRcb( Rcb, Wait )  \
    ExAcquireResourceShared( &((Rcb)->Resource), Wait )

#define NwReleaseRcb( Rcb ) \
    ExReleaseResource( &((Rcb)->Resource) )

#define NwAcquireExclusiveFcb( pFcb, Wait )  \
    ExAcquireResourceExclusive( &((pFcb)->Resource), Wait )

#define NwAcquireSharedFcb( pFcb, Wait )  \
    ExAcquireResourceShared( &((pFcb)->Resource), Wait )

#define NwReleaseFcb( pFcb ) \
    ExReleaseResource( &((pFcb)->Resource) )

#define NwAcquireOpenLock( ) \
    ExAcquireResourceExclusive( &NwOpenResource, TRUE )

#define NwReleaseOpenLock( ) \
    ExReleaseResource( &NwOpenResource )

#endif

#define NwReleaseFcbForThread( pFcb, pThread ) \
    ExReleaseResourceForThread( &((pFcb)->Resource), pThread )

//
//  Memory allocation and deallocation macros
//

#ifdef NWDBG

#define ALLOCATE_POOL_EX( Type, Size )  NwAllocatePool( Type, Size, TRUE )
#define ALLOCATE_POOL( Type, Size )     NwAllocatePool( Type, Size, FALSE )
#define FREE_POOL( Buffer )             NwFreePool( Buffer )

#define ALLOCATE_IRP( Size, ChargeQuota ) \
                                        NwAllocateIrp( Size, ChargeQuota )
#define FREE_IRP( Irp )                 NwFreeIrp( Irp )

#define ALLOCATE_MDL( Va, Length, Secondary, ChargeQuota, Irp ) \
                    NwAllocateMdl(Va, Length, Secondary, ChargeQuota, Irp )
#define FREE_MDL( Mdl )                 NwFreeMdl( Mdl )

#else

#define ALLOCATE_POOL_EX( Type, Size )  FsRtlAllocatePool( Type, Size )
#define ALLOCATE_POOL( Type, Size )     ExAllocatePoolWithTag( Type, Size, 'scwn' )
#define FREE_POOL( Buffer )             ExFreePool( Buffer )

#define ALLOCATE_IRP( Size, ChargeQuota ) \
                                        IoAllocateIrp( Size, ChargeQuota )
#define FREE_IRP( Irp )                 IoFreeIrp( Irp )

#define ALLOCATE_MDL( Va, Length, Secondary, ChargeQuota, Irp ) \
                    IoAllocateMdl(Va, Length, Secondary, ChargeQuota, Irp )
#define FREE_MDL( Mdl )                 IoFreeMdl( Mdl )
#endif

//
// Useful macros
//

#define MIN(a,b)     ((a)<(b) ? (a):(b))
#define MAX(a,b)     ((a)>(b) ? (a):(b))

#define DIFFERENT_PAGES( START, SIZE ) \
    (((ULONG)START & ~(4096-1)) != (((ULONG)START + SIZE) & ~(4096-1)))

#define UP_LEVEL_SERVER( Scb )  \
    ( ( Scb->MajorVersion >= 4 ) ||   \
      ( Scb->MajorVersion == 3 && Scb->MinorVersion >= 12 ) )

#define LFN_SUPPORTED( Scb )  \
    ( ( Scb->MajorVersion >= 4 ) ||   \
      ( Scb->MajorVersion == 3 && Scb->MinorVersion >= 11 ) )

#define LongByteSwap( l1, l2 )     \
{                                  \
    PUCHAR c1 = (PUCHAR)&l1;       \
    PUCHAR c2 = (PUCHAR)&l2;       \
    c1[0] = c2[3];                 \
    c1[1] = c2[2];                 \
    c1[2] = c2[1];                 \
    c1[3] = c2[0];                 \
}

#define ShortByteSwap( s1, s2 )    \
{                                  \
    PUCHAR c1 = (PUCHAR)&s1;       \
    PUCHAR c2 = (PUCHAR)&s2;       \
    c1[0] = c2[1];                 \
    c1[1] = c2[0];                 \
}

//
//  Macros to isolate NT 3.1 and NT 3.5 differences.
//

#ifdef QFE_BUILD

#define NwGetTopLevelIrp()     (PIRP)(PsGetCurrentThread()->TopLevelIrp)
#define NwSetTopLevelIrp(Irp)  (PIRP)(PsGetCurrentThread())->TopLevelIrp = Irp;


#else

#define NwGetTopLevelIrp()     IoGetTopLevelIrp()
#define NwSetTopLevelIrp(Irp)  IoSetTopLevelIrp(Irp)

#endif

#endif // _NWPROCS_
