#include "tingle/types.h"

/* Recovered paired callback forwarder for a timed tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032a94(void *actor, u32 argument1, u32 argument2);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef void (*ForwardFunction)(void *, u32, u32);

/*
 * Inputs are a timed actor and two opaque callback arguments. Forwards all
 * three values first to actor virtual slot 0xC4 and then to func_02032a94.
 * Returns nothing. Both callbacks can mutate engine state or cross SDK
 * boundaries; this wrapper has no direct hardware effects.
 */
void TrackedResourceActorType26_ForwardInteractionCallback(void *actor, u32 argument1, u32 argument2)
{
    (*(ForwardFunction *)((u8 *)FIELD(void *, actor, 0) + 0xc4))
        (actor, argument1, argument2);
    func_02032a94(actor, argument1, argument2);
}
