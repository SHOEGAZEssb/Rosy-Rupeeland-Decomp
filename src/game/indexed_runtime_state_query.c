#include "tingle/types.h"

/*
 * Indexed runtime-state query recovered from ARM9 0x0208372C.
 *
 * Two resident callback tables classify a borrowed integer index.  A true
 * result from the first table has priority and returns two; otherwise a true
 * result from the second table returns one, and neither returns zero.  Table
 * callbacks take the selected index implicitly through their own globals and
 * have no arguments in the retail ABI.
 */

typedef s32 (*IndexedRuntimeQuery)(void);

extern IndexedRuntimeQuery data_020f19a4[];
extern IndexedRuntimeQuery data_020f1cd0[];

/* Classify one index through the two ordered resident callback tables. */
s32 func_0208372c(s32 index)
{
    if (data_020f19a4[index]())
        return 2;
    return data_020f1cd0[index]() ? 1 : 0;
}
