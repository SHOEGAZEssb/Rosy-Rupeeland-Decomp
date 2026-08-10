#include "tingle/types.h"

/* Provide compact state, turn-step, and flag-reset helpers for extended type two. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_ClearTransientContactState(void *actor);
#ifdef __cplusplus
}
#endif

/* Return one unless signed actor state +0xd6 equals 0x10; change no state. */
s32 func_0203ef60(const void *self)
{
    return *(const s16 *)((const u8 *)self + 0xd6) != 0x10;
}

/* Ignore all inputs, return fixed-point step 0x800, and change no state. */
s32 func_0203ef80(void)
{
    return 0x800;
}

/* Ignore all inputs, return fixed-point step 0x800, and change no state. */
s32 func_0203ef88(void)
{
    return 0x800;
}

/*
 * Invoke Actor_ClearTransientContactState on actor, then clear recovered flags 0x10, 0x80, and
 * 0x100 in actor word +0x260. Returns no value; base helper and actor state change.
 */
void func_0203ef90(void *self)
{
    u8 *actor = (u8 *)self;
    Actor_ClearTransientContactState(actor);
    *(u32 *)(actor + 0x260) &= ~0x190;
}
