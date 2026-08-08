#include "tingle/types.h"

/*
 * Overlay 39 lightweight render-object configuration and helper collision
 * search. These recovered routines set renderer flags and claim one of thirty
 * allocated helper records when it overlaps an input-relative rectangle.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *renderObject, u8 orientation);
#ifdef __cplusplus
}
#endif

/*
 * The scene input is unused. Forward orientation to the render object at
 * object +0x0C, set bit 1 of its +0x24 halfword, and store enabled at +0x3A.
 * Returns no value; renderer state changes. Unlike func_ov039_021fd7f0, this
 * helper intentionally leaves transform fields untouched.
 */
extern "C" void func_ov039_021fd84c(void *scene, void *object,
                                     u8 orientation, u8 enabled)
{
    (void)scene;
    void *renderObject = FIELD(void *, object, 0x0c);
    func_02072b68(renderObject, orientation);
    FIELD(u16, renderObject, 0x24) |= 2;
    FIELD(u8, renderObject, 0x3a) = enabled;
}

/*
 * Return zero immediately while scene halfword +0x1CAC is nonzero. Otherwise
 * scan the thirty helper pointers at +0xA0..+0x114 from index 29 downward,
 * skipping records whose +0x18 has bit 2 set. A record matches when its +4 x
 * coordinate differs from input +4 by strictly between -0x6000 and 0x6000,
 * and its +8 y coordinate differs from (input +8 - input +0x0C - 0xB000) by
 * strictly between -0x7000 and 0x7000. On the first match, overwrite helper
 * +0x18 with 4, copy helper +0x10/+0x14 to output +4/+8, and return one.
 * Inputs are scene, comparison record, and output record; helper/output state
 * changes only on success. The gameplay meaning of these coordinates is
 * inferred, while the bounds and offset arithmetic are confirmed.
 */
extern "C" s32 func_ov039_021fd880(void *scene, const void *input, void *output)
{
    if (FIELD(u16, scene, 0x1cac) != 0) {
        return 0;
    }
    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        if ((FIELD(u32, helper, 0x18) & 4) != 0) {
            continue;
        }
        s32 dx = FIELD(s32, helper, 4) - FIELD(s32, input, 4);
        s32 referenceY = FIELD(s32, input, 8) - FIELD(s32, input, 0x0c) - 0xb000;
        s32 dy = FIELD(s32, helper, 8) - referenceY;
        if (dx >= 0x6000 || dx <= -0x6000 ||
            dy >= 0x7000 || dy <= -0x7000) {
            continue;
        }
        FIELD(u32, helper, 0x18) = 4;
        FIELD(s32, output, 4) = FIELD(s32, helper, 0x10);
        FIELD(s32, output, 8) = FIELD(s32, helper, 0x14);
        return 1;
    }
    return 0;
}
