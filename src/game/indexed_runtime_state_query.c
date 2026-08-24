#include "tingle/types.h"

/*
 * Scenario status query recovered from ARM9 0x0208372C.
 *
 * Two resident callback tables classify a borrowed scenario index. A true
 * completion predicate has priority and returns two; otherwise a true running
 * predicate returns one, and neither returns zero. Table callbacks take the
 * selected scenario implicitly through their own globals and have no arguments
 * in the retail ABI.
 */

typedef s32 (*IndexedRuntimeQuery)(void);

extern IndexedRuntimeQuery gScenarioCompletionPredicates[];
extern IndexedRuntimeQuery gScenarioRunningPredicates[];

/* Return 2 for complete, 1 for running, or 0 for waiting. */
s32 Scenario_GetStatus(s32 scenario_index)
{
    if (gScenarioCompletionPredicates[scenario_index]())
        return 2;
    return gScenarioRunningPredicates[scenario_index]() ? 1 : 0;
}
