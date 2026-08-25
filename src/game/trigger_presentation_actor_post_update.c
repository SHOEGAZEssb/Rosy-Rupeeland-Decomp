#include "tingle/types.h"

/* Recovered paired post-update callback for the trigger-presentation actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SetInteractionFlag2000(void *actor);
extern void Actor_DispatchActivationMode1(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is an actor. Run Actor_SetInteractionFlag2000 followed by Actor_DispatchActivationMode1 and return
 * nothing. Only the callees' engine effects are observable; hardware is not
 * accessed directly.
 */
void TriggerPresentationActor_PostUpdate(void *actor)
{
    Actor_SetInteractionFlag2000(actor);
    Actor_DispatchActivationMode1(actor);
}

