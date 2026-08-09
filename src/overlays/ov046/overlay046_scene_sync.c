#include "tingle/types.h"

/*
 * Overlay 46 scene-to-panel synchronization. The matching assembly retains
 * compiler-sensitive flag-test and pointer-reload forms; this file is the
 * documented portable equivalent.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov046_0220c1d8(void *panel);
extern "C" void func_ov046_0220c1a4(void *panel);
extern "C" void func_020740a4(void *fontState);

/*
 * If bit 10 of scene flags +0x20 is set, update panel OAM hardware through
 * func_ov046_0220c1d8. Always return zero; no state changes otherwise.
 */
extern "C" s32 func_ov046_0220cb28(void *scene)
{
    if ((FIELD(u32, scene, 0x20) & 0x400) != 0) {
        func_ov046_0220c1d8(FIELD(void *, scene, 0x70));
    }
    return 0;
}

/*
 * Refresh panel +0x70, mirror its screen-relative origin into font state
 * +0x60, and submit that state. Panel, renderer, and OAM-visible state change;
 * the function has no return value.
 */
extern "C" void func_ov046_0220cb4c(void *scene)
{
    func_ov046_0220c1a4(FIELD(void *, scene, 0x70));
    void *panel = FIELD(void *, scene, 0x70);
    void *fontState = FIELD(void *, scene, 0x60);
    FIELD(s32, fontState, 0x18) = 0x80 - FIELD(s32, panel, 0x10c);
    FIELD(s32, fontState, 0x1c) = 0x60 - FIELD(s32, panel, 0x110);
    func_020740a4(fontState);
}
