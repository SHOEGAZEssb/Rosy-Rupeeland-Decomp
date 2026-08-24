#include "tingle/types.h"

/* Overlay 36 three-child object transform and list rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov036_021fd128(s32 lightMask, s32 polygonMode,
                                s32 cullMode, s32 polygonId,
                                s32 alpha, s32 misc);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_020b0880(s16 first, s16 second);
extern void func_020b0844(s16 first, s16 second);
extern void func_020b0808(s16 first, s16 second);
extern void func_ov036_021fcfa0(void *object, void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Draws the object only when +0xAC is nonzero. It configures polygon state
 * (cull 3, ID 0x10, alpha 0x1F), clears common render parameters, selects the
 * GX matrix mode, loads translation +0x10/+0x20/+0x30, applies X/Y/Z rotations
 * from low-16-bit angles +0x40/+0x50/+0x60 through gFx32CosSinTable, and loads
 * uniform scale +0x70. Every child linked from +0xA0 through +8 is drawn using
 * caller transform. Finally the GX matrix is committed. Returns nothing and
 * directly changes Nintendo DS GX state.
 */
extern "C" void func_ov036_02203c44(void *object, void *transform)
{
    if (FIELD(s32, object, 0xac) == 0)
        return;
    func_ov036_021fd128(0, 0, 3, 0x10, 0x1f, 0);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(s32, object, 0x10);
    REG32(0x04000470) = FIELD(s32, object, 0x20);
    REG32(0x04000470) = FIELD(s32, object, 0x30);
    u32 index = ((u16)FIELD(s32, object, 0x40) >> 4) * 2;
    func_020b0880(gFx32CosSinTable[index], gFx32CosSinTable[index + 1]);
    index = ((u16)FIELD(s32, object, 0x50) >> 4) * 2;
    func_020b0844(gFx32CosSinTable[index], gFx32CosSinTable[index + 1]);
    index = ((u16)FIELD(s32, object, 0x60) >> 4) * 2;
    func_020b0808(gFx32CosSinTable[index], gFx32CosSinTable[index + 1]);
    REG32(0x0400046c) = FIELD(s32, object, 0x70);
    REG32(0x0400046c) = FIELD(s32, object, 0x70);
    REG32(0x0400046c) = FIELD(s32, object, 0x70);
    for (void *child = FIELD(void *, object, 0xa0);
         child != 0; child = FIELD(void *, child, 8))
        func_ov036_021fcfa0(child, transform);
    REG32(0x04000448) = 1;
}
