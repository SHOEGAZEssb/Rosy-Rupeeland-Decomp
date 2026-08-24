#include "tingle/types.h"

/* Overlay 37 low-level 3D object drawing and geometry-engine register packing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b00f0(void *context);
extern void func_020b0880(s32 sine, s32 cosine);
extern void func_020b0844(s32 sine, s32 cosine);
extern void func_020b0808(s32 sine, s32 cosine);
extern void func_01ff88c4(s32 primitive, const void *vertices, const void *commands);
#ifdef __cplusplus
}
#endif

/*
 * Packs polygon attributes into the geometry engine's POLYGON_ATTR register.
 * The six arguments occupy the low control fields, bits 16.., and bits 24..;
 * returns nothing and directly changes MMIO register 0x040004A4.
 */
extern "C" void func_ov037_021fd0a8(u32 lightMask, u32 polygonMode,
                                      u32 cullMode, u32 polygonId,
                                      u32 alpha, u32 flags)
{
    REG32(0x040004a4) = flags | lightMask | (polygonMode << 4) |
                        (cullMode << 6) | (polygonId << 24) | (alpha << 16);
}

/*
 * Packs a texture-coordinate pair and optional high-bit flag into geometry
 * register 0x040004C0. Returns nothing; this is a direct hardware write.
 */
extern "C" void func_ov037_021fd0d4(u32 s, u32 t, s32 flag)
{
    REG32(0x040004c0) = s | (t << 16) | ((flag != 0) << 15);
}

/*
 * Packs a second coordinate pair and optional high-bit flag into geometry
 * register 0x040004C4. Returns nothing; this is a direct hardware write.
 */
extern "C" void func_ov037_021fd0f8(u32 s, u32 t, s32 flag)
{
    REG32(0x040004c4) = s | (t << 16) | ((flag != 0) << 15);
}

/*
 * Draws one indexed overlay object unless visibility bit 0 at +0x98 is set.
 * It loads position, optional matrix context, Euler rotations through the
 * shared sine/cosine table, scale, polygon/texture attributes, and an indexed
 * triangle list from owner+0x24. Geometry-engine MMIO at 0x04000444,
 * 0x04000448, 0x0400046C, 0x040004A4, 0x040004C0, and 0x040004C4 changes;
 * the object itself is not modified and the function returns nothing.
 */
extern "C" void func_ov037_021fcf20(void *object, void *matrixContext)
{
    if ((FIELD(u16, object, 0x98) & 1) != 0)
        return;

    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);

    if ((FIELD(u16, object, 0x98) & 2) != 0)
        func_020b00f0(matrixContext);

    u16 angle = (u16)FIELD(u32, object, 0x40);
    func_020b0880(gFx32CosSinTable[(angle >> 4) * 2],
                  gFx32CosSinTable[(angle >> 4) * 2 + 1]);
    angle = (u16)FIELD(u32, object, 0x50);
    func_020b0844(gFx32CosSinTable[(angle >> 4) * 2],
                  gFx32CosSinTable[(angle >> 4) * 2 + 1]);
    angle = (u16)FIELD(u32, object, 0x60);
    func_020b0808(gFx32CosSinTable[(angle >> 4) * 2],
                  gFx32CosSinTable[(angle >> 4) * 2 + 1]);

    REG32(0x0400046c) = FIELD(u32, object, 0x70);
    REG32(0x0400046c) = FIELD(u32, object, 0x70);
    REG32(0x0400046c) = FIELD(u32, object, 0x70);
    func_ov037_021fd0a8(FIELD(u32, object, 0xa4), 0, 2,
                        FIELD(u32, object, 0xa8), FIELD(u32, object, 0xac),
                        FIELD(u32, object, 0xb8));
    func_ov037_021fd0d4(FIELD(u16, object, 0xbc),
                        FIELD(u16, object, 0xbe), 0);
    func_ov037_021fd0f8(FIELD(u16, object, 0xc0),
                        FIELD(u16, object, 0xc2), 0);

    u8 *table = FIELD(u8 *, FIELD(void *, object, 0x9c), 0x24);
    u32 offset = FIELD(u32, object, 0xa0) * 12;
    func_01ff88c4(3, table + FIELD(u32, table, offset + 4),
                  table + FIELD(u32, table, offset));
    REG32(0x04000448) = 1;
}
