#include "tingle/types.h"

/* Recovered motion and participation reset for a tracked-resource actor subclass. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a subclass actor. Zeros fields 0x3C and 0x40, sets field 0x44 to
 * 0x1000, clears actor flag bits 0x00800040, adds flags 0x1F0000 at 0x10, and
 * sets bit 0 at 0x1F4 while preserving other bits. Returns nothing and has no
 * direct SDK or hardware effects; the vector-field semantics remain inferred.
 */
void TrackedResourceActorType21_ResetMotionState(void *actor)
{
    FIELD(s32, actor, 0x40) = 0;
    FIELD(s32, actor, 0x3c) = 0;
    FIELD(s32, actor, 0x44) = 0x1000;
    FIELD(u32, actor, 0x14) &= 0xff7fffbf;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u32, actor, 0x1f4) = (FIELD(u32, actor, 0x1f4) & ~1) | 1;
}
