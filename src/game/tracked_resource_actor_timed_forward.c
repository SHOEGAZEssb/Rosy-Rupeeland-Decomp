#include "tingle/types.h"

/* Recovered paired callback forwarder for a timed tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorContactState_AddContact(void *actor, void *other,
                                        s32 wasTracked);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef void (*ForwardFunction)(void *actor, void *other, s32 wasTracked);

/*
 * Inputs are a timed actor and two opaque callback arguments. Forwards all
 * three values first to actor virtual slot 0xC4 and then to ActorContactState_AddContact.
 * Returns nothing. Both callbacks can mutate engine state or cross SDK
 * boundaries; this wrapper has no direct hardware effects.
 */
void TrackedResourceActorType26_ForwardInteractionCallback(
    void *actor, void *other, s32 wasTracked)
{
    (*(ForwardFunction *)((u8 *)FIELD(void *, actor, 0) + 0xc4))
        (actor, other, wasTracked);
    ActorContactState_AddContact(actor, other, wasTracked);
}
