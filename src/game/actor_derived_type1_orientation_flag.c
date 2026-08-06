#include "tingle/types.h"

/* Maintain a type-1 actor flag derived from its half-turn orientation range. */

/*
 * Set actor +0x230 bit 31 when signed orientation +0xc8 lies in
 * [0, 0x8000); clear it otherwise. Returns no value and calls no helpers.
 */
void func_02038c1c(void *self)
{
    u8 *actor = (u8 *)self;
    s32 orientation = *(s32 *)(actor + 0xc8);
    if (orientation >= 0 && orientation < 0x8000)
        *(u32 *)(actor + 0x230) |= 0x80000000;
    else
        *(u32 *)(actor + 0x230) &= ~0x80000000;
}
