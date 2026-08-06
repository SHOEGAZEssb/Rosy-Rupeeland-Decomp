#include "tingle/types.h"

/* Recovered paired post-update callback for the trigger-presentation actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203392c(void *actor);
extern void func_02034044(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is an actor. Run func_0203392c followed by func_02034044 and return
 * nothing. Only the callees' engine effects are observable; hardware is not
 * accessed directly.
 */
void func_0204ebf4(void *actor)
{
    func_0203392c(actor);
    func_02034044(actor);
}

