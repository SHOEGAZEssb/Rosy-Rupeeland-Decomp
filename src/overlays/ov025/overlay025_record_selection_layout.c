#include "tingle/types.h"

/* Overlay 25 saved-record row layout update for the current title selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov025_021fd9e4(void *, s32);
extern void func_ov025_021fdb18(void *, s32);
extern s32 func_ov025_021fdc4c(void *);
extern void func_ov025_02200498(void *, s32);
extern void func_ov025_02200564(void *);
#ifdef __cplusplus
}
#endif

/*
 * Store `selected` at scene +0x54, raise its row by 16 pixels, and lower the
 * other two rows. An inactive selected record hides all choice controllers;
 * an active record rebuilds their layout for its index. Repeating the indexed
 * row expression in the two branches preserves retail MWCC's common hoist.
 */
extern "C" void func_ov025_02200648(void *scene, s32 selected)
{
    FIELD(s32, scene, 0x54) = selected;
    for (s32 i = 0; i < 3; ++i) {
        if (i == FIELD(s32, scene, 0x54))
            func_ov025_021fd9e4(FIELD(void *, (u32)scene + (i << 2), 0xe4), 0x10);
        else
            func_ov025_021fdb18(FIELD(void *, (u32)scene + (i << 2), 0xe4), 0);
    }
    if (func_ov025_021fdc4c(FIELD(void *, (u32)scene + (selected << 2), 0xe4)))
        func_ov025_02200564(scene);
    else
        func_ov025_02200498(scene, selected);
}
