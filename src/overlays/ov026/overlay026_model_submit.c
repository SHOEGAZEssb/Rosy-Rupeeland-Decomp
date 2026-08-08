#include "tingle/types.h"

/* Overlay 26 model submission and packed Nintendo DS geometry-command helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02070454(void *);
extern s32 func_02070464(void *);
extern s32 func_02077d4c(void *);
extern s32 func_02077d5c(void *);
extern s32 func_02077d6c(void *);
extern void func_020b00f0(s32);
extern void func_020b0808(s32, s32);
extern void func_020b0844(s32, s32);
extern void func_020b0880(s32, s32);
extern void func_ov026_021fd900(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd940(u32, s32);
extern void func_ov026_021fd964(u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd990(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Submits the model resource at +0x9C with object translation, optional matrix
 * command selected by +0xA0, XYZ rotations, and uniform +0x70 scale. Resource
 * metadata supplies packed material/texture commands and dimensions used to
 * issue vertices through the DS geometry FIFO. It finishes by setting several
 * fixed geometry registers and enabling the engine; returns void.
 */
extern "C" void func_ov026_021fd6b0(void *object, s32 matrix_mode)
{
    volatile u32 *const matrix_port = (volatile u32 *)0x04000444;
    volatile u32 *const scale_port = (volatile u32 *)0x0400046c;
    *matrix_port = 0;
    *matrix_port = FIELD(u32, object, 0x10);
    *matrix_port = FIELD(u32, object, 0x20);
    *matrix_port = FIELD(u32, object, 0x30);
    if (FIELD(s32, object, 0xa0))
        func_020b00f0(matrix_mode);

    u16 x = (u16)FIELD(u32, object, 0x40);
    u16 y = (u16)FIELD(u32, object, 0x50);
    u16 z = (u16)FIELD(u32, object, 0x60);
    s32 xi = (s16)x >> 4;
    s32 yi = (s16)y >> 4;
    s32 zi = (s16)z >> 4;
    func_020b0880(data_020c9670[xi * 2], data_020c9670[xi * 2 + 1]);
    func_020b0844(data_020c9670[yi * 2], data_020c9670[yi * 2 + 1]);
    func_020b0808(data_020c9670[zi * 2], data_020c9670[zi * 2 + 1]);
    *scale_port = FIELD(u32, object, 0x70);
    *scale_port = FIELD(u32, object, 0x70);
    *scale_port = FIELD(u32, object, 0x70);

    void *resource = FIELD(void *, object, 0x9c);
    s32 a = func_02077d4c(resource);
    s32 b = func_02077d5c(resource);
    s32 c = func_02077d6c(resource);
    s32 word = FIELD(s32, FIELD(void *, resource, 0x10), 0xc);
    func_ov026_021fd900(a, 1, b, c, 3, 0, 0, word);
    s32 auxiliary = FIELD(s32, FIELD(void *, resource, 0x14), 0xc);
    func_ov026_021fd940(auxiliary, func_02077d4c(resource));

    void *shape = FIELD(void *, resource, 4);
    s32 width = func_02070454(shape) * 3 << 12;
    s32 height = func_02070464(shape) * 3 << 12;
    func_ov026_021fd964(0, 0, 3, 0x1c, 0x1f, 0);
    *(volatile u32 *)0x04000500 = 1;
    *(volatile u32 *)0x04000480 = 0x7fff;
    func_ov026_021fd990(0, height);
    *(volatile u32 *)0x0400048c = 0xf000f000;
    *(volatile u32 *)0x0400048c = 0;
    func_ov026_021fd990(width, height);
    *(volatile u32 *)0x04000494 = 0xf0001000;
    func_ov026_021fd990(width, 0);
    *(volatile u32 *)0x04000494 = 0x10001000;
    *(volatile u32 *)0x04000488 = 0;
    *(volatile u32 *)0x04000494 = 0x1000f000;
    *(volatile u32 *)0x04000504 = 0;
    *(volatile u32 *)0x04000448 = 1;
}

/* Packs eight polygon/material fields and writes geometry port 0x040004A8. */
extern "C" void func_ov026_021fd900(u32 a, u32 b, u32 c, u32 d,
                                     u32 e, u32 f, u32 g, u32 h)
{
    *(volatile u32 *)0x040004a8 = (a << 26) | (h >> 3) | (b << 30) |
        (c << 20) | (d << 23) | (e << 16) | (f << 18) | (g << 29);
}

/* Shifts `value` by 3 or 4 according to whether `mode` is 2 and writes +0x4AC. */
extern "C" void func_ov026_021fd940(u32 value, s32 mode)
{
    *(volatile u32 *)0x040004ac = value >> (mode == 2 ? 3 : 4);
}

/* Packs six texture/image parameters and writes geometry port 0x040004A4. */
extern "C" void func_ov026_021fd964(u32 a, u32 b, u32 c, u32 d, u32 e, u32 f)
{
    *(volatile u32 *)0x040004a4 = a | (b << 4) | (c << 6) | f |
                                  (d << 24) | (e << 16);
}

/* Packs the middle signed 16 bits of X/Y into the vertex port at 0x04000488. */
extern "C" void func_ov026_021fd990(s32 x, s32 y)
{
    u32 packed_x = (u32)((x << 8) >> 16) & 0xffff;
    u32 packed_y = (u32)((y << 8) >> 16) & 0xffff;
    *(volatile u32 *)0x04000488 = packed_x | (packed_y << 16);
}
