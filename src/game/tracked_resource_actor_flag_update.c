#include "tingle/types.h"

/* Recovered delayed flag update for the tracked-resource actor. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef s32 (*ActorPredicate)(void *actor);

/*
 * Input is an actor. Invoke virtual predicate slot 0xD0; if it returns zero and
 * signed counter 0x1F8 exceeds 20, clear actor flag 0x40000. Returns nothing;
 * the actor flag may change and there are no SDK or hardware effects.
 */
void TrackedResourceActor_UpdateDelayedFlag(void *actor)
{
    ActorPredicate predicate =
        *(ActorPredicate *)((u8 *)FIELD(void *, actor, 0) + 0xd0);
    if (predicate(actor) == 0 && FIELD(s16, actor, 0x1f8) > 20)
        FIELD(u32, actor, 0x10) &= ~0x40000u;
}

