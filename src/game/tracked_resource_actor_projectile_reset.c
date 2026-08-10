#include "tingle/types.h"

/* Recovered motion and participation reset for a projectile-like tracked-resource actor. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a projectile-like actor. Sets field 0x44 to 0x2000, adds actor flags
 * 0x1F0000 at 0x10, and sets bit 0 of field 0x1F4 while preserving all other
 * bits. Returns nothing and has no direct SDK or hardware effects. Field 0x44
 * is likely a motion component, but that interpretation is not confirmed.
 */
void TrackedResourceActorType24_ResetMotionState(void *actor)
{
    FIELD(s32, actor, 0x44) = 0x2000;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u32, actor, 0x1f4) = (FIELD(u32, actor, 0x1f4) & ~1) | 1;
}
