#include "tingle/actor.h"

/* Provide compact state, scalar-constant, and flag-reset helpers for extended
 * type two. */

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
void ActorExtendedType2_ClearTransientContactState(Actor *self)
{
    Actor_ClearTransientContactState(self);
    *(u32 *)((u8 *)self + 0x260) &= ~0x190;
}
