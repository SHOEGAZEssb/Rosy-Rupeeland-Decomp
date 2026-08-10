#include "tingle/types.h"

/* Recovered completion and late-duration presentation callbacks for an impulse-oriented tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_QueueActorForRemoval(void *handle, void *actor);
extern void *Actor_GetCollection(void *actor);
extern void TrackedResourceActor_EmitRecordEffects(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an impulse actor. Obtains its recovered handle through Actor_GetCollection,
 * notifies ActorCollection_QueueActorForRemoval with the handle and actor, then invokes the recovered
 * effect helper TrackedResourceActor_EmitRecordEffects. Returns nothing; engine resources and effects
 * may change, but hardware is not accessed directly.
 */
void func_020520b4(void *actor)
{
    ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
    TrackedResourceActor_EmitRecordEffects(actor);
}

/*
 * Input is an impulse actor. Increments signed timer 0x1F8. Once the timer is
 * greater than signed record halfword 0x28 minus 60, toggles presentation bit 4
 * at presentation offset 0x24 according to timer bit 2; before that threshold
 * it changes nothing else. Returns nothing and has no direct hardware access.
 */
void func_020520d4(void *actor)
{
    s16 timer = ++FIELD(s16, actor, 0x1f8);
    const void *record = FIELD(const void *, actor, 0x1fc);
    void *presentation;
    if (timer <= FIELD(s16, record, 0x28) - 0x3c)
        return;
    presentation = FIELD(void *, actor, 0x54);
    if ((timer & 4) != 0)
        FIELD(u16, presentation, 0x24) |= 4;
    else
        FIELD(u16, presentation, 0x24) &= (u16)~4;
}
