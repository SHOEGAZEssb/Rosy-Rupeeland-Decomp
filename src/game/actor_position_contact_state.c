#include "tingle/actor_pair_state.h"

/* Copy actor position and maintain a byte-counted contact flag. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *VecFx32Object_Assign(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor word-0xd0 flag 0x80, set flag 0x200, copy source vector to
 * previous position 0x28, then copy that result to current position 0x18.
 * Returns no value; the value-copy helper may manage SDK object state.
 */
void Actor_SetPosition(void *self, const void *source)
{
    u8 *actor = (u8 *)self;
    void *copied;

    *(u32 *)(actor + 0xd0) =
        (*(u32 *)(actor + 0xd0) & ~0x80) | 0x200;
    copied = VecFx32Object_Assign(actor + 0x28, source);
    VecFx32Object_Assign(actor + 0x18, copied);
}

/*
 * When wasTracked is zero, increment active-contact count byte 0x4c and set
 * the active-contact flag at 0x10. Other inputs are otherwise ignored. Always
 * return one; no helpers run.
 */
s32 ActorContactState_AddContact(ActorPairActor *actor,
                                 ActorPairActor *other, s32 wasTracked)
{
    ActorPairContactStateView *state = (ActorPairContactStateView *)actor;
    (void)other;
    if (!wasTracked) {
        state->activeContactCount_4c++;
        state->flags_10 |= ACTOR_PAIR_ACTIVE_CONTACT_FLAG;
    }
    return 1;
}

/*
 * Decrement a nonzero active-contact count. When it reaches zero, retain zero
 * and clear the active-contact flag at 0x10. Returns no value and calls no
 * helpers.
 */
void ActorContactState_RemoveContact(ActorPairActor *actor)
{
    ActorPairContactStateView *state = (ActorPairContactStateView *)actor;
    if (!state->activeContactCount_4c)
        return;
    state->activeContactCount_4c--;
    if (!state->activeContactCount_4c)
        state->flags_10 &= ~ACTOR_PAIR_ACTIVE_CONTACT_FLAG;
}
