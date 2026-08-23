#include "tingle/types.h"

/* Recovered per-frame update for an orientation-driven tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SynchronizeStatePresentation(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef s32 (*VirtualFunction)(void *, ...);

static VirtualFunction virtual_function(void *actor, u32 offset)
{
    return *(VirtualFunction *)((u8 *)FIELD(void *, actor, 0) + offset);
}

/*
 * Input is an oriented actor. Calls virtual pre-update slot 0x18, clears bit 4
 * in its presentation flags at offset 0x24, and, when the low nibble at actor
 * offset 0x4B is nonzero, invokes virtual slot 0xC4 with zero. It sets actor
 * flag 0x2000 at 0xD0, increments signed timer 0x1F8, then runs virtual slots
 * 0xD4 and 0xA4, Actor_SynchronizeStatePresentation, and virtual slot 0x20. Returns nothing; engine
 * callbacks mutate actor/presentation state, with no direct hardware access.
 */
void TrackedResourceActorType28_Update(void *actor)
{
    void *presentation;
    virtual_function(actor, 0x18)(actor);
    presentation = FIELD(void *, actor, 0x54);
    FIELD(u16, presentation, 0x24) &= (u16)~4;
    if ((FIELD(u8, actor, 0x4b) & 0x0f) != 0)
        virtual_function(actor, 0xc4)(actor, 0);
    FIELD(u32, actor, 0xd0) |= 0x2000;
    ++FIELD(s16, actor, 0x1f8);
    virtual_function(actor, 0xd4)(actor);
    virtual_function(actor, 0xa4)(actor);
    Actor_SynchronizeStatePresentation(actor);
    virtual_function(actor, 0x20)(actor);
}
