#include "tingle/types.h"

/* Provide compact state, scalar-constant, and flag-reset helpers for extended type two. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_ClearTransientContactState(void *actor);
#ifdef __cplusplus
}
#endif

/* Return one unless signed actor state +0xd6 equals 0x10; change no state. */
s32 ActorExtendedType2_IsStateNot16(const void *self)
{
    return *(const s16 *)((const u8 *)self + 0xd6) != 0x10;
}

/* Take no inputs, return the constant 0x800, and change no state. */
s32 ActorExtendedType2_GetConstant800(void)
{
    return 0x800;
}

/* Take no inputs, return the duplicate interface constant 0x800, and change no state. */
s32 ActorExtendedType2_GetConstant800Duplicate(void)
{
    return 0x800;
}

/*
 * Invoke Actor_ClearTransientContactState on actor, then clear recovered flags
 * 0x10, 0x80, and 0x100 in actor word +0x260. Returns no value; base helper and
 * actor state change.
 */
void ActorExtendedType2_ClearTransientInteractionState(void *self)
{
    u8 *actor = (u8 *)self;
    Actor_ClearTransientContactState(actor);
    *(u32 *)(actor + 0x260) &= ~0x190;
}
