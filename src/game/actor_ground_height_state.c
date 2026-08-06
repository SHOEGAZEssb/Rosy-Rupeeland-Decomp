#include "tingle/types.h"

/* Query and update the actor's ground-height convergence state. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adae4(s32, s32);
extern s32 func_020be334(s32);
#ifdef __cplusplus
}
#endif

/* Return one when actor word 0xd0 has flag 0x40 set, otherwise zero. */
s32 func_020324c8(const void *self)
{
    return (*(const u32 *)((const u8 *)self + 0xd0) & 0x40) != 0;
}

/*
 * Move Z at 0x24 one eighteenth toward target 0x84 using
 * (17*current+target)/18. Set word-0xd0 flag 0x20 when the resulting absolute
 * difference is below 0x4000, otherwise clear it. Returns no value; arithmetic
 * helpers have no hardware effects.
 */
void func_020324dc(void *self)
{
    u8 *actor = (u8 *)self;
    s32 target = *(s32 *)(actor + 0x84);
    s32 current = *(s32 *)(actor + 0x24);

    current = func_020adae4(current * 17 + target, 18);
    *(s32 *)(actor + 0x24) = current;
    if (func_020be334(current - target) < 0x4000)
        *(u32 *)(actor + 0xd0) |= 0x20;
    else
        *(u32 *)(actor + 0xd0) &= ~0x20;
}
