#include "tingle/types.h"

/* Overlay 25 choice-row controller layout helper not yet selected for matching. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov025_02202ccc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095820(void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095988(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Applies one of three recovered y-coordinate triplets selected by `layout` to
 * controller array +0x2F4, fixes x=212, selects animations 32/34/36, and shows
 * all controllers. Controller position/animation/visibility change.
 */
extern "C" void func_ov025_02200498(void *scene, s32 layout)
{
    const s32 *positions = data_ov025_02202ccc + layout * 3;
    for (s32 i = 0; i < 3; ++i) {
        void *controller = (u8 *)scene + 0x2f4 + i * 0xac;
        func_02095820(controller, 0xd4, (s16)positions[i]);
        func_02095988(controller, 0x20 + i * 2);
        func_02095928(controller);
    }
}
