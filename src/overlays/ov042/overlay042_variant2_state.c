#include "tingle/types.h"

/*
 * Overlay 42 second late-variant state setup. These recovered routines select
 * one of four fixed starting positions and prepare the subsequent three-way
 * motion state for the variant constructed by func_ov042_022087a0.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_02072b68(void *resource, u8 mode);
extern "C" void func_ov042_021ff2f8(void *destination, const void *source);

/*
 * Store selector's low byte at +0x8A, clear +0x88, and select an even resource
 * mode from selector modulo three. Clear resource flag bit 1, restore child
 * scales to 0x100, initialize +0x54/+0x58 from the confirmed four coordinate
 * pairs shifted to fx32, set +0x7C to ten, clear +0x74/+0x80, store context at
 * +0x84, and reveal the child. Object, child, and SDK resource state change;
 * no value is returned. Callers are inferred to constrain selector to 0..3.
 */
extern "C" void func_ov042_022088fc(void *object, u8 selector, void *context)
{
    static const s32 positions[4][2] = {
        {-60, -14}, {0, -14}, {60, -14}, {120, -14}
    };
    FIELD(u8, object, 0x8a) = selector;
    FIELD(u16, object, 0x88) = 0;
    void *child = FIELD(void *, object, 0x4c);
    func_02072b68(FIELD(void *, child, 0xc), (u8)((selector % 3) * 2));
    FIELD(u16, FIELD(void *, child, 0xc), 0x24) &= (u16)~2;
    FIELD(u16, child, 0x3c) = 0x100;
    FIELD(u16, child, 0x3e) = 0x100;
    FIELD(s32, object, 0x74) = 0;
    FIELD(void *, object, 0x84) = context;
    FIELD(s32, object, 0x54) = positions[selector][0] << 12;
    FIELD(s32, object, 0x58) = positions[selector][1] << 12;
    FIELD(s32, object, 0x7c) = 10;
    FIELD(s32, object, 0x80) = 0;
    FIELD(u16, child, 0x42) &= (u16)~4;
}

/*
 * If state +0x74 is zero, copy the owner-linked element at owner+0xC+0x160
 * into object+0x50, derive +0x64 from +0x58 plus 0x28000, select one of three
 * confirmed fx32 vector pairs using byte +0x8A, set state +0x74 to one, and
 * clear +0x80. Nonzero state is unchanged; no value is returned.
 */
extern "C" void func_ov042_022089e8(void *object)
{
    static const s32 vectors[3][2] = {{-1, -5}, {0, -6}, {1, -5}};
    if (FIELD(s32, object, 0x74) != 0)
        return;
    const void *source = (u8 *)FIELD(void *, FIELD(void *, object, 0x48), 0xc) + 0x160;
    func_ov042_021ff2f8((u8 *)object + 0x50, source);
    FIELD(s32, object, 0x64) = FIELD(s32, object, 0x58) + 0x28000;
    u8 selector = FIELD(u8, object, 0x8a);
    FIELD(s32, object, 0x6c) = vectors[selector][0] << 12;
    FIELD(s32, object, 0x70) = vectors[selector][1] << 12;
    FIELD(s32, object, 0x74) = 1;
    FIELD(s32, object, 0x80) = 0;
}
