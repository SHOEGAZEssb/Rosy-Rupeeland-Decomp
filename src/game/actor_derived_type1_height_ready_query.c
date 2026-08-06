#include "tingle/types.h"

/* Query whether a type-1 actor is enabled and aligned to cached terrain height. */

/*
 * Return one only when actor flag 0x10 at +0xd0 is clear and actor height +0x24
 * exactly equals cached terrain height +0x1dc. Return zero otherwise; no state,
 * hardware, or SDK object is modified.
 */
s32 func_02035bc8(void *self)
{
    u8 *actor = (u8 *)self;

    return (*(u32 *)(actor + 0xd0) & 0x10) == 0 &&
           *(s32 *)(actor + 0x24) == *(s32 *)(actor + 0x1dc);
}
