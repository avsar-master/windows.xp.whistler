//  utxcpt3.c - user mode seh test #3.

#include <xpos.h>

BOOLEAN EndTest = FALSE;

main()
{

    while (EndTest == FALSE) {
        try {
            try {
                DbgPrint("doing return\n");
                return;
            }
            finally {
                DbgPrint("in inner finally\n");
                break;
            }
        }
        finally {
	    DbgPrint("in last finally\n");
            continue;
        }
    }
}
