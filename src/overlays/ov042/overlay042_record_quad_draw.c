#include "tingle/types.h"

/*
 * Overlay 42 active-record quad drawing. This recovered renderer walks the
 * overlay's 64-record pool, chooses marker-specific dimensions and texture
 * coordinates, binds the corresponding texture, and emits a rotated quad.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void func_0209b494(void *resourceOwner, s32 resourceId, s32 unused);
extern "C" void func_ov042_02205b38(void *context, const s32 *translation,
                                      u16 angle, const s32 *vertices,
                                      const s32 *texcoords, u16 attributes);

/*
 * Given the overlay state, scan records 63 through zero. Records whose signed
 * marker byte at +0x44 is negative or equals 100 are inactive and produce no
 * hardware effects. For every other record, convert its +0x148/+0x14C fixed-
 * point position to integers, select a four-edge quad from the marker-indexed
 * table, negate its +0xC4 angle, bind resource 31..34 (or resource 46 for
 * marker 12), and submit the quad through func_ov042_02205b38. Ordinary
 * records use their +0x744 counter to choose one of six texture phases and a
 * triangular RGB555 fade; marker 12 instead uses white and a parity-dependent
 * texture column. The called routines change resource and geometry-engine
 * state. No value is returned.
 */
extern "C" void func_ov042_02205808(void *state)
{
    static const s32 texturePhase[6] = {0, 0, 0, 2, 2, 4};
    const s32 vertices[13][4] = {
        {-24, -32, 24, 32}, {-12, -12, 12, 12},
        {-32, -32, 32, 32}, {-32, -32, 32, 32},
        {-32, -32, 32, 32}, {-32, -32, 32, 32},
        {-32, -32, 32, 32}, {-32, -32, 32, 32},
        {-32, -32, 32, 32}, {-32, -32, 32, 32},
        {-36, -34, 36, 34}, {-12, -13, 12, 13},
        {-16, -16, 16, 16}
    };
    const s32 texcoords[8][2] = {
        {0, 0}, {0x20000, 0x20000}, {0x20000, 0},
        {0x40000, 0x20000}, {0x40000, 0}, {0x60000, 0x20000},
        {0x60000, 0}, {0x80000, 0x20000}
    };

    for (s32 index = 63; index >= 0; index--) {
        s8 marker = FIELD(s8, state, 0x44 + index);
        if (marker < 0 || marker == 100)
            continue;

        s32 translation[2];
        translation[0] = FIELD(s32, state, 0x148 + index * 12) >> 12;
        translation[1] = FIELD(s32, state, 0x14c + index * 12) >> 12;

        s32 textureIndex;
        u16 attributes;
        void *resourceOwner = FIELD(void *, FIELD(void *, state, 0), 0x20);
        if (marker != 12) {
            s16 counter = FIELD(s16, state, 0x744 + index * 2);
            s32 phase = counter % 6;
            if (phase >= 3)
                phase = 6 - phase;
            s32 component = 31 - phase;
            attributes = (u16)(component | (component << 5) |
                               (component << 10));
            textureIndex = texturePhase[(counter >> 1) % 6];
            func_0209b494(resourceOwner, (index % 4) + 31, 0);
        } else {
            textureIndex = (index % 4) * 2;
            attributes = 0x7fff;
            func_0209b494(resourceOwner, 46, 0);
        }

        u16 angle = (u16)-FIELD(u16, state, 0xc4 + index * 2);
        func_ov042_02205b38(state, translation, angle, vertices[marker],
                            texcoords[textureIndex], attributes);
    }
}
