#include "tingle/types.h"

/* Overlay 31 intro-wave, interaction, and terminal scene state handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern void *gDebugFont;
extern const s32 data_ov031_021fe6f8[];
extern const s32 data_ov031_021fe700[];
extern const s32 data_ov031_021fe708[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov031_021fe17c(void *);
extern void func_ov031_021fce98(void *);
extern void func_ov031_021fce84(void *, s32, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void func_ov031_021fe1a8(void *);
extern s32 GameWork_TestFlag(void *, s32);
extern void GameWork_SetFlag(void *, s32);
extern void func_ov031_021fdd04(void *, s32);
extern void func_ov031_021fd934(void *, s32, s32);
extern void func_ov031_021fdf20(void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void func_ov031_021fd5c0(void *);
extern s32 func_ov031_021fddbc(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern s32 func_ov031_021fd7fc(void *);
#ifdef __cplusplus
}
#endif

/* Services status sprite, renderer, and child effect common to all states. */
static void service_scene(void *scene)
{
    func_ov031_021fdf20(scene, 0);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0x58));
    func_ov031_021fd5c0(FIELD(void *, scene, 0x548));
}

/*
 * Intro/wave state handler. State 0 enables an eight-frame waveform fade and
 * falls through. State 1 generates frames until progress +0x544 reaches target
 * +0x540. State 2 continues for 60 frames, then switches to mode-2 fade-out.
 * State 3 waits for the progress target while generating, then selects scene
 * transition 0x6F and installs post-wave graphics. State 4 chooses dialog by
 * variant +0x54: variants 0/1 use one-time GameWork flags 0x38C/0x38D to choose
 * messages 0x1F vs 0x24 and 0x20 vs 0x25; variants 2/3 use 0x1D/0x26. It then
 * targets coordinates 0x021FE6F8. Always services common rendering and returns
 * zero; waveform, persistent flags, dialog, graphics, and scene state change.
 */
extern "C" s32 func_ov031_021fe28c(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov031_021fe17c(scene);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Intentional recovered fallthrough. */
    case 1:
        if (FIELD(s32, scene, 0x544) >= FIELD(s32, scene, 0x540)) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        } else {
            func_ov031_021fce98((u8 *)scene + 0xa4);
        }
        break;
    case 2:
        if (++FIELD(s32, scene, 8) > 60) {
            func_ov031_021fce84((u8 *)scene + 0xa4, 2, 8);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        } else {
            func_ov031_021fce98((u8 *)scene + 0xa4);
        }
        break;
    case 3:
        if (FIELD(s32, scene, 0x544) >= FIELD(s32, scene, 0x540)) {
            SceneSound_PlayPackedEffect(scene, 0x6f);
            func_ov031_021fe1a8(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        } else {
            func_ov031_021fce98((u8 *)scene + 0xa4);
        }
        break;
    case 4: {
        s32 variant = FIELD(s32, scene, 0x54);
        if (variant == 0) {
            if (GameWork_TestFlag(gGameWork, 0x38c) != 0)
                func_ov031_021fdd04(scene, 0x24);
            else {
                GameWork_SetFlag(gGameWork, 0x38c);
                func_ov031_021fdd04(scene, 0x1f);
            }
        } else if (variant == 1) {
            if (GameWork_TestFlag(gGameWork, 0x38d) != 0)
                func_ov031_021fdd04(scene, 0x25);
            else {
                GameWork_SetFlag(gGameWork, 0x38d);
                func_ov031_021fdd04(scene, 0x20);
            }
        } else if (variant == 2)
            func_ov031_021fdd04(scene, 0x1d);
        else if (variant == 3)
            func_ov031_021fdd04(scene, 0x26);
        func_ov031_021fd934(scene, data_ov031_021fe6f8[0],
                            data_ov031_021fe6f8[1]);
        break;
    }
    }
    service_scene(scene);
    return 0;
}

/*
 * Dialog/child-effect interaction handler. State 0 waits for dialog completion;
 * variant 2 then clears display bit 2 and advances locally, while other variants
 * select scene transition 0x3A and coordinates 0x021FE700. State 1 advances child
 * effect +0x548 until complete, sets display bit 2, opens message 0x1E, and moves
 * to state 2. State 2 waits for that dialog, then selects transition 0x3A and
 * coordinates 0x021FE708. Always services common rendering and returns zero;
 * dialog, child effect, debug-font canvas, display bits, and scene state change.
 */
extern "C" s32 func_ov031_021fe4ac(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        if (func_ov031_021fddbc(scene) != 0) {
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            if (FIELD(s32, scene, 0x54) == 2) {
                FIELD(u32, scene, 0x4c) &= ~4;
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            } else {
                SceneSound_PlayPackedEffect(scene, 0x3a);
                func_ov031_021fd934(scene, data_ov031_021fe700[0],
                                    data_ov031_021fe700[1]);
            }
        }
        break;
    case 1:
        if (func_ov031_021fd7fc(FIELD(void *, scene, 0x548)) != 0) {
            FIELD(u32, scene, 0x4c) |= 4;
            func_ov031_021fdd04(scene, 0x1e);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2:
        if (func_ov031_021fddbc(scene) != 0) {
            SceneSound_PlayPackedEffect(scene, 0x3a);
            func_ov031_021fd934(scene, data_ov031_021fe708[0],
                                data_ov031_021fe708[1]);
        }
        break;
    }
    service_scene(scene);
    return 0;
}

/*
 * Terminal callback: services status sprite, renderer, and child effect once,
 * then returns 1. Graphics, animation, and child state may change.
 */
extern "C" s32 func_ov031_021fe5d4(void *scene)
{
    service_scene(scene);
    return 1;
}
