#include "tingle/types.h"

/* Overlay 35 textured transition-quad rendering and GX coordinate helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b00f0(s32 mode);
extern s32 func_02077d4c(void *resource);
extern s32 func_02077d5c(void *resource);
extern s32 func_02077d6c(void *resource);
extern s32 func_02070454(void *record);
extern s32 func_02070464(void *record);
extern void func_ov035_021fd7b0(s32 format, s32 transform, s32 sizeS,
                               s32 sizeT, s32 repeatS, s32 repeatT,
                               s32 flip, u32 address);
extern void func_ov035_021fd128(s32 lightMask, s32 polygonMode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov035_021fe88c(u32 paletteBase, s32 format);
extern void func_ov035_021fe8b0(s32 s, s32 t);
#ifdef __cplusplus
}
#endif

/*
 * Draws the owned +0x9C transition resource as one textured GX quad. It loads
 * translation +0x10/+0x20/+0x30, selects caller matrix mode, scales X/Y by
 * +0x70 shifted four and Z by 0x1000, derives texture attributes and palette
 * base from the resource, and uses its record dimensions for fixed-point quad
 * extents. Polygon ID 0x13 and alpha 31 are used. Returns no value and directly
 * programs Nintendo DS GX MMIO plus resource-query state.
 */
extern "C" void func_ov035_021fe6e4(void *object, s32 mode)
{
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    func_020b00f0(mode);
    s32 scale = FIELD(s32, object, 0x70) << 4;
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = 0x1000;

    void *resource = FIELD(void *, object, 0x9c);
    s32 textureBase = func_02077d4c(resource);
    s32 format = func_02077d5c(resource);
    s32 sizeT = func_02077d6c(resource);
    u32 address = FIELD(u32, FIELD(void *, resource, 0x10), 0x0c);
    func_ov035_021fd7b0(textureBase, 1, format, sizeT, 3, 0, 0, address);

    u32 paletteBase = FIELD(u32, FIELD(void *, resource, 0x14), 0x0c);
    func_ov035_021fe88c(paletteBase, func_02077d4c(resource));
    void *record = FIELD(void *, resource, 4);
    s32 width = func_02070454(record) << 12;
    s32 height = func_02070464(record) << 12;
    func_ov035_021fd128(0, 0, 3, 0x13, 0x1f, 0);

    REG32(0x04000500) = 1;
    REG32(0x04000480) = 0x7fff;
    func_ov035_021fe8b0(0, height);
    REG32(0x0400048c) = 0x0000ff80;
    REG32(0x0400048c) = 0;
    func_ov035_021fe8b0(width, height);
    REG32(0x04000494) = 0x80;
    func_ov035_021fe8b0(width, 0);
    REG32(0x04000494) = 0x01000080;
    REG32(0x04000488) = 0;
    REG32(0x04000494) = 0x0100ff80;
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}

/*
 * Programs GX texture-palette base register 0x040004AC. Format value 2 uses a
 * three-bit address shift; all other values use four. Returns no value and
 * directly changes GX texture state.
 */
extern "C" void func_ov035_021fe88c(u32 paletteBase, s32 format)
{
    REG32(0x040004ac) = paletteBase >> (format == 2 ? 3 : 4);
}

/*
 * Packs signed fixed-point texture coordinates after shifting each input right
 * by eight into GX register 0x04000488. Returns no value and directly changes
 * the current GX texture coordinate.
 */
extern "C" void func_ov035_021fe8b0(s32 s, s32 t)
{
    REG32(0x04000488) = (u16)(s >> 8) | ((u32)(u16)(t >> 8) << 16);
}
