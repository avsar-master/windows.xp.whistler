/*++

Copyright (c) 1993  Microsoft Corporation

Module Name:

    process.c

Abstract:

    This code provides access to the task list.

Author:

    Wesley Witt (wesw) 16-June-1993

Environment:

    User Mode

--*/

#include "precomp.h"
#pragma hdrstop


#ifndef WIN32S

#include <winperf.h>



//
// defines
//
#define INITIAL_SIZE        51200
#define EXTEND_SIZE         25600
#define REGKEY_PERF         "software\\microsoft\\windows nt\\currentversion\\perflib"
#define REGSUBKEY_COUNTERS  "Counters"
#define PROCESS_COUNTER     "process"
#define PROCESSID_COUNTER   "id process"
#define UNKNOWN_TASK        "unknown"



VOID
GetTaskList(
    PTASK_LIST  pTask,
    DWORD       dwNumTasks
    )

/*++

Routine Description:

    Provides an API for getting a list of tasks running at the time of the
    API call.  This function uses the registry performance data to get the
    task list and is therefor straight WIN32 calls that anyone can call.

Arguments:

    ldwNumTasks      - pointer to a dword that will be set to the
                       number of tasks returned.

Return Value:

    PTASK_LIST       - pointer to an array of TASK_LIST records.

--*/

{
    DWORD                        rc;
    HKEY                         hKeyNames;
    DWORD                        dwType;
    DWORD                        dwSize;
    LPBYTE                       buf = NULL;
    CHAR                         szSubKey[1024];
    LANGID                       lid;
    LPSTR                        p;
    LPSTR                        p2;
    PPERF_DATA_BLOCK             pPerf;
    PPERF_OBJECT_TYPE            pObj;
    PPERF_INSTANCE_DEFINITION    pInst;
    PPERF_COUNTER_BLOCK          pCounter;
    PPERF_COUNTER_DEFINITION     pCounterDef;
    DWORD                        i;
    DWORD                        dwProcessIdTitle;
    DWORD                        dwProcessIdCounter;
    CHAR                         szProcessName[MAX_PATH];
    DWORD                        dwLimit = dwNumTasks - 1;
    DWORD                        ThisPid = GetCurrentProcessId();



    //
    // Look for the list of counters.  Always use the neutral
    // English version, regardless of the local language.  We
    // are looking for some particular keys, and we are always
    // going to do our looking in English.  We are not going
    // to show the user the counter names, so there is no need
    // to go find the corresponding name in the local language.
    //
    lid = MAKELANGID( LANG_ENGLISH, SUBLANG_NEUTRAL );
    sprintf( szSubKey, "%s\\%03x", REGKEY_PERF, lid );
    rc = RegOpenKeyEx( HKEY_LOCAL_MACHINE,
                       szSubKey,
                       0,
                       KEY_READ,
                       &hKeyNames
                     );
    if (rc != ERROR_SUCCESS) {
        goto exit;
    }

    //
    // get the buffer size for the counter names
    //
    rc = RegQueryValueEx( hKeyNames,
                          REGSUBKEY_COUNTERS,
                          NULL,
                          &dwType,
                          NULL,
                          &dwSize
                        );

    if (rc != ERROR_SUCCESS) {
        goto exit;
    }

    //
    // allocate the counter names buffer
    //
    buf = (LPBYTE) malloc( dwSize );
    if (buf == NULL) {
        goto exit;
    }
    memset( buf, 0, dwSize );

    //
    // read the counter names from the registry
    //
    rc = RegQueryValueEx( hKeyNames,
                          REGSUBKEY_COUNTERS,
                          NULL,
                          &dwType,
                          buf,
                          &dwSize
                        );

    if (rc != ERROR_SUCCESS) {
        goto exit;
    }

    //
    // now loop thru the counter names looking for the following counters:
    //
    //      1.  "Process"           process name
    //      2.  "ID Process"        process id
    //
    // the buffer contains multiple null terminated strings and then
    // finally null terminated at the end.  the strings are in pairs of
    // counter number and counter name.
    //

    p = buf;
    while (*p) {
        if (stricmp(p, PROCESS_COUNTER) == 0) {
            //
            // look backwards for the counter number
            //
            for( p2=p-2; isdigit(*p2); p2--) ;
            strcpy( szSubKey, p2+1 );
        }
        else
        if (stricmp(p, PROCESSID_COUNTER) == 0) {
            //
            // look backwards for the counter number
            //
            for( p2=p-2; isdigit(*p2); p2--) ;
            dwProcessIdTitle = atol( p2+1 );
        }
        //
        // next string
        //
        p += (strlen(p) + 1);
    }

    //
    // free the counter names buffer
    //
    free( buf );


    //
    // allocate the initial buffer for the performance data
    //
    dwSize = INITIAL_SIZE;
    buf = malloc( dwSize );
    if (buf == NULL) {
        goto exit;
    }
    memset( buf, 0, dwSize );


    while (TRUE) {

        rc = RegQueryValueEx( HKEY_PERFORMANCE_DATA,
                              szSubKey,
                              NULL,
                              &dwType,
                              buf,
                              &dwSize
                            );

        pPerf = (PPERF_DATA_BLOCK) buf;

        //
        // check for success and valid perf data block signature
        //
        if ((rc == ERROR_SUCCESS) &&
            (dwSize > 0) &&
            (pPerf)->Signature[0] == (WCHAR)'P' &&
            (pPerf)->Signature[1] == (WCHAR)'E' &&
            (pPerf)->Signature[2] == (WCHAR)'R' &&
            (pPerf)->Signature[3] == (WCHAR)'F' ) {
            break;
        }

        //
        // if buffer is not big enough, reallocate and try again
        //
        if (rc == ERROR_MORE_DATA) {
            dwSize += EXTEND_SIZE;
            buf = realloc( buf, dwSize );
            memset( buf, 0, dwSize );
        }
        else {
            goto exit;
        }
    }

    //
    // set the perf_object_type pointer
    //
    pObj = (PPERF_OBJECT_TYPE) ((DWORD)pPerf + pPerf->HeaderLength);

    //
    // loop thru the performance counter definition records looking
    // for the process id counter and then save its offset
    //
    pCounterDef = (PPERF_COUNTER_DEFINITION) ((DWORD)pObj + pObj->HeaderLength);
    for (i=0; i<(DWORD)pObj->NumCounters; i++) {
        if (pCounterDef->CounterNameTitleIndex == dwProcessIdTitle) {
            dwProcessIdCounter = pCounterDef->CounterOffset;
            break;
        }
        pCounterDef++;
    }

    dwNumTasks = min( dwLimit, (DWORD)pObj->NumInstances );

    pInst = (PPERF_INSTANCE_DEFINITION) ((DWORD)pObj + pObj->DefinitionLength);

    //
    // loop thru the performance instance data extracting each process name
    // and process id
    //
    for (i=0; i<dwNumTasks; i++) {
        //
        // pointer to the process name
        //
        p = (LPSTR) ((DWORD)pInst + pInst->NameOffset);

        //
        // convert it to ascii
        //
        rc = WideCharToMultiByte( CP_ACP,
                                  0,
                                  (LPCWSTR)p,
                                  -1,
                                  szProcessName,
                                  sizeof(szProcessName),
                                  NULL,
                                  NULL
                                );

        if (!rc) {
            //
            // if we cant convert the string then use a bogus value
            //
            strcpy( pTask->ProcessName, UNKNOWN_TASK );
        }

        if (strlen(szProcessName)+4 <= sizeof(pTask->ProcessName)) {
            strcpy( pTask->ProcessName, szProcessName );
            strcat( pTask->ProcessName, ".exe" );
        }

        //
        // get the process id
        //
        pCounter = (PPERF_COUNTER_BLOCK) ((DWORD)pInst + pInst->ByteLength);
        pTask->dwProcessId = *((LPDWORD) ((DWORD)pCounter + dwProcessIdCounter));
        if (pTask->dwProcessId == 0) {
            pTask->dwProcessId = (DWORD)-2;
        }
        if (stricmp(szProcessName,"csrss")==0) {
            pTask->dwProcessId = (DWORD)-1;
        }

        //
        // next process
        //
        if (pTask->dwProcessId != ThisPid) {
            pTask++;
        }
        pInst = (PPERF_INSTANCE_DEFINITION) ((DWORD)pCounter + pCounter->ByteLength);
    }

exit:
    if (buf) {
        free( buf );
    }

    RegCloseKey( hKeyNames );
    RegCloseKey( HKEY_PERFORMANCE_DATA );

    return;
}

#endif
