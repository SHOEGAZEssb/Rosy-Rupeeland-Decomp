#include "tingle/types.h"

/* Overlay 35 render-object drawing and low-level GX attribute programming. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b00f0(s32 mode);
extern void func_020b0880(s16 sine, s16 cosine);
extern void func_020b0844(s16 sine, s16 cosine);
extern void func_020b0808(s16 sine, s16 cosine);
extern void func_01ff88c4(s32 mode, void *resource, s32 entry);
extern void func_ov035_021fd128(s32 lightMask, s32 polygonMode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov035_021fd154(u16 low, u16 high, s32 enabled);
extern void func_ov035_021fd178(u16 low, u16 high, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Draws a render object unless flag bit 0 at +0x98 hides it. It loads the
 * translation at +0x10/+0x20/+0x30, optionally selects the supplied matrix mode
 * when flag bit 1 is set, applies rotations indexed by +0x40/+0x50/+0x60
 * through the shared interleaved sine/cosine table, and applies uniform scale
 * +0x70. Polygon attributes +0xA4/+0xA8/+0xAC/+0xB8 and edge registers
 * +0xBC..+0xC2 are programmed before resource entry +0xA0 is submitted from
 * table +0x9C. Returns no value and directly changes Nintendo DS GX MMIO.
 */
extern "C" void func_ov035_021fcfa0(void *object, s32 mode)
{
    if (FIELD(u16, object, 0x98) & 1)
        return;

    s32 angleX = FIELD(s32, object, 0x40);
    s32 angleY = FIELD(s32, object, 0x50);
    s32 angleZ = FIELD(s32, object, 0x60);
    s32 scale = FIELD(s32, object, 0x70);

    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);

    if (FIELD(u16, object, 0x98) & 2)
        func_020b00f0(mode);

    s32 index = (angleX >> 4) * 2;
    func_020b0880(data_020c9670[index], data_020c9670[index + 1]);
    index = (angleY >> 4) * 2;
    func_020b0844(data_020c9670[index], data_020c9670[index + 1]);
    index = (angleZ >> 4) * 2;
    func_020b0808(data_020c9670[index], data_020c9670[index + 1]);

    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = scale;
    REG32(0x0400046c) = scale;
    func_ov035_021fd128(FIELD(s32, object, 0xa4), 0, 2,
                        FIELD(s32, object, 0xa8),
                        FIELD(s32, object, 0xac),
                        FIELD(s32, object, 0xb8));
    func_ov035_021fd154(FIELD(u16, object, 0xbc),
                        FIELD(u16, object, 0xbe), 0);
    func_ov035_021fd178(FIELD(u16, object, 0xc0),
                        FIELD(u16, object, 0xc2), 0);

    u8 *table = (u8 *)FIELD(void *, object, 0x9c);
    s32 resourceIndex = FIELD(s32, object, 0xa0);
    u8 *record = table + resourceIndex * 12;
    func_01ff88c4(3, table + FIELD(s32, record, 4),
                   FIELD(s32, record, 0));
    REG32(0x04000448) = 1;
}

/*
 * Packs six recovered polygon fields into GX polygon-attribute register
 * 0x040004A4. Inputs occupy bits 0, 4, 6, 16, 24, and the caller-supplied
 * miscellaneous mask. Returns no value and directly changes GX state.
 */
extern "C" void func_ov035_021fd128(s32 lightMask, s32 polygonMode,
                                     s32 cullMode, s32 polygonId,
                                     s32 alpha, s32 miscBits)
{
    REG32(0x040004a4) = lightMask | (polygonMode << 4) | (cullMode << 6) |
                        miscBits | (polygonId << 24) | (alpha << 16);
}

/*
 * Packs two 16-bit edge/fog values and a normalized enable flag into GX
 * register 0x040004C0. Returns no value and directly changes GX state.
 */
extern "C" void func_ov035_021fd154(u16 low, u16 high, s32 enabled)
{
    REG32(0x040004c0) = low | ((u32)high << 16) |
                        ((enabled != 0) << 15);
}

/*
 * Packs two 16-bit edge/fog values and a normalized enable flag into GX
 * register 0x040004C4. Returns no value and directly changes GX state.
 */
extern "C" void func_ov035_021fd178(u16 low, u16 high, s32 enabled)
{
    REG32(0x040004c4) = low | ((u32)high << 16) |
                        ((enabled != 0) << 15);
}
