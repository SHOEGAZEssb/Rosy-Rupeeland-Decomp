#include "tingle/types.h"

/* Overlay 24 per-frame maintenance, marker visibility, and selection tweening. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov024_021fe1e4[];
extern const s32 data_ov024_021fe250[];
extern const s32 data_ov024_021fe254[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AreaInfoPanelPresentation_ShowIndex(void *, s32);
extern void AreaInfoPanelPresentation_Hide(void *);
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void func_020958d8(void *);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_ov005_021fbd64(void *, s32, s32);
extern void func_ov005_021fbd74(void *, s32);
extern void func_ov005_021fbbe8(void *);
extern void func_ov024_021fd8f8(void *, s32);
extern void func_ov046_0220bffc(void *, s32, s32, s32);
extern void func_ov046_0220c1a4(void *);
extern s32 func_ov046_0220c3bc(void *, s32);
extern s32 func_ov046_0220c410(void *, s32);
extern void func_ov046_0220c46c(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Performs frame maintenance for all three controllers, the overlay-46 panel,
 * overlay-5 menu, cloned sprite owner, and transition +0x2C8. Whenever the
 * transition reports phase 2 complete, it restarts at 60 ticks, toggles debug
 * display flag +0x2E4, and shows/updates or hides debug object +0x2C4. UI,
 * graphics, and transition state change; no value is returned.
 */
extern "C" void func_ov024_021fd86c(void *scene)
{
    func_020958d8((u8 *)scene + 0x80);
    func_020958d8((u8 *)scene + 0x12c);
    func_020958d8((u8 *)scene + 0x1d8);
    func_ov046_0220c1a4(FIELD(void *, scene, 0x2c0));
    func_ov005_021fbbe8(FIELD(void *, scene, 0x2bc));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0x7c));
    if (func_02091c7c((u8 *)scene + 0x2c8, 2)) {
        func_02091b98((u8 *)scene + 0x2c8, 60);
        FIELD(s32, scene, 0x2e4) = !FIELD(s32, scene, 0x2e4);
        if (FIELD(s32, scene, 0x2e4))
            AreaInfoPanelPresentation_ShowIndex(FIELD(void *, scene, 0x2c4),
                          FIELD(s32, scene, 0x290));
        else
            AreaInfoPanelPresentation_Hide(FIELD(void *, scene, 0x2c4));
    }
}

/*
 * Applies the two marker-visibility table entries for `selection`. The upper
 * marker is hidden for negative/out-of-range entries and otherwise shown only
 * when the entry is at most unlocked limit +0x60; the lower marker is shown
 * for every nonnegative table entry. Controller visibility changes; returns
 * void. The +0x250/+0x254 symbols address the two columns of one pair table.
 */
extern "C" void func_ov024_021fd8f8(void *scene, s32 selection)
{
    s32 upper = data_ov024_021fe250[selection * 2];
    if (upper < 0 || upper > FIELD(s32, scene, 0x60))
        func_02095940((u8 *)scene + 0x12c);
    else
        func_02095928((u8 *)scene + 0x12c);

    s32 lower = data_ov024_021fe254[selection * 2];
    if (lower < 0)
        func_02095940((u8 *)scene + 0x1d8);
    else
        func_02095928((u8 *)scene + 0x1d8);
}

/*
 * Interpolates the overlay-46 panel coordinates and overlay-5 map displacement
 * from previous selection +0x294 to current +0x290 using tween progress
 * +0x2A8/+0x2AC. Display-mode bits +0x48 are chosen from the interpolated
 * displacement. At the tween midpoint it commits marker visibility, debug,
 * panel, and menu selection, then restarts the 120-tick debug transition.
 * UI/graphics state change; no value is returned.
 */
extern "C" void func_ov024_021fd968(void *scene)
{
    s32 old_selection = FIELD(s32, scene, 0x294);
    s32 selection = FIELD(s32, scene, 0x290);
    void *panel = FIELD(void *, scene, 0x2c0);
    s32 old_x = func_ov046_0220c3bc(panel, old_selection);
    s32 old_y = func_ov046_0220c410(panel, old_selection);
    s32 new_x = func_ov046_0220c3bc(panel, selection);
    s32 new_y = func_ov046_0220c410(panel, selection);
    s32 progress = FIELD(s32, scene, 0x2a8);
    s32 duration = FIELD(s32, scene, 0x2ac);
    s32 x = Presentation_InterpolateLinear(old_x, new_x, progress, duration);
    s32 y = Presentation_InterpolateLinear(old_y, new_y, progress, duration);
    func_ov046_0220c46c(panel, x, y);

    FIELD(s32, scene, 0x2e8) = Presentation_InterpolateLinear(
        data_ov024_021fe1e4[old_selection],
        data_ov024_021fe1e4[selection], progress, duration);
    func_ov005_021fbd64(FIELD(void *, scene, 0x2bc), 0,
                        -FIELD(s32, scene, 0x2e8));
    FIELD(u32, scene, 0x48) |= 7;
    if (FIELD(s32, scene, 0x2e8) < 0xc0)
        FIELD(u32, scene, 0x48) &= ~4u;
    else
        FIELD(u32, scene, 0x48) &= ~1u;

    if (progress == (duration + (u32)duration / 0x80000000u) / 2) {
        func_ov024_021fd8f8(scene, selection);
        AreaInfoPanelPresentation_ShowIndex(FIELD(void *, scene, 0x2c4), selection);
        func_ov046_0220bffc(panel, selection, 0, 0);
        func_ov005_021fbd74(FIELD(void *, scene, 0x2bc), selection);
        func_02091b98((u8 *)scene + 0x2c8, 120);
        FIELD(s32, scene, 0x2e4) = 1;
    }
}
