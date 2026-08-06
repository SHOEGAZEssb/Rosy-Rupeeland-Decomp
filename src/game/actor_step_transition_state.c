#include "tingle/types.h"

/* Select step-transition animation state and provide its default query. */

/*
 * Set timer halfword 0xae to 24. Select state 2/0 at 0xac when actor flag
 * 0x400 is set and input equals/does not equal 0x20; otherwise select 3/1.
 * Returns no value and calls no hardware or SDK services.
 */
void func_020320fc(void *self, s32 input)
{
    u8 *actor = (u8 *)self;
    *(s16 *)(actor + 0xae) = 24;
    if (*(u32 *)(actor + 0x14) & 0x400)
        *(s16 *)(actor + 0xac) = input == 0x20 ? 2 : 0;
    else
        *(s16 *)(actor + 0xac) = input == 0x20 ? 3 : 1;
}

/* Ignore the implied actor input and return zero without changing state. */
s32 func_0203213c(void)
{
    return 0;
}
