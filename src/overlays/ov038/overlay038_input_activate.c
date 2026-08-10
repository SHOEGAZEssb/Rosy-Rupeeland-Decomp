#include "tingle/types.h"

/*
 * Overlay 38 touch-row hit testing and initial activation. These recovered
 * helpers map input coordinates into the visible list and populate the panel,
 * label, renderer, transition, and callback state when the view first opens.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void *gDebugFont;
extern const u32 data_ov038_021fdce0[];
extern const u32 data_ov038_021fdcc8[];
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *renderer);
extern void func_ov038_021fd40c(void *presentation);
extern s32 func_ov038_021fd508(void *presentation);
extern u32 func_ov038_021fd540(void *presentation);
extern void func_02028100(void *label, s32 value);
extern s32 func_ov046_0220c3bc(void *panel, s32 value);
extern s32 func_ov046_0220c410(void *panel, s32 value);
extern void func_ov046_0220c46c(void *panel, s32 first, s32 second);
extern void func_ov046_0220bffc(void *panel, s32 primary, s32 enabled,
                                u32 secondary);
extern void func_ov038_021fd624(void *presentation);
extern void func_ov038_021fce04(void *node, u32 first, u32 second);
#ifdef __cplusplus
}
#endif

/*
 * Translate input coordinates at +0x34/+0x38 into a row in the rectangle
 * x=16..216, y=24..144. Rows are 24 pixels high; any quotient at least five
 * is clamped to four. Add the model's visible-window origin +0x0C and reject
 * results outside filtered count +0x110. Returns the filtered-list index or
 * -1, with no state changes. The coordinate field ownership is inferred from
 * their use as bounds-checked values.
 */
extern "C" s32 func_ov038_021fd670(void *presentation)
{
    s32 rowPixels = FIELD(s32, presentation, 0x38) - 24;
    s32 x = FIELD(s32, presentation, 0x34) - 16;
    if (x < 0 || x > 200 || rowPixels < 0 || rowPixels > 120) {
        return -1;
    }
    s32 row = func_020befec(rowPixels, 24);
    if (row >= 5) {
        row = 4;
    }
    row += FIELD(s32, FIELD(void *, presentation, 0x314), 0x0c);
    return row >= FIELD(s32, presentation, 0x110) ? -1 : row;
}

/*
 * On the first callback phase (+4 equals zero), initialize the active view.
 * For a nonempty list, reset the shared and debug-font renderers, draw rows,
 * update the label, derive/install panel values from the selected record,
 * apply its secondary halfword, and reset transition state. Both empty and
 * populated paths set bit zero of +0x20 and install an address-derived node
 * pair through func_ov038_021fce04; the pair differs by list emptiness. Later
 * phases do nothing. Always returns zero; UI, renderer, timer, and node state
 * may change.
 */
extern "C" s32 func_ov038_021fd6e0(void *presentation)
{
    if (FIELD(s32, presentation, 4) != 0) {
        return 0;
    }
    if (FIELD(s32, presentation, 0x110) != 0) {
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        func_ov038_021fd40c(presentation);
        s32 primary = func_ov038_021fd508(presentation);
        func_02028100(FIELD(void *, presentation, 0x344), primary);
        s32 first = func_ov046_0220c3bc(FIELD(void *, presentation, 0x340),
                                        primary);
        s32 second = func_ov046_0220c410(FIELD(void *, presentation, 0x340),
                                         primary);
        func_ov046_0220c46c(FIELD(void *, presentation, 0x340), first, second);
        primary = func_ov038_021fd508(presentation);
        func_ov046_0220bffc(FIELD(void *, presentation, 0x340), primary, 1,
                            func_ov038_021fd540(presentation));
        func_ov038_021fd624(presentation);
        FIELD(u32, presentation, 0x20) |= 1;
        func_ov038_021fce04(presentation, data_ov038_021fdce0[0],
                            data_ov038_021fdce0[1]);
    } else {
        FIELD(u32, presentation, 0x20) |= 1;
        func_ov038_021fce04(presentation, data_ov038_021fdcc8[0],
                            data_ov038_021fdcc8[1]);
    }
    return 0;
}
