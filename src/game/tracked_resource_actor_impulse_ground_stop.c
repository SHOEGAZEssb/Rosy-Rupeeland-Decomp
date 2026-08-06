#include "tingle/types.h"

/* Recovered ground-threshold motion stop for an impulse-oriented tracked-resource actor. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an impulse actor. When field 0x24 is less than or equal to field
 * 0x1DC, zero fields 0x3C and 0x40; otherwise leave the actor unchanged.
 * Returns nothing and has no direct SDK or hardware effects. The fields are
 * treated as motion/height values based on surrounding behavior, not symbols.
 */
void func_02051fa4(void *actor)
{
    if (FIELD(s32, actor, 0x24) <= FIELD(s32, actor, 0x1dc)) {
        FIELD(s32, actor, 0x40) = 0;
        FIELD(s32, actor, 0x3c) = 0;
    }
}
