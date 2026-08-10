#include "tingle/types.h"

/* Recovered paired post-update callback for the grid/effect actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SetInteractionFlag2000(void *actor, void *context);
extern void Type7Actor_ProcessGlobalInteractionTrigger(void *actor, void *context);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are an actor and context. Run Type7Actor_ProcessGlobalInteractionTrigger followed by Actor_SetInteractionFlag2000
 * with the same arguments. Returns nothing; only the callees' engine effects
 * are observable and no hardware is accessed directly.
 */
void func_0204f60c(void *actor, void *context)
{
    Type7Actor_ProcessGlobalInteractionTrigger(actor, context);
    Actor_SetInteractionFlag2000(actor, context);
}

