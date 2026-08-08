#include "tingle/types.h"

/* Overlay 34 owner rendering and GX polygon/texture attribute packing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov034_021fd90c(s32 lightMask, s32 mode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov034_021fd938(s32 format, s32 transform, s32 sizeS, s32 sizeT,
                               s32 repeatS, s32 repeatT, s32 flip,
                               u32 address);
extern void func_ov034_021fd030(void *sectorState);
extern void func_ov034_021fcf90(u16 low, u16 high, s32 enabled);
extern void *func_ov034_021fcfd8(void *resource, s32 index);
extern void func_01ff88c4(s32 first, void *resource, s32 entry);
#ifdef __cplusplus
}
#endif

/*
 * Renders the overlay-34 owner when scale/intensity +0x70 is positive. It loads
 * transform words +0x10/+0x20/+0x30 and +0x70 into GX matrix ports, programs a
 * polygon with alpha 31 and texture parameters +0xAC/+0xB4/+0xB8/+0xBC, writes
 * a derived texture palette base from +0xB0, and draws the three sector states
 * at +0xA0..+0xA8. When countdown +0xC4 is positive it emits an additional
 * highlighted quad through the vertex/texture FIFO. It then resets matrix scale
 * to 0x400, installs polygon ID 0x21, disables texture attributes, programs the
 * recovered +0xC0 palette field and 0x3E0 register values, resolves resource
 * entry zero through +0x9C, submits it, and flushes GX. Returns no value and has
 * extensive direct Nintendo DS GX/MMIO effects plus renderer submission state.
 */
extern "C" void func_ov034_021fd6f4(void *owner)
{
    s32 scale = FIELD(s32, owner, 0x70);
    if (scale <= 0)
        return;

    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, owner, 0x10);
    REG32(0x04000470) = FIELD(u32, owner, 0x20);
    REG32(0x04000470) = FIELD(u32, owner, 0x30);
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = scale;
    func_ov034_021fd90c(0, 0, 3, 0x20, 0x1f, 0);
    func_ov034_021fd938(FIELD(s32, owner, 0xb4), 1,
                        FIELD(s32, owner, 0xb8), FIELD(s32, owner, 0xbc),
                        0, 0, 0, FIELD(u32, owner, 0xac));
    s32 shift = FIELD(s32, owner, 0xb4) == 2 ? 3 : 4;
    REG32(0x040004ac) = FIELD(u32, owner, 0xb0) >> shift;

    for (s32 i = 0; i < 3; ++i)
        func_ov034_021fd030(FIELD(void *, owner, 0xa0 + i * 4));

    s32 highlight = FIELD(s32, owner, 0xc4);
    if (highlight > 0) {
        func_ov034_021fd90c(0, 0, 3, 0x22, highlight, 0);
        REG32(0x04000500) = 1;
        REG32(0x04000480) = 0x7fff;
        REG32(0x0400048c) = 0x01e0f940;
        REG32(0x0400048c) = 0x10;
        REG32(0x04000494) = 0x01e0f940 - 0x03c00000;
        REG32(0x04000494) = 0x00010000 - 0x01e0f940;
        REG32(0x04000494) = 0x01e006c0;
        REG32(0x04000504) = 0;
    }

    REG32(0x0400046c) = 0x400;
    REG32(0x0400046c) = 0x400;
    REG32(0x0400046c) = 0x400;
    func_ov034_021fd90c(1, 0, 3, 0x21, 0x1f, 0);
    func_ov034_021fd938(0, 0, 0, 0, 0, 0, 0, 0);
    func_ov034_021fcf90(0x3e0, (u16)(FIELD(u32, owner, 0xc0) << 5), 0);
    REG32(0x040004c4) = 0x3e0;
    void *resource = FIELD(void *, owner, 0x9c);
    void *entry = func_ov034_021fcfd8(resource, 0);
    func_01ff88c4(3, entry, FIELD(s32, FIELD(void *, resource, 0x24), 0));
    REG32(0x04000448) = 1;
}

/*
 * Packs polygon attributes into GX register 0x040004A4. Inputs occupy the
 * recovered light/mode/cull, polygon-ID, alpha, and miscellaneous bit fields.
 * Returns no value and directly changes GX MMIO.
 */
extern "C" void func_ov034_021fd90c(s32 lightMask, s32 mode, s32 cullMode,
                                     s32 polygonId, s32 alpha, s32 miscBits)
{
    REG32(0x040004a4) = lightMask | (mode << 4) | (cullMode << 6) |
                        miscBits | (polygonId << 24) | (alpha << 16);
}

/*
 * Packs texture format, transform, dimensions, repeat/flip flags, and address
 * into GX register 0x040004A8. Field names reflect confirmed bit placement;
 * higher-level texture semantics are inferred from SDK conventions. Returns no
 * value and directly changes GX MMIO.
 */
extern "C" void func_ov034_021fd938(s32 format, s32 transform,
                                     s32 sizeS, s32 sizeT, s32 repeatS,
                                     s32 repeatT, s32 flip,
                                     u32 address)
{
    REG32(0x040004a8) = (format << 26) | (address >> 3) |
                        (transform << 30) | (sizeS << 20) | (sizeT << 23) |
                        (repeatS << 16) | (repeatT << 18) |
                        (flip << 29);
}
