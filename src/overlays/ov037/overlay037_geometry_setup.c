#include "tingle/types.h"

/* Overlay 37 geometry-engine setup for drawing the resource-owner model. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *binding);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *binding);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *binding);
extern s32 func_02070454(void *resource);
extern s32 func_02070464(void *resource);
extern void func_ov037_021fd0a8(u32 lightMask, u32 polygonMode,
                                u32 cullMode, u32 polygonId,
                                u32 alpha, u32 flags);
#ifdef __cplusplus
}
#endif

/*
 * Packs eight texture-image parameters into geometry register 0x040004A8.
 * The final argument contributes its address-like value shifted right by 3;
 * the other fields occupy bits 16, 18, 20, 23, 26, 29, and 30. Returns
 * nothing and directly changes geometry-engine MMIO.
 */
extern "C" void func_ov037_021fd4e0(u32 format, u32 repeatS, u32 repeatT,
                                      u32 flipS, u32 flipT, u32 sizeS,
                                      u32 sizeT, u32 textureAddress)
{
    REG32(0x040004a8) = (format << 26) | (textureAddress >> 3) |
                        (repeatS << 30) | (repeatT << 20) |
                        (flipS << 23) | (flipT << 16) |
                        (sizeS << 18) | (sizeT << 29);
}

/*
 * Converts two 20.12 fixed-point coordinates to packed signed 12.4 values
 * and writes them to geometry vertex register 0x04000488. Returns nothing;
 * only geometry-engine MMIO changes.
 */
extern "C" void func_ov037_021fd520(s32 x, s32 y)
{
    REG32(0x04000488) = ((u32)(y >> 8) & 0xffff) << 16 |
                        ((u32)(x >> 8) & 0xffff);
}

/*
 * Configures the geometry engine from object position and the resource binding
 * at +0x9C. It resets matrix state, selects texture/palette data obtained from
 * the binding, derives dimensions from its resource, emits four packed
 * vertices, and sets material/viewport-related registers. Returns nothing;
 * geometry MMIO from 0x04000440 through 0x04000500 changes, while object memory
 * is only read. Exact semantic names for several binding accessors are inferred.
 */
extern "C" void func_ov037_021fd324(void *object)
{
    void *binding = FIELD(void *, object, 0x9c);

    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x1000;

    s32 format = Graphics3DResourceBinding_GetTextureFormat(binding);
    s32 repeat = Graphics3DResourceBinding_GetTextureWidthClass(binding);
    s32 flip = Graphics3DResourceBinding_GetTextureHeightClass(binding);
    u32 textureAddress = FIELD(u32, FIELD(void *, binding, 0x10), 0x0c);
    func_ov037_021fd4e0(format, 1, repeat, flip, 3, 0, 0,
                        textureAddress);

    s32 shift = 4 - (Graphics3DResourceBinding_GetTextureFormat(binding) == 2);
    REG32(0x040004ac) = FIELD(u32, FIELD(void *, binding, 0x14), 0x0c) >> shift;

    void *resource = FIELD(void *, binding, 4);
    s32 width = func_02070454(resource) * 3 << 12;
    s32 height = func_02070464(resource) * 3 << 12;
    func_ov037_021fd0a8(0, 0, 3, 2, 31, 0);

    REG32(0x04000500) = 1;
    REG32(0x04000480) = 0x7fff;
    func_ov037_021fd520(0, height);
    REG32(0x0400048c) = 0xfe80fe80;
    REG32(0x0400048c) = 0;
    func_ov037_021fd520(width, height);
    REG32(0x04000494) = 0xfe800180;
    func_ov037_021fd520(width, 0);
    REG32(0x04000494) = 0x01800180;
    REG32(0x04000488) = 0;
    REG32(0x04000494) = 0x0180fe80;
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}
