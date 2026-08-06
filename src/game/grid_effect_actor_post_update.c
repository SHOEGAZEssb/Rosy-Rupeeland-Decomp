#include "tingle/types.h"

/* Recovered paired post-update callback for the grid/effect actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203392c(void *actor, void *context);
extern void func_0204a4f0(void *actor, void *context);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are an actor and context. Run func_0204a4f0 followed by func_0203392c
 * with the same arguments. Returns nothing; only the callees' engine effects
 * are observable and no hardware is accessed directly.
 */
void func_0204f60c(void *actor, void *context)
{
    func_0204a4f0(actor, context);
    func_0203392c(actor, context);
}

