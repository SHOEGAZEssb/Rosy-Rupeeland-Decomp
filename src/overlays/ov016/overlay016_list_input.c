#include "tingle/types.h"

/* Overlay 16 list hit testing, selected-descriptor access, and scroll completion. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32, s32);
extern void func_ov016_021fd270(void *, s32);
extern void func_ov016_021fd310(void *, s32);
extern void func_ov016_021fd3f8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Hit-test point words +4/+8 against the list rectangle x=0x40..0xC0 and
 * y=0x18..0x90. Convert the vertical offset into one of five 0x18-pixel rows,
 * add the presentation's first visible index +0x0C, and return that descriptor
 * index when below count +0x54; otherwise return -1. State is read only and no
 * hardware or SDK side effects occur beyond the signed division helper.
 */
extern "C" s32 func_ov016_021fd5b8(void *state, const void *point)
{
    s32 x = FIELD(s32, point, 4) - 0x40;
    s32 y = FIELD(s32, point, 8) - 0x18;
    s32 row;
    s32 index;

    if (x < 0 || x > 0x80 || y < 0 || y > 0x78) {
        return -1;
    }
    row = func_020befec(y, 0x18);
    if (row >= 5) {
        row = 4;
    }
    index = row + FIELD(s32, FIELD(void *, state, 0x58), 0xc);
    return index < FIELD(s32, state, 0x54) ? index : -1;
}

/*
 * Return the 0x14-byte descriptor selected by presentation field +0x14, using
 * storage +0x4C. The function performs no bounds check, changes no state, and
 * has no SDK or hardware effects.
 */
extern "C" void *func_ov016_021fd628(void *state)
{
    return (u8 *)FIELD(void *, state, 0x4c) +
           FIELD(s32, FIELD(void *, state, 0x58), 0x14) * 0x14;
}

/*
 * Wait until presentation field +0x30 equals half of signed field +0x2C. Return
 * zero until that condition holds. Once it holds, if visible start +0x0C differs
 * from target +0x10, reposition child +4, destroy outgoing row +0x74, create
 * incoming row +0x70, and redraw the list. Return one after the equality test
 * succeeds. Presentation and row graphics may change; there is no direct MMIO.
 */
extern "C" s32 func_ov016_021fd640(void *state)
{
    void *presentation = FIELD(void *, state, 0x58);
    s32 distance = FIELD(s32, presentation, 0x2c);

    if (FIELD(s32, presentation, 0x30) != distance / 2) {
        return 0;
    }
    if (FIELD(s32, presentation, 0xc) != FIELD(s32, presentation, 0x10)) {
        FIELD(s32, FIELD(void *, state, 4), 0x1c) =
            0x20 - FIELD(s32, presentation, 0xc) * 0x18;
        func_ov016_021fd310(state, FIELD(s32, presentation, 0x74));
        func_ov016_021fd270(state, FIELD(s32, presentation, 0x70));
        func_ov016_021fd3f8(state);
    }
    return 1;
}
