#include "tingle/types.h"

/*
 * Overlay 42 base-field rendering. This recovered renderer draws either the
 * object's 32 falling records or its scrolling 18-by-18 height field and
 * writes the Nintendo DS geometry engine directly in both modes.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 numerator, s32 denominator);
extern "C" void VecFx32Object_InitComponents(void *matrix, s32 x, s32 y, s32 z);
extern "C" void VecFx32Object_Destroy(void *matrix);
extern "C" void func_0209d640(void *resourceOwner, s32 zero, s32 selector,
                                const void *matrix);
extern "C" void func_020b0880(s16 x, s16 y);
extern "C" void func_020b0808(s16 sine, s16 cosine);
extern "C" void func_ov042_021fd578(void *context, const s32 *vertices,
                                      const s32 *texcoords, s32 count);
extern "C" s16 data_020cd470[];
extern "C" s16 gFx32CosSinTable[];

static s32 signed_mod4(s32 value)
{
    return value % 4;
}

/*
 * Given the base object and a resource selector, increment frame +4 and bind
 * the selected resource through object[0]+0x20. When control +0x538 is -1,
 * advance 32 fixed-point records at +0x540 by their +0x6BC velocities, recycle
 * records crossing Y=0x172000 to randomized X and negative Y, and submit each
 * as one point with its +0x73C attribute and a velocity-derived texture S.
 *
 * Otherwise translate by +0x534-0x2000, rotate by +0x528, and build 17 triangle
 * strips from the signed 18-by-18 grid at +8. Phase +0x520 supplies the two
 * sampled rows, +0x524 selects wrapping texture columns, and the strip width
 * expands over the first seven rows. Matrix, texture, polygon, primitive, and
 * vertex registers are changed; PRNG state changes only when a falling record
 * is recycled. No value is returned.
 */
extern "C" void func_ov042_021fd158(void *object, s32 selector)
{
    FIELD(s32, object, 4)++;
    if (FIELD(s32, object, 0x538) == -1) {
        s32 matrix[4];
        VecFx32Object_InitComponents(matrix, 0, 0, 0);
        func_0209d640(FIELD(void *, FIELD(void *, object, 0), 0x20),
                      0, selector, matrix);
        func_020b0880(data_020cd470[0x38], data_020cd470[0x39]);

        volatile u32 *const begin = (volatile u32 *)0x04000500;
        volatile u32 *const vertex = (volatile u32 *)0x0400048c;
        volatile u32 *const texcoord = (volatile u32 *)0x04000488;
        volatile u32 *const polygon = (volatile u32 *)0x040004a4;
        volatile u32 *const end = (volatile u32 *)0x04000504;
        *begin = 0;
        for (s32 i = 31; i >= 0; --i) {
            s32 y = FIELD(s32, object, 0x544 + i * 12) +
                    FIELD(s32, object, 0x6bc + i * 4);
            FIELD(s32, object, 0x544 + i * 12) = y;
            if (y > 0x172000) {
                FIELD(s32, object, 0x540 + i * 12) =
                    ((s32)(genrand_int32() % 500) - 250) << 12;
                FIELD(s32, object, 0x544 + i * 12) =
                    (-400 - (s32)(genrand_int32() % 100)) << 12;
            }
            *vertex = (u32)(FIELD(s32, object, 0x540 + i * 12) >> 12);
            *vertex = (u32)(FIELD(s32, object, 0x544 + i * 12) >> 12);
            *vertex = 0xed;
            *(volatile u32 *)0x04000500 = 2;
            *polygon = FIELD(u16, object, 0x73c + i * 2);
            *texcoord = 0;
            *texcoord = 0;
            s32 s = -(FIELD(s32, object, 0x6bc + i * 4) >> 12) * 4;
            *texcoord = (u32)((u16)s << 16);
            *texcoord = 1;
            *end = 0;
            *(volatile u32 *)0x04000448 = 1;
        }
        VecFx32Object_Destroy(matrix);
        return;
    }

    s32 matrix[4];
    VecFx32Object_InitComponents(matrix, 0, 0, FIELD(s32, object, 0x534) - 0x2000);
    func_0209d640(FIELD(void *, FIELD(void *, object, 0), 0x20),
                  0, selector, matrix);

    s32 angleIndex = ((u16)FIELD(s32, object, 0x528) >> 4) * 2;
    s32 baseX = (-FIELD(s32, object, 0x520) * 300) / 64;
    func_020b0808(gFx32CosSinTable[angleIndex],
                  gFx32CosSinTable[angleIndex + 1]);
    *(volatile u32 *)0x04000444 = 0;
    *(volatile u32 *)0x04000480 = 0x7fff;

    s32 widthStart = 7;
    s32 rowPhase = baseX;
    for (s32 row = 0; row < 17; ++row, rowPhase += 300) {
        if (widthStart > 0)
            widthStart--;
        s32 endColumn = 18 - widthStart;
        s32 vertices[38 * 3];
        s32 texcoords[38 * 2];
        s32 emitted = 0;
        s32 phase0 = (u16)rowPhase;
        s32 phase1 = (u16)(rowPhase + 300);
        s32 offset0 = (gFx32CosSinTable[(phase0 >> 4) * 2] * -2200) >> 12;
        s32 offset1 = (gFx32CosSinTable[(phase1 >> 4) * 2] * -2200) >> 12;
        for (s32 column = widthStart; column < endColumn; ++column) {
            s32 x = (column - 8) * 160;
            vertices[emitted * 3] = x;
            vertices[emitted * 3 + 1] =
                FIELD(s32, object, 8 + row * 72 + column * 4) + offset0;
            vertices[emitted * 3 + 2] = baseX + row * 300 + 0xc0;
            texcoords[emitted * 2] = (u16)(column << 16);
            texcoords[emitted * 2 + 1] =
                (u16)(signed_mod4(FIELD(s32, object, 0x524) + row) << 16);
            emitted++;

            vertices[emitted * 3] = x;
            vertices[emitted * 3 + 1] =
                FIELD(s32, object, 0x50 + row * 72 + column * 4) + offset1;
            vertices[emitted * 3 + 2] = baseX + (row + 1) * 300 + 0xc0;
            texcoords[emitted * 2] = (u16)(column << 16);
            texcoords[emitted * 2 + 1] =
                (u16)((signed_mod4(FIELD(s32, object, 0x524) + row) + 1) << 16);
            emitted++;
        }
        func_ov042_021fd578(object, vertices, texcoords, emitted - 2);
    }
    *(volatile u32 *)0x04000448 = 1;
    VecFx32Object_Destroy(matrix);
}
