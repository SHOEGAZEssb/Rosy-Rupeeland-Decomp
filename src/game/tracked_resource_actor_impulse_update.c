#include "tingle/types.h"

/* Recovered state and record-duration update for an impulse-oriented tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_UpdateAnimationState(void *actor);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 func_020adae4(s32 value, s32 divisor);
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
 * Input is an impulse actor. Calls virtual pre-update slot 0x18 and advances
 * the low 15-bit state at 0x1F0. State 0 increments timer 0x1F8, clears
 * presentation bit 4, and either controls actor flag 0x800000 from the distance
 * between field 0x24 and Actor_GetCachedTerrainHeight, invokes slot 0xC8, or settles field
 * 0x24 at 0x1DC, enters state 1, and divides fields 0x3C/0x40 by 4. State 1
 * invokes slot 0xE0; state 2 invokes slot 0x54 with zero. Independently, while
 * timer 0x1F8 is less than signed record halfword 0x28, increments it and runs
 * slots 0xD8/0xD4/0xA4, Actor_UpdateAnimationState, and slot 0x20. Once the limit is reached,
 * it calls slot 0xDC instead. Returns nothing; virtual callbacks mutate engine
 * state and may cross SDK boundaries, with no direct hardware access here.
 */
void TrackedResourceActorImpulse_Update(void *actor)
{
    u16 state;
    s32 reference;
    void *presentation;
    void *record;

    virtual_function(actor, 0x18)(actor);
    state = FIELD(u16, actor, 0x1f0) & 0x7fff;
    if (state == 0) {
        ++FIELD(s16, actor, 0x1f8);
        presentation = FIELD(void *, actor, 0x54);
        FIELD(u16, presentation, 0x24) &= (u16)~4;
        if ((FIELD(u8, actor, 0x4b) & 0x0f) == 0) {
            if (FIELD(s32, actor, 0x1dc) < FIELD(s32, actor, 0x24)) {
                reference = Actor_GetCachedTerrainHeight(actor);
                if (FIELD(s32, actor, 0x24) - reference < 0x20001)
                    FIELD(u32, actor, 0x14) |= 0x800000;
                else
                    FIELD(u32, actor, 0x14) &= 0xff7fffff;
            } else {
                FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
                FIELD(u16, actor, 0x1f0) =
                    (FIELD(u16, actor, 0x1f0) & 0x8000) | 1;
                FIELD(s32, actor, 0x3c) =
                    func_020adae4(FIELD(s32, actor, 0x3c), 4);
                FIELD(s32, actor, 0x40) =
                    func_020adae4(FIELD(s32, actor, 0x40), 4);
            }
        } else {
            virtual_function(actor, 0xc8)(actor);
        }
    } else if (state == 1) {
        virtual_function(actor, 0xe0)(actor);
    } else if (state == 2) {
        virtual_function(actor, 0x54)(actor, 0);
    }

    record = FIELD(void *, actor, 0x1fc);
    if (FIELD(s16, actor, 0x1f8) < FIELD(s16, record, 0x28)) {
        ++FIELD(s16, actor, 0x1f8);
        virtual_function(actor, 0xd8)(actor);
        virtual_function(actor, 0xd4)(actor);
        virtual_function(actor, 0xa4)(actor);
        Actor_UpdateAnimationState(actor);
        virtual_function(actor, 0x20)(actor);
    } else {
        virtual_function(actor, 0xdc)(actor);
    }
}
