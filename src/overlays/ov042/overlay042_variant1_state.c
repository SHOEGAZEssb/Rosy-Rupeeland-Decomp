#include "tingle/types.h"

/*
 * Overlay 42 first late-variant state setup. This recovered initializer selects
 * one of six confirmed coordinate pairs, resets motion counters, and reveals
 * the variant's child resource for its opening movement state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *resource, u8 mode);

/*
 * Given a variant object and selector, store the selector byte at +0x8A. For
 * selectors four or above, alternate adjacent entries using +0x8C and flip
 * that toggle. Initialize +0x54/+0x58 and +0x6C from the selected confirmed
 * coordinate table, initialize +0x60/+0x64 from its paired starting table,
 * select child resource mode 24, clear state/counters, set +0x7C to ten, and
 * clear child visibility bit 2. Object and SDK resource state change; no return.
 */
extern "C" void func_ov042_02207f58(void *object, u8 selector)
{
    static const s32 starts[6][2] = {
        {-120, 224}, {120, 224}, {-120, 130},
        {120, 130}, {-120, -90}, {120, -90},
    };
    static const s32 positions[6][2] = {
        {-130, -170}, {130, -170}, {-70, -170},
        {70, -170}, {-130, -170}, {130, -170},
    };

    FIELD(u8, object, 0x8a) = selector;
    if (selector >= 4) {
        FIELD(u8, object, 0x8a) =
            (u8)(selector + FIELD(s32, object, 0x8c));
        FIELD(s32, object, 0x8c) ^= 1;
    }
    u8 index = FIELD(u8, object, 0x8a);
    FIELD(s32, object, 0x6c) = positions[index][0] << 12;
    FIELD(s32, object, 0x70) = 0;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0xc), 24);
    FIELD(s32, object, 0x74) = 0;
    FIELD(s32, object, 0x54) = positions[index][0] << 12;
    FIELD(s32, object, 0x58) = positions[index][1] << 12;
    FIELD(s32, object, 0x60) = starts[index][0] << 12;
    FIELD(s32, object, 0x64) = starts[index][1] << 12;
    FIELD(s32, object, 0x7c) = 10;
    FIELD(s32, object, 0x84) = 0;
    FIELD(s32, object, 0x80) = 0;
    void *child = FIELD(void *, object, 0x4c);
    FIELD(u16, child, 0x42) &= (u16)~4;
}
