#include "tingle/types.h"

/* Overlay 36 motion-particle list rendering and compact vector setters. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov036_021fd128(s32, s32, s32, s32, s32, s32);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fd4c8(void *particle);
#ifdef __cplusplus
}
#endif

/*
 * Configures the common GX attributes for particle drawing, clears the packed
 * polygon attributes, and renders every node reached through +8 from list head
 * object +0xA0 with func_ov036_021fd4c8. It returns nothing and directly
 * changes GX state while each particle may submit geometry.
 */
extern "C" void func_ov036_021fe988(void *object)
{
    func_ov036_021fd128(0, 0, 3, 0x10, 0x1f, 0);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    void *particle = FIELD(void *, object, 0xa0);
    while (particle != 0) {
        func_ov036_021fd4c8(particle);
        particle = FIELD(void *, particle, 8);
    }
}

/*
 * Stores a three-component vector at record +4/+8/+0xC. It returns nothing
 * and changes only those fields.
 */
extern "C" void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z)
{
    FIELD(s32, record, 4) = x;
    FIELD(s32, record, 8) = y;
    FIELD(s32, record, 0xc) = z;
}

/*
 * Stores a three-component vector at record +0x10/+0x14/+0x18. It returns
 * nothing and changes only those fields.
 */
extern "C" void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z)
{
    FIELD(s32, record, 0x10) = x;
    FIELD(s32, record, 0x14) = y;
    FIELD(s32, record, 0x18) = z;
}
