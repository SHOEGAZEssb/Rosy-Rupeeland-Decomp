#include "tingle/types.h"

/* Overlay 36 GX rendering for the externally backed resource object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *resource);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *resource);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *resource);
extern s32 func_02070454(void *resource);
extern s32 func_02070464(void *resource);
extern void func_ov036_021fd128(s32, s32, s32, s32, s32, s32);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fe1c0(s32 value, s32 mode);
extern void func_ov036_021fe1e4(s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Draws the resource owned at object +0x9C. It loads object translation
 * +0x10/+0x20/+0x30 and scale (16,16,1 in Q12), derives polygon and texture
 * parameters through the resource accessors, and submits a textured quad.
 * Resource-internal +0x10/+0x14 pointers provide additional confirmed GX
 * fields whose semantics remain unnamed. It returns nothing and directly
 * changes Nintendo DS GX matrix, polygon, texture, vertex, and FIFO state.
 */
extern "C" void func_ov036_021fe028(void *object)
{
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x1000;

    void *resource = FIELD(void *, object, 0x9c);
    s32 value0 = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 value2 = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 value3 = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    s32 value7 = FIELD(s32, FIELD(void *, resource, 0x10), 0xc);
    func_ov036_021fdef0(value0, 1, value2, value3, 3, 0, 0, value7);

    s32 mode = FIELD(s32, FIELD(void *, resource, 0x14), 0xc);
    func_ov036_021fe1c0(mode, Graphics3DResourceBinding_GetTextureFormat(resource));

    s32 width = func_02070454(FIELD(void *, resource, 4)) << 12;
    s32 height = func_02070464(FIELD(void *, resource, 4)) << 12;
    func_ov036_021fd128(0, 0, 3, 0x15, 0x1f, 0);

    REG32(0x04000500) = 1;
    REG32(0x04000480) = 0x7fff;
    func_ov036_021fe1e4(0, height);
    REG32(0x0400048c) = 0xff80;
    REG32(0x0400048c) = 0;
    func_ov036_021fe1e4(width, height);
    REG32(0x04000494) = 0x80;
    func_ov036_021fe1e4(width, 0);
    REG32(0x04000494) = 0x01000080;
    REG32(0x04000488) = 0;
    REG32(0x04000494) = 0x0100ff80;
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}

/*
 * Writes value to GX texture parameter register 0x040004AC after shifting it
 * right by three when mode equals 2, otherwise by four. It returns nothing and
 * directly changes texture state.
 */
extern "C" void func_ov036_021fe1c0(s32 value, s32 mode)
{
    REG32(0x040004ac) = (u32)value >> (mode == 2 ? 3 : 4);
}

/*
 * Converts bits 8..23 of two fixed-point inputs to signed 16-bit texture
 * coordinates, packs first low and second high, and writes GX FIFO 0x04000488.
 * It returns nothing and directly submits one texture-coordinate pair.
 */
extern "C" void func_ov036_021fe1e4(s32 first, s32 second)
{
    s16 firstValue = (s16)(first >> 8);
    s16 secondValue = (s16)(second >> 8);
    REG32(0x04000488) = (u16)firstValue | ((u32)(u16)secondValue << 16);
}
