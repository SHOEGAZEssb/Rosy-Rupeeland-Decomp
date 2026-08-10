#include "tingle/types.h"

/* Recovered subtype-aware motion reset for a timed tracked-resource actor variant. */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef void (*ResetFunction)(void *, s32);

/*
 * Input is a timed actor. Subtype 0x19 delegates to virtual slot 0xC4 with zero.
 * Other subtypes zero fields 0x3C and 0x40, set field 0x44 to 0x1000, and clear
 * actor flag bits 0x00800040. Returns nothing. Virtual dispatch may mutate
 * engine state; this function has no direct SDK or hardware effects.
 */
void TrackedResourceActorType26_ResetMotionState(void *actor)
{
    if (FIELD(s16, actor, 0x4e) == 0x19) {
        (*(ResetFunction *)((u8 *)FIELD(void *, actor, 0) + 0xc4))(actor, 0);
        return;
    }
    FIELD(s32, actor, 0x40) = 0;
    FIELD(s32, actor, 0x3c) = 0;
    FIELD(s32, actor, 0x44) = 0x1000;
    FIELD(u32, actor, 0x14) &= 0xff7fffbf;
}
