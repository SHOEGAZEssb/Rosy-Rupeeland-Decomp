#include "tingle/types.h"

/*
 * Overlay 44 panel transition state. This recovered handler starts a child
 * transition, keeps the panel synchronized while it runs, and then routes
 * touch completion or the non-touch fallback into the next scene callback.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 data_ov044_0220d2b0[2];
extern "C" void InventoryScroll_BeginMarkerDrag(void *child, s32 mode);
extern "C" s32 InventoryScroll_UpdateInterpolation(void *child);
extern "C" void func_02092288(void *object, s32 state);
extern "C" s32 func_ov044_0220bdac(void *panel);
extern "C" void func_ov044_0220c700(void *object);
extern "C" void InventoryScroll_SaveOrigins(void *child);
extern "C" s32 InventoryScroll_UpdateMarkerDrag(void *child, void *touch);
extern "C" void func_02092260(void *object, s32 state);
extern "C" void InventoryScroll_EndMarkerDrag(void *child, s32 mode);
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second);
extern "C" void func_ov044_0220c880(void *object);

static void advance_transition(void *object)
{
    ++FIELD(s32, object, 4);
    FIELD(s32, object, 8) = 0;
}

/*
 * Process one transition frame and return zero. State 0 starts child mode 4
 * and falls into state 1. State 1 waits for completion; if child top +0x0C
 * differs from target +0x10, request base state 8 before advancing to state 2.
 * While pending, midpoint synchronization may redraw the presentation. State 2
 * updates the child. With object input flag bit four set, a successful touch
 * completion requests base state 8, decrements the substate, and resets +0x08.
 * Without that flag it applies child mode 6 and installs callback pair
 * data_ov044_0220d2b0. Display resources are flushed on every path.
 */
extern "C" s32 func_ov044_0220ce28(void *object)
{
    void *panel = FIELD(void *, object, 0x228);
    void *child = FIELD(void *, panel, 0x44);
    s32 state = FIELD(s32, object, 4);
    if (state == 0) {
        InventoryScroll_BeginMarkerDrag(child, 4);
        advance_transition(object);
        state = 1;
    }
    if (state == 1) {
        if (InventoryScroll_UpdateInterpolation(child)) {
            if (FIELD(s32, child, 0xc) != FIELD(s32, child, 0x10))
                func_02092288(object, 8);
            advance_transition(object);
            state = 2;
        } else {
            if (func_ov044_0220bdac(panel))
                func_ov044_0220c700(object);
            func_ov044_0220c880(object);
            return 0;
        }
    }
    if (state == 2) {
        InventoryScroll_SaveOrigins(child);
        if (FIELD(u32, object, 0x20) & 0x10) {
            if (InventoryScroll_UpdateMarkerDrag(child, (u8 *)object + 0x30)) {
                func_02092260(object, 8);
                --FIELD(s32, object, 4);
                FIELD(s32, object, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(child, 6);
            func_ov044_0220be38(object, data_ov044_0220d2b0[0],
                                data_ov044_0220d2b0[1]);
        }
    }
    func_ov044_0220c880(object);
    return 0;
}
