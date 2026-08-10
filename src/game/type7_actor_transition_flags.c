#include "tingle/types.h"

/*
 * Recovered type-seven boundary-transition flag helpers. They clear transient
 * movement state after a transition and classify the actor's active state.
 */

/*
 * Input is a type-seven actor. If +0x268 bit 0x80000 marks an active boundary
 * transition, clear word +0x210 and bits 0x20/0x80 in +0x268. Otherwise leave
 * the actor unchanged. No value is returned and there are no SDK or hardware
 * effects.
 */
void Type7Actor_ClearBoundaryTransitionFlags(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x268) & 0x80000) != 0) {
        *(u32 *)(actor + 0x210) = 0;
        *(u32 *)(actor + 0x268) &= ~0xa0;
    }
}

/*
 * Input is a type-seven actor. Return a state code using the retail priority:
 * +0x268 bit 0x400 => 5, bit 0x40000 => 6, bit 0x80000 => 7, non-null +0x234
 * => 1, missing bit 0x10 => 2, bit 0x800000 => 8, either bit 0x20/0x80 => 3,
 * bit 0x40 => 4, and zero otherwise. Actor state is read only and there are no
 * SDK or hardware effects.
 */
s32 Type7Actor_GetStateCode(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags = *(u32 *)(actor + 0x268);
    if ((flags & 0x400) != 0)
        return 5;
    if ((flags & 0x40000) != 0)
        return 6;
    if ((flags & 0x80000) != 0)
        return 7;
    if (*(void **)(actor + 0x234) != 0)
        return 1;
    if ((flags & 0x10) == 0)
        return 2;
    if ((flags & 0x800000) != 0)
        return 8;
    if ((flags & 0xa0) != 0)
        return 3;
    if ((flags & 0x40) != 0)
        return 4;
    return 0;
}
