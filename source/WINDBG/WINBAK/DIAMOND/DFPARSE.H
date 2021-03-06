/***    dfparse.h - Definitions for Directives File parser
 *
 *      Microsoft Confidential
 *      Copyright (C) Microsoft Corporation 1993-1994
 *      All Rights Reserved.
 *
 *  Author:
 *      Benjamin W. Slivka
 *
 *  History:
 *      10-Aug-1993 bens    Initial version
 *      12-Aug-1993 bens    Removed summary of directives file syntax
 *      14-Aug-1993 bens    Start working on parser proper
 *      21-Aug-1993 bens    Return HVARLIST from DFPInit()
 *      22-Aug-1993 bens    Fleshed out directive parsing
 *      10-Feb-1994 bens    Added SESSION asserts
 *      14-Feb-1994 bens    Added FCI context information
 *      15-Feb-1994 bens    Export DFPParseVarAssignment()
 *      16-Feb-1994 bens    Add file byte count totals to SESSION
 *      21-Feb-1994 bens    Add wrapper for stdout writes (lineOut)
 *      08-Mar-1994 bens    Control INF generation
 *      30-Mar-1994 bens    Keep track of file counts per folder/cabinet/disk
 */

#ifndef INCLUDED_DFPARSE
#define INCLUDED_DFPARSE 1
 
#include <time.h>
 
#include "error.h" 
#include "textfile.h"
#include "variable.h"
#include "filelist.h"
#include "fileutil.h"       // Get cbFILE_NAME_MAX
#include "command.h"

#include "inf.h"

#ifdef BIT16
#include "chuck\fci.h"
#else // !BIT16
#include "chuck\xp\fci.h"
#endif // !BIT16


//** Random constants
//BUGBUG 21-Feb-1994 bens Hard-coded screen width
#define cchSCREEN_WIDTH     79  // Width of std screen - 1


//** Directive file limits
#define cbMAX_DF_LINE       256 // Maximum length of a directives file line
#define cbMAX_COMMAND_NAME   50 // Maxmimum length of a command name



typedef enum {
    actBAD,         // Invalid action
    actHELP,        // Show help
    actFILE,        // Compress a single file specification
    actDIRECTIVE,   // Process a directives file
} ACTION;   /* act */

typedef enum {
    vbNONE,         // Minimal output during disk layout
    vbSOME,         // Only high-level status feedback
    vbMORE,         // Medium level status feedback
    vbFULL,         // Lots of feedback!
} VERBOSITY;

#ifdef ASSERT
#define sigSESSION MAKESIG('S','E','S','S')  // SESSION signature
#define AssertSess(psess) AssertStructure(psess,sigSESSION);
#else // !ASSERT
#define AssertSess(psess)
#endif // !ASSERT

typedef struct {
#ifdef ASSERT
    SIGNATURE   sig;                // structure signature sigSESSION
#endif
    ACTION      act;                // Action to perform
    HFILELIST   hflistDirectives;   // Directive file list, or single file
    HFILELIST   hflistNormal;       // Normal files (including groups)
    HFILELIST   hflistFiller;       // Filler files (go anywhere)
    HFILELIST   hflistOnDisk;       // File for specific disks
    HVARLIST    hvlist;             // List of variables
    BOOL        fFiller;            // TRUE => Inside .Filler/.EndFiller
    BOOL        fOnDisk;            // TRUE => Inside .OnDisk/.EndOnDisk
    BOOL        fGroup;             // TRUE => Inside .Group/.EndGroup
    int         iDisk;              // Current disk number
    int         iCabinet;           // Current cabinet number
    int         iFolder;            // Current folder number
    long        cbDiskLeft;         // Count of bytes left on current disk
    long        cFilesInFolder;     // Count of files in current folder
    long        cFilesInCabinet;    // Count of files in current cabinet
    long        cFilesInDisk;       // Count of files in current disk
    long        cbCabinetEstimate;  // Estimated size of last cabinet
    long        cbClusterCabEst;    // Custer size for estimated cabinet
    int         cErrors;            // Count of errors encountered
    int         cWarnings;          // Count of warnings encountered
    VERBOSITY   levelVerbose;       // Verbosity level
    HFCI        hfci;               // FCI context
    ERF         erf;                // FCI error structure
    BOOL        fNoLineFeed;        // TRUE if last printf did not have \n
    int         cchLastLine;        // Length of last line written to stdout
    ULONG       cbTotalFileBytes;   // Total bytes in files (from pass 1)
    ULONG       cbFileBytes;        // Running total of bytes processed
    ULONG       cbFileBytesComp;    // Running total of compressed bytes
    long        cFiles;             // Total files in directives file(s)
    long        iCurrFile;          // Index of last file sent to FCIAddFile
    HINF        hinf;               // Inf file info
    clock_t	clkStart;	    // Time at start of run
    clock_t	clkEnd;		    // Time at end of run
    BOOL        fGenerateInf;       // TRUE => generate INF file
    USHORT      setID;              // Cabinet set ID for FCI
    char        achCurrFile[cbFILE_NAME_MAX]; // Last file sent to FCIAddFile
    char        achMsg[cbMAX_DF_LINE*2]; // Message formatting buffer
    char        achBlanks[cchSCREEN_WIDTH+1]; // Buffer of spaces
    char        achCurrDiskLabel[cbFILE_NAME_MAX]; // Current readable disk label
    char        achCurrOutputDir[cbFILE_NAME_MAX]; // Current output disk directory
} SESSION;  /* sess */
typedef SESSION *PSESSION;  /* psess */


/***    PFNDIRFILEPARSE - Function type for DFPParse call back
 ***    FNDIRFILEPARSE - macro to help define DFPParse call back function
 *
 *  Entry:
 *	psess	- Session
 *	pcmd	- Command to process
 *      htfDF   - Handle to directives file
 *      pszLine - Line from directives file
 *      iLine   - Line number in directives file
 *      perr    - ERROR structure
 *      
 *  Exit-Success:
 *      Returns TRUE; continue with parse.
 *
 *  Exit-Failure:
 *      Returns FALSE; abort parse
 *      ERROR structure filled in with details of error.
 */
typedef (*PFNDIRFILEPARSE)(PSESSION   psess,
			   PCOMMAND   pcmd,
                           HTEXTFILE  htfDF,
                           char      *pszLine,
                           int        iLine,
                           PERROR     perr);
#define FNDIRFILEPARSE(fn) BOOL fn(PSESSION   psess,	  \
				   PCOMMAND   pcmd,	  \
                                   HTEXTFILE  htfDF,      \
                                   char      *pszLine,    \
                                   int        iLine,      \
                                   PERROR     perr)


/***    DFPInit - initialize directive file parser
 *
 *  Entry:
 *      perr - ERROR structure
 *
 *  Exit-Success:
 *      Returns HVARLIST of standard variables.
 *
 *  Exit-Failure:
 *      Returns NULL; perr filled in with error.
 */
HVARLIST DFPInit(PERROR perr);
 

/***    DFPParse - Parse a directive file
 *
 *  Entry:
 *      psess  - Session
 *      htfDF  - Open directive file to parse
 *      pfndfp - Function to call back after each line is parsed
 *      perr   - ERROR structure
 *
 *  Exit-Success:
 *      Returns TRUE; directives file parsed successfully
 *
 *  Exit-Failure:
 *      Returns FALSE; perr filled in with error.
 */
BOOL DFPParse(PSESSION        psess,
              HTEXTFILE       htfDF,
              PFNDIRFILEPARSE pfndfp,
              PERROR          perr);


/***    DFPParseVarAssignment - Parse var=value string
 *
 *  Entry:
 *      pcmd   - Command to fill in after line is parsed
 *      psess  - Session state
 *      pszArg - Start of argument string (var=value or var="value")
 *      perr   - ERROR structure
 *
 *  Exit-Success:
 *      Returns TRUE; pcmd filled in
 *
 *  Exit-Failure:
 *      Returns FALSE; perr filled in with error.
 *
 *  Syntax:
 *      var=value
 *      var="value"
 *
 *  NOTES:
 *  (1) Any leading spaces (between = operator and first non-whitespace
 *      character) are removed from value, as are any trailing spaces.
 *  (2) No variable substition is performed by this function.
 *
 */
BOOL DFPParseVarAssignment(PCOMMAND pcmd,
                           PSESSION psess,
                           char *   pszArg,
                           PERROR   perr);


/***    IsSpecialDiskSize - Check if supplied size is a standard one
 *
 *  Entry:
 *      psess  - Session state
 *      cbDisk - Disk size
 *
 *  Exit-Success:
 *      Returns TRUE; cbDisk is a standard size
 *
 *  Exit-Failure:
 *      Returns FALSE; cbDisk is not a standard size
 */
BOOL IsSpecialDiskSize(PSESSION psess,long cbDisk);


/***    lineOut - write line to stdout with padding
 *
 *  Entry:
 *      psess - Current session
 *      pszLine - Line to write
 *      fLineFeed - TRUE => write line feed (else, just carriage return)
 *
 *  Exit:
 *      Line written to stdout
 */
void lineOut(PSESSION psess, char *pszLine, BOOL fLineFeed);

#endif // !INCLUDED_DFPARSE
