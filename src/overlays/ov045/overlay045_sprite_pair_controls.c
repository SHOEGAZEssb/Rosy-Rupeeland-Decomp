#include "tingle/types.h"

/*
 * Overlay 45 paired-sprite controls. These recovered leaf callbacks adjust
 * the shared font extent and report whether the controller is in a transient
 * active mode.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Store the supplied font extent at +0x18 in font state +0x1C. This changes
 * later text layout and returns no value.
 */
extern "C" void func_ov045_0220c274(void *object, s32 extent)
{
    FIELD(s32, FIELD(void *, object, 0x1c), 0x18) = extent;
}

/*
 * Return one when logical mode +0x28 is 2 or 5, otherwise zero. Object state is
 * not changed and there are no hardware or SDK effects.
 */
extern "C" s32 func_ov045_0220c280(void *object)
{
    switch (FIELD(s32, object, 0x28)) {
    case 2:
    case 5:
        return 1;
    default:
        return 0;
    }
}
