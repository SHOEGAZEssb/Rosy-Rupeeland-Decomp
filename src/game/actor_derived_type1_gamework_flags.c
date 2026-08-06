#include "tingle/types.h"

/* Apply a GameWork-dependent pair of high actor runtime flags. */
extern u8 *gGameWork;

/*
 * With enable zero, clear actor +0x230 bit 30. Otherwise set bit 30, then read
 * signed GameWork halfwords +0x248 (mode) and +0x246 (submode). Set actor bit
 * 31 for mode/submode pairs 2/3 or 3/4; mode four and all other pairs leave
 * bit 31 unchanged. Returns no value and calls no helpers.
 */
void func_02038e50(void *self, s32 enable)
{
    u8 *actor = (u8 *)self;
    if (enable == 0) {
        *(u32 *)(actor + 0x230) &= ~0x40000000;
        return;
    }

    *(u32 *)(actor + 0x230) |= 0x40000000;
    if ((*(s16 *)(gGameWork + 0x248) == 2 &&
         *(s16 *)(gGameWork + 0x246) == 3) ||
        (*(s16 *)(gGameWork + 0x248) == 3 &&
         *(s16 *)(gGameWork + 0x246) == 4))
        *(u32 *)(actor + 0x230) |= 0x80000000;
}
