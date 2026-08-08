#include "tingle/types.h"

/* Overlay 27 Nintendo DS geometry-engine command packing helpers. */

/*
 * Packs eight polygon/texture parameters into one word and writes geometry
 * register 0x040004A8. Fields are masked only by their destination widths in
 * hardware; the function returns void.
 */
extern "C" void func_ov027_021fd0b0(u32 a0, u32 a1, u32 a2, u32 a3,
                                      u32 a4, u32 a5, u32 a6, u32 a7)
{
    *(volatile u32 *)0x040004a8 =
        (a0 << 26) | (a7 >> 3) | (a1 << 30) | (a2 << 20) |
        (a3 << 23) | (a4 << 16) | (a5 << 18) | (a6 << 29);
}

/*
 * Packs six texture-coordinate/control fields and writes geometry register
 * 0x040004A4. The sixth value is ORed without shifting; returns void.
 */
extern "C" void func_ov027_021fd0f0(u32 a0, u32 a1, u32 a2, u32 a3,
                                      u32 a4, u32 a5)
{
    *(volatile u32 *)0x040004a4 =
        a0 | (a1 << 4) | (a2 << 6) | a5 | (a3 << 24) | (a4 << 16);
}

/*
 * Converts fixed-point `x` and `y` by discarding eight low bits, packs their
 * low 16-bit results, and writes geometry register 0x04000488. Returns void.
 */
extern "C" void func_ov027_021fd11c(s32 x, s32 y)
{
    u32 packed_x = (u16)((s32)(x << 8) >> 16);
    u32 packed_y = (u16)((s32)(y << 8) >> 16);
    *(volatile u32 *)0x04000488 = packed_x | (packed_y << 16);
}

/*
 * Writes a vertex to geometry register 0x0400048C: `x`/`y` are packed into
 * the first word and the low 16 bits of `z` form the second. Returns void.
 */
extern "C" void func_ov027_021fd150(s32 x, s32 y, s32 z)
{
    volatile u32 *const vertex = (volatile u32 *)0x0400048c;
    vertex[0] = (u16)x | ((u32)(u16)y << 16);
    vertex[0] = (u16)z;
}
