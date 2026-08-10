#include "tingle/types.h"

/* Recovered subtype-aware reset for the second tracked-resource actor variant. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef s32 (*VirtualFunction)(void *, ...);

static VirtualFunction virtual_function(void *actor, u32 offset)
{
    return *(VirtualFunction *)((u8 *)FIELD(void *, actor, 0) + offset);
}

/*
 * Input is a variant actor. Subtype 0x19 is reset through virtual slot 0xC4
 * with zero; other subtypes zero fields 0x3C/0x40, set 0x44 to 0x1000, and
 * clear flag bits 0x00800040. All variants add flags 0x1F0000 and set bit 0 at
 * 0x1F4 while preserving other bits. Returns nothing; virtual dispatch may
 * mutate engine state, and hardware is not accessed directly.
 */
void TrackedResourceActorType22And25_ResetMotionState(void *actor)
{
    if (FIELD(s16, actor, 0x4e) == 0x19) {
        virtual_function(actor, 0xc4)(actor, 0);
    } else {
        FIELD(s32, actor, 0x40) = 0;
        FIELD(s32, actor, 0x3c) = 0;
        FIELD(s32, actor, 0x44) = 0x1000;
        FIELD(u32, actor, 0x14) &= 0xff7fffbf;
    }
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u32, actor, 0x1f4) = (FIELD(u32, actor, 0x1f4) & ~1) | 1;
}
