#include "tingle/types.h"

/* Recovered three-state motion update for a projectile-like tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_QueueActorForRemoval(void *handle, void *actor);
extern void Actor_UpdateAnimationState(void *actor);
extern void *Actor_GetCollection(void *actor);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
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
 * Input is a projectile-like actor. Calls virtual pre-update slot 0x18 and
 * advances the low 15-bit state at 0x1F0. State 0 increments timer 0x1F8,
 * clears presentation bit 4, bounds field 0x44 using signed record halfword
 * 0x0A, and compares field 0x24 against Actor_GetCachedTerrainHeight to control actor flag
 * 0x800000 or enter state 1 at field 0x1DC. State 1 zeroes fields 0x3C/0x40
 * after reaching 0x1DC, flashes presentation bit 4 for 30 ticks, notifies
 * ActorCollection_QueueActorForRemoval, and enters state 2. State 2 calls virtual slot 0x54 with zero.
 * The high state bit is preserved. Finally runs slots 0xD4 and 0xA4,
 * Actor_UpdateAnimationState, and slot 0x20. Returns nothing; engine callbacks may cross SDK
 * boundaries, while this routine has no direct hardware access.
 */
void func_02051440(void *actor)
{
    u16 state;
    s16 timer;
    s32 record_step;
    s32 reference;
    void *presentation;

    virtual_function(actor, 0x18)(actor);
    state = FIELD(u16, actor, 0x1f0) & 0x7fff;
    if (state == 0) {
        ++FIELD(s16, actor, 0x1f8);
        presentation = FIELD(void *, actor, 0x54);
        FIELD(u16, presentation, 0x24) &= (u16)~4;
        record_step = (s32)FIELD(s16, FIELD(void *, actor, 0x1fc), 0x0a) * 0x10;
        if (FIELD(s32, actor, 0x44) + record_step < 0)
            FIELD(s32, actor, 0x44) = -record_step;

        reference = Actor_GetCachedTerrainHeight(actor);
        if (reference < FIELD(s32, actor, 0x24)) {
            if (FIELD(s32, actor, 0x24) - Actor_GetCachedTerrainHeight(actor) < 0x20001)
                FIELD(u32, actor, 0x14) |= 0x800000;
            else
                FIELD(u32, actor, 0x14) &= 0xff7fffff;
        } else {
            FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
            FIELD(u16, actor, 0x1f0) =
                (FIELD(u16, actor, 0x1f0) & 0x8000) | 1;
            FIELD(s16, actor, 0x1f8) = 0;
        }
    } else if (state == 1) {
        if (FIELD(s32, actor, 0x24) <= FIELD(s32, actor, 0x1dc)) {
            FIELD(s32, actor, 0x40) = 0;
            FIELD(s32, actor, 0x3c) = 0;
        }
        timer = ++FIELD(s16, actor, 0x1f8);
        if (timer < 0x1e) {
            presentation = FIELD(void *, actor, 0x54);
            if ((timer & 4) != 0)
                FIELD(u16, presentation, 0x24) |= 4;
            else
                FIELD(u16, presentation, 0x24) &= (u16)~4;
        } else {
            ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
            FIELD(u16, actor, 0x1f0) =
                (FIELD(u16, actor, 0x1f0) & 0x8000) | 2;
        }
    } else if (state == 2) {
        virtual_function(actor, 0x54)(actor, 0);
    }
    virtual_function(actor, 0xd4)(actor);
    virtual_function(actor, 0xa4)(actor);
    Actor_UpdateAnimationState(actor);
    virtual_function(actor, 0x20)(actor);
}
