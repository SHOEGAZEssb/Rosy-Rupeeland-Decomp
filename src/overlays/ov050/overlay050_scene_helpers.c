#include "tingle/types.h"

/*
 * Overlay 50 scene helper methods. These recovered routines broadcast values
 * to four child effects, query their readiness, reset a shared counter, and
 * enable or release two font/sprite states.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_02074110(void *state);

/*
 * Write `value` to +0x30 of each of four child pointers at scene +0x1C..+0x28.
 * Child state changes; nothing is returned and no SDK/hardware effect occurs.
 */
extern "C" void func_ov050_0220e204(void *scene, s32 value)
{
    for (s32 i = 0; i < 4; ++i) {
        FIELD(s32, FIELD(void *, scene, 0x1c + i * 4), 0x30) = value;
    }
}

/*
 * Return true only when field +0xC is zero in all four children at scene
 * +0x1C..+0x28. No state, SDK, or hardware state changes.
 */
extern "C" bool func_ov050_0220e224(void *scene)
{
    for (s32 i = 0; i < 4; ++i) {
        if (FIELD(s32, FIELD(void *, scene, 0x1c + i * 4), 0x0c) != 0) {
            return false;
        }
    }
    return true;
}

/*
 * Write `value` to +0x34 of all four children and clear scene field +0x40.
 * Scene/child state changes; nothing is returned and no SDK/MMIO is used.
 */
extern "C" void func_ov050_0220e26c(void *scene, s32 value)
{
    for (s32 i = 0; i < 4; ++i) {
        FIELD(s32, FIELD(void *, scene, 0x1c + i * 4), 0x34) = value;
    }
    FIELD(s32, scene, 0x40) = 0;
}

/*
 * If `enabled` is nonzero, write one to +0x20 of states +0x14/+0x18;
 * otherwise release both through func_02074110. SDK sprite/font state changes,
 * nothing is returned, and no direct MMIO occurs.
 */
extern "C" void func_ov050_0220e294(void *scene, s32 enabled)
{
    if (enabled != 0) {
        FIELD(s32, FIELD(void *, scene, 0x14), 0x20) = 1;
        FIELD(s32, FIELD(void *, scene, 0x18), 0x20) = 1;
        return;
    }
    func_02074110(FIELD(void *, scene, 0x14));
    func_02074110(FIELD(void *, scene, 0x18));
}
