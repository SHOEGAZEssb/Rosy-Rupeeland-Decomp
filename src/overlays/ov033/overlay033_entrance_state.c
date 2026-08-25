#include "tingle/types.h"

/* Overlay 33 entrance interpolation state and callback handoff. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov033_021fdd00[];

#ifdef __cplusplus
extern "C" {
#endif
extern void DisplayBrightness_StartMaskedTransitions(s32 first, s32 second);
extern void func_02091bac(void *interpolator, s32 mode, s32 start,
                         s32 end, s32 duration);
extern s32 func_02091c7c(void *interpolator, s32 advance);
extern s32 func_02091cf0(void *interpolator);
extern void func_ov033_021fd04c(void *scene, s32 callbackWord,
                               s32 adjustmentWord);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *spriteContext);
#ifdef __cplusplus
}
#endif

/*
 * Runs the two-state entrance animation selected by scene +0xD0. State zero
 * starts three 90-frame interpolators: the primary object's height moves to
 * current+0x40000, sprite-group +0x12C moves from 0x2000 to zero, and group
 * +0x130 moves from -8 to zero. State one advances them, writes their values
 * to primary +0x24 and group +0x12C/+0x130, then clears +0x12C and installs the
 * callback pair at 0x021FDD00 when the first interpolator completes. Every call
 * updates the sprite context and returns 0. Animation, object, sprite, and
 * callback state change; no direct MMIO occurs.
 */
extern "C" s32 func_ov033_021fd624(void *scene)
{
    s32 state = FIELD(s32, scene, 0xd0);
    if (state == 0) {
        DisplayBrightness_StartMaskedTransitions(3, 0);
        void *primary = FIELD(void *, scene, 4);
        func_02091bac((u8 *)scene + 0x4c, 2,
                      FIELD(s32, primary, 0x24) + 0x40000, 0, 0x5a);
        func_02091bac((u8 *)scene + 0x68, 2, 0x2000, 0, 0x5a);
        func_02091bac((u8 *)scene + 0x84, 1, -8, 0, 0x5a);
        FIELD(s32, scene, 0xd0) = 1;
        state = 1;
    }

    if (state == 1) {
        FIELD(s32, FIELD(void *, scene, 4), 0x24) =
            func_02091c7c((u8 *)scene + 0x4c, 1);
        void *group = FIELD(void *, scene, 0x48);
        FIELD(s32, group, 0x12c) = func_02091c7c((u8 *)scene + 0x68, 1);
        FIELD(s32, group, 0x130) = func_02091c7c((u8 *)scene + 0x84, 1);
        if (func_02091cf0((u8 *)scene + 0x4c)) {
            FIELD(s32, group, 0x12c) = 0;
            func_ov033_021fd04c(scene, data_ov033_021fdd00[0],
                               data_ov033_021fdd00[1]);
        }
    }

    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0));
    return 0;
}
