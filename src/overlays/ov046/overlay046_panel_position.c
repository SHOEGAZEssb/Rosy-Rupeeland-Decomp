#include "tingle/types.h"

/*
 * Overlay 46 selection-panel positioning. These recovered helpers derive the
 * panel origin from the overlay's category/variant tables, store explicit
 * origins, and synchronize the shared font-state translation before drawing.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov046_0220cd14[];
extern "C" u8 data_ov046_0220cd18[];
extern "C" u8 data_ov046_0220cd1c[];
extern "C" u8 data_ov046_0220cd20[];
extern "C" u8 data_ov046_0220cd24[];
extern "C" u8 data_ov046_0220ce08[];
extern "C" u8 data_ov046_0220ce0c[];
/*
 * Return the horizontal origin for selector `index`. It combines the category
 * base at data_ov046_0220ce08 with the selector's 0x40-pixel variant offset
 * and half of the signed width adjustment at data_ov046_0220cd20. No state or
 * hardware is changed; the first argument is unused by the recovered code.
 */
extern "C" s32 func_ov046_0220c3bc(void *, s32 index)
{
    s32 selectorOffset = index * 0x14;
    s32 category = *(s32 *)(data_ov046_0220cd14 + selectorOffset);
    s32 base = *(s32 *)(data_ov046_0220ce08 + category * 0x28);
    s32 variant = *(s32 *)(data_ov046_0220cd18 + selectorOffset);
    s32 adjustment = *(s32 *)(data_ov046_0220cd20 + selectorOffset);
    s32 scaledAdjustment = adjustment << 6;
    scaledAdjustment += (u32)scaledAdjustment >> 31;
    return base + variant * 0x40 + (scaledAdjustment >> 1);
}

/*
 * Return the vertical origin for selector `index`. It combines the category
 * base at data_ov046_0220ce0C with a 0x30-pixel variant offset and half of the
 * signed height adjustment at data_ov046_0220cd24. No state is changed.
 */
extern "C" s32 func_ov046_0220c410(void *, s32 index)
{
    s32 selectorOffset = index * 0x14;
    s32 category = *(s32 *)(data_ov046_0220cd14 + selectorOffset);
    s32 base = *(s32 *)(data_ov046_0220ce0c + category * 0x28);
    s32 variant = *(s32 *)(data_ov046_0220cd1c + selectorOffset);
    s32 adjustment = *(s32 *)(data_ov046_0220cd24 + selectorOffset);
    s32 scaledAdjustment = adjustment * 0x30;
    scaledAdjustment += (u32)scaledAdjustment >> 31;
    return base + variant * 0x30 + (scaledAdjustment >> 1);
}

/* Store explicit horizontal and vertical panel origins at +0x10C/+0x110. */
extern "C" void func_ov046_0220c46c(void *panel, s32 x, s32 y)
{
    FIELD(s32, panel, 0x10c) = x;
    FIELD(s32, panel, 0x110) = y;
}

/*
 * Derive both panel origins for `index` through the table helpers and store
 * them at +0x10C/+0x110. The panel changes; no hardware is accessed directly.
 */
extern "C" void func_ov046_0220c478(void *panel, s32 index)
{
    FIELD(s32, panel, 0x10c) = func_ov046_0220c3bc(panel, index);
    FIELD(s32, panel, 0x110) = func_ov046_0220c410(panel, index);
}
