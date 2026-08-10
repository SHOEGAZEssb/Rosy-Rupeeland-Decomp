#include "tingle/types.h"

/* Recovered three-state update loop for the second tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0202d494(void *handle, void *actor);
extern void Actor_UpdateAnimationState(void *actor);
extern void *Actor_GetCollection(void *actor);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 func_020adae4(s32 value, s32 shift);
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
 * Input is a variant actor. Calls virtual pre-update slot 0x18 and advances the
 * low 15-bit state at 0x1F0 while preserving its high bit. In state 0 it clears
 * presentation bit 4, tests the actor against field 0x1DC and Actor_GetCachedTerrainHeight,
 * controls flag 0x800000, and either invokes subtype-specific slot 0xC4 or
 * enters state 1 after shifting fields 0x3C/0x40 through func_020adae4. State 1
 * zeroes those fields after reaching 0x1DC, flashes presentation bit 4 for 30
 * ticks, notifies func_0202d494, and enters state 2. State 2 calls slot 0x54
 * with zero. Finally runs slots 0xD4/0xA4, Actor_UpdateAnimationState, and slot 0x20. Returns
 * nothing; engine callbacks may have SDK effects, with no direct hardware use.
 */
void func_02050fa0(void *actor)
{
    u16 state;
    s16 timer;
    s16 subtype;
    void *presentation;
    s32 reference;

    virtual_function(actor, 0x18)(actor);
    subtype = FIELD(s16, actor, 0x4e);
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
            } else if (subtype == 0x19) {
                virtual_function(actor, 0xc4)(actor, 0);
            } else {
                FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
                FIELD(u16, actor, 0x1f0) =
                    (FIELD(u16, actor, 0x1f0) & 0x8000) | 1;
                FIELD(s16, actor, 0x1f8) = 0;
                FIELD(s32, actor, 0x3c) =
                    func_020adae4(FIELD(s32, actor, 0x3c), 4);
                FIELD(s32, actor, 0x40) =
                    func_020adae4(FIELD(s32, actor, 0x40), 4);
            }
        } else {
            virtual_function(actor, 0xc8)(actor);
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
            func_0202d494(Actor_GetCollection(actor), actor);
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
