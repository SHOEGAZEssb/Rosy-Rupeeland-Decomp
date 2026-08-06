#include "tingle/types.h"

/* Recovered three-state update loop for a tracked-resource actor subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0202d494(void *handle, void *actor);
extern void func_0203292c(void *actor);
extern void *func_020337d4(void *actor);
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
 * Input is a subclass actor. Calls virtual pre-update slot 0x18, then advances
 * the low 15-bit state at 0x1F0. State 0 clears presentation bit 4 and either
 * settles the actor at field 0x1DC or invokes slot 0xC8. State 1 flashes that
 * presentation bit for 30 ticks, notifies func_0202d494, then enters state 2.
 * State 2 invokes slot 0x54 with zero. The high state bit is preserved across
 * transitions. Finally calls virtual slots 0xD4 and 0xA4, func_0203292c, and
 * slot 0x20. Returns nothing; actor/presentation state changes and downstream
 * engine callbacks may have SDK effects, but hardware is not accessed here.
 */
void func_02050b70(void *actor)
{
    u16 state;
    s16 timer;
    void *presentation;

    virtual_function(actor, 0x18)(actor);
    state = FIELD(u16, actor, 0x1f0) & 0x7fff;
    if (state == 0) {
        presentation = FIELD(void *, actor, 0x54);
        FIELD(u16, presentation, 0x24) &= (u16)~4;
        ++FIELD(s16, actor, 0x1f8);
        if ((FIELD(u32, actor, 0x14) & 0x40) != 0) {
            if ((FIELD(u8, actor, 0x4b) & 0x0f) != 0)
                virtual_function(actor, 0xc8)(actor);
        } else if (FIELD(s32, actor, 0x24) <= FIELD(s32, actor, 0x1dc) ||
                   (((FIELD(u32, actor, 0x14) & 1) == 0) &&
                    ((FIELD(u32, actor, 0x10) & 4) == 0))) {
            FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
            FIELD(u16, actor, 0x1f0) =
                (FIELD(u16, actor, 0x1f0) & 0x8000) | 1;
            FIELD(s16, actor, 0x1f8) = 0;
            FIELD(s32, actor, 0x44) = 0;
            FIELD(s32, actor, 0x40) = 0;
            FIELD(s32, actor, 0x3c) = 0;
        }
    } else if (state == 1) {
        timer = ++FIELD(s16, actor, 0x1f8);
        if (timer < 0x1e) {
            presentation = FIELD(void *, actor, 0x54);
            if ((timer & 4) != 0)
                FIELD(u16, presentation, 0x24) |= 4;
            else
                FIELD(u16, presentation, 0x24) &= (u16)~4;
        } else {
            func_0202d494(func_020337d4(actor), actor);
            FIELD(u16, actor, 0x1f0) =
                (FIELD(u16, actor, 0x1f0) & 0x8000) | 2;
        }
    } else if (state == 2) {
        virtual_function(actor, 0x54)(actor, 0);
    }

    virtual_function(actor, 0xd4)(actor);
    virtual_function(actor, 0xa4)(actor);
    func_0203292c(actor);
    virtual_function(actor, 0x20)(actor);
}
