#include "tingle/types.h"

/* Overlay 24 selection-state callbacks and main-engine scanline render hooks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_ov024_021fe210[];
extern const s32 data_ov024_021fe250[];
extern const s32 data_ov024_021fe254[];
extern const u32 data_ov024_021fe2c8[];
extern const u32 data_ov024_021fe2d0[];
extern const u32 data_ov024_021fe2d8[];
extern const u32 data_ov024_021fe2f0[];
extern const u32 data_ov024_021fe2f8[];
extern const u32 data_ov024_021fe308[];
extern void *gGameWork;
extern void *gSystemState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02028100(void *, s32);
extern void func_02092260(void *, s32);
extern void func_020922f0(void *, s32);
extern void func_02092314(void *, s32, s32);
extern void IndexedSelectionController_SetValue(void *, s32);
extern void IndexedSelectionController_ResetTransition(void *);
extern void IndexedSelectionController_SnapTransitionOrigin(void *);
extern void IndexedSelectionController_Increment(void *);
extern void IndexedSelectionController_Decrement(void *);
extern s32 IndexedSelectionController_AdvanceTransition(void *);
extern s32 IndexedSelectionController_AdvancePacing(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern s32 func_ov005_021fbdf8(void *, s32, void *);
extern void func_ov024_021fce04(void *, void *, void *);
extern void func_ov024_021fd86c(void *);
extern void func_ov024_021fd8f8(void *, s32);
extern void func_ov024_021fd968(void *);
extern void func_ov024_021fdab0(void *, s32, s32);
extern s32 func_ov024_021fdac4(void *);
extern void func_ov046_0220c1d8(void *);
#ifdef __cplusplus
}
#endif

static void install_pair(void *scene, const u32 *pair)
{
    func_ov024_021fce04(scene, (void *)pair[0], (void *)pair[1]);
}

/*
 * Main map-choice callback. Its first two steps enable and start selector
 * +0x284, then step two handles D-pad navigation, three controller hit-tests,
 * current/alternate overlay-5 menu hits, selection bounds, sounds, persistent
 * game-work choice +0x1DE, and callback/tween transitions. It always performs
 * frame maintenance and returns zero. UI, audio, callback, game-work, and
 * graphics state can change.
 */
extern "C" s32 func_ov024_021fdcdc(void *scene)
{
    s32 step = FIELD(s32, scene, 4);
    if (step == 0) {
        FIELD(s32, FIELD(void *, scene, 0x2bc), 0x158) = 1;
        IndexedSelectionController_ResetTransition((u8 *)scene + 0x284);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        step = 1;
    }
    if (step == 1) {
        if (IndexedSelectionController_AdvancePacing((u8 *)scene + 0x284)) {
            if (FIELD(s32, scene, 0x290) != FIELD(s32, scene, 0x294))
                func_ov024_021fd968(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
            step = 2;
        } else {
            func_ov024_021fd968(scene);
            func_ov024_021fd86c(scene);
            return 0;
        }
    }

    if (step == 2) {
        IndexedSelectionController_SnapTransitionOrigin((u8 *)scene + 0x284);
        u16 keys = *(u16 *)FIELD(void *, scene, 0x2c);
        if ((keys & 0x40) && !(keys & 0x100)) {
            IndexedSelectionController_Increment((u8 *)scene + 0x284);
        } else if ((keys & 0x80) && !(keys & 0x100)) {
            IndexedSelectionController_Decrement((u8 *)scene + 0x284);
        } else if (FIELD(u32, scene, 0x20) & 0x20) {
            if (func_02095860((u8 *)scene + 0x80,
                              (u8 *)scene + 0x30, 0, 4)) {
                func_02092260(scene, 3);
                FIELD(s16, gGameWork, 0x1de) = -1;
                func_02092314(scene, 0x3e, 0x10);
                install_pair(scene, data_ov024_021fe2c8);
            } else if (func_02095860((u8 *)scene + 0x12c,
                                     (u8 *)scene + 0x30, 0, 4)) {
                func_02092260(scene, 0x2e80);
                s32 current = FIELD(s32, scene, 0x290);
                func_ov024_021fdab0(scene,
                    data_ov024_021fe250[current * 2], 30);
                install_pair(scene, data_ov024_021fe308);
            } else if (func_02095860((u8 *)scene + 0x1d8,
                                     (u8 *)scene + 0x30, 0, 4)) {
                func_02092260(scene, 0x2e80);
                s32 current = FIELD(s32, scene, 0x290);
                func_ov024_021fdab0(scene,
                    data_ov024_021fe254[current * 2], 30);
                install_pair(scene, data_ov024_021fe2d8);
            } else {
                s32 current = FIELD(s32, scene, 0x290);
                if (func_ov005_021fbdf8(FIELD(void *, scene, 0x2bc), current,
                                        (u8 *)scene + 0x30)) {
                    if (current > 0) {
                        func_02092260(scene, 0x2e81);
                        func_02092314(scene, 0x3e, 0x20);
                        func_020922f0(scene, 0x39);
                        FIELD(s16, gGameWork, 0x1de) = (s16)current;
                        install_pair(scene, data_ov024_021fe2f8);
                    } else {
                        func_02092260(scene, 9);
                    }
                } else {
                    for (s32 i = 0; i < 11; ++i) {
                        if (i == current) continue;
                        if (!func_ov005_021fbdf8(FIELD(void *, scene, 0x2bc),
                                                i, (u8 *)scene + 0x30))
                            continue;
                        if (i <= FIELD(s32, scene, 0x60)) {
                            func_02092260(scene, 0x2e80);
                            func_ov024_021fdab0(scene, i, 12);
                            install_pair(scene, data_ov024_021fe2d0);
                        } else {
                            func_02092260(scene, 9);
                        }
                        break;
                    }
                }
            }
        }

        if (IndexedSelectionController_AdvanceTransition((u8 *)scene + 0x284)) {
            func_02092260(scene, 0x2e80);
            --FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
    }
    func_ov024_021fd86c(scene);
    return 0;
}

/*
 * Timed-transition callback. It starts elapsed state on step zero, advances
 * func_ov024_021FDAC4 on step one, and on completion applies target marker
 * visibility/selector choice before returning to main callback pair +0x2F0.
 * Every call performs frame maintenance and returns zero.
 */
extern "C" s32 func_ov024_021fe040(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        FIELD(s32, scene, 4) = 1;
        FIELD(s32, scene, 8) = 0;
    }
    if (FIELD(s32, scene, 4) == 1 && func_ov024_021fdac4(scene)) {
        s32 target = FIELD(s32, scene, 0x2f4);
        func_ov024_021fd8f8(scene, target);
        IndexedSelectionController_SetValue((u8 *)scene + 0x284, target);
        install_pair(scene, data_ov024_021fe2f0);
    }
    func_ov024_021fd86c(scene);
    return 0;
}

/* Runs one maintenance frame and returns one to signal callback completion. */
extern "C" s32 func_ov024_021fe0bc(void *scene)
{
    func_ov024_021fd86c(scene);
    return 1;
}

/*
 * Main-engine render callback. While scene flag 0x400 is set, it commits the
 * overlay-46 panel, writes display-mode bits 8..12 from +0x48, and programs
 * four BG horizontal offsets from map displacement +0x2E8 (the middle layers
 * are shifted by 192 and 384). Main-engine MMIO/graphics state change; returns
 * zero.
 */
extern "C" s32 func_ov024_021fe0cc(void *scene)
{
    if (FIELD(u32, scene, 0x20) & 0x400) {
        func_ov046_0220c1d8(FIELD(void *, scene, 0x2c0));
        volatile u32 *main = (volatile u32 *)0x04000000;
        main[0] = (main[0] & ~0x1f00u) | (FIELD(u32, scene, 0x48) << 8);
        s32 offset = FIELD(s32, scene, 0x2e8);
        main[4] = ((u32)offset << 16) & 0x01ff0000;
        main[5] = ((u32)(offset - 0xc0) << 16) & 0x01ff0000;
        main[6] = ((u32)(offset - 0x180) << 16) & 0x01ff0000;
        main[7] = ((u32)offset << 16) & 0x01ff0000;
    }
    return 0;
}

/*
 * HBlank wave callback. While scene flag 0x400 is set and VCOUNT is below 192,
 * it selects one of 32 recovered signed wave samples using VCOUNT, map offset
 * +0x2E8, and system frame phase +0x64, then writes BG3 horizontal/vertical
 * offsets (nine bits each). Main-engine BG3 MMIO changes; returns zero.
 */
extern "C" s32 func_ov024_021fe14c(void *scene)
{
    if (FIELD(u32, scene, 0x20) & 0x400) {
        u16 vcount = *(volatile u16 *)0x04000006;
        if (vcount < 192) {
            s32 offset = FIELD(s32, scene, 0x2e8);
            s32 phase = vcount + offset + (FIELD(s32, gSystemState, 0x64) >> 3);
            s32 wave = data_ov024_021fe210[phase & 31];
            *(volatile u32 *)0x0400001c =
                ((u32)(offset & 0x1ff) << 16) | (u32)(wave & 0x1ff);
        }
    }
    return 0;
}
