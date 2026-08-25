#include "tingle/types.h"

/* Overlay 17 scene-state callbacks for the panel gate and progress-driven exit. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const s32 data_ov017_02201540[2];
extern const s32 data_ov017_02201550[2];
extern u8 data_ov017_022016e0[];
extern void *gDebugFont;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *, u32);
extern void GameWork_ClearFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void SceneSound_PlayDirectSequence(void *, s32);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern void func_ov017_021fe6dc(void *);
extern void func_ov017_021fe71c(void *);
extern void func_ov017_021fea8c(void *, s32, s32, s32);
extern void func_ov017_021ffcc8(void *, s32, s32, void *);
extern void func_ov017_021ffd74(void *);
extern void func_ov017_02200188(void *);
extern void func_ov017_022008ac(void *);
#ifdef __cplusplus
}
#endif

/*
 * Handle the three-stage panel gate at state +4. Stage 0 refreshes two SDK
 * resources and tests GameWork flag 0x3AA: absent skips to stage 2, present is
 * cleared and opens panel +0x400 with setting 8. Stage 1 polls the panel using
 * +0x30 and flag bit 5 from +0x20, then destroys it and advances. Stage 2 waits
 * for 0x02002D94, starts the eight-sprite pool, emits scene events 0x4114/0x5C,
 * and installs callback data_ov017_02201540. Always run final renderer helper
 * 0x022008AC and return zero. Scene, GameWork, heap, audio/event, and SDK state
 * may change; no direct hardware access occurs here.
 */
extern "C" s32 func_ov017_02200ab0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        if (!GameWork_TestFlag(gGameWork, 0x3aa)) {
            FIELD(s32, state, 4) = 2;
            FIELD(s32, state, 8) = 0;
        } else {
            GameWork_ClearFlag(gGameWork, 0x3aa);
            func_ov017_021ffcc8(state, 8, 1, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 1:
        if (ModalState_UpdateInput(FIELD(void *, state, 0x400),
                           (u8 *)state + 0x30,
                           (FIELD(u32, state, 0x20) & 0x20) != 0) >= 0) {
            func_ov017_021ffd74(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            func_ov017_021fe6dc(FIELD(void *, state, 0x254));
            SceneSound_PlayPackedEffect(state, 0x4114);
            SceneSound_PlayDirectSequence(state, 0x5c);
            func_ov017_021fea8c(state, data_ov017_02201540[0],
                                data_ov017_02201540[1], 0);
        }
        break;
    }
    func_ov017_022008ac(state);
    return 0;
}

/*
 * Progress-driven exit callback. While state +4 is zero, increment overlay-
 * global progress +0. Trigger the exit once it reaches global limit +8 or when
 * global +0x80 is clear: collapse the eight-sprite pool, emit event 0x4114 and
 * optional 0x4115 when +0x440 is non-null, then install callback data at
 * 0x02201550. Always run the main update and final renderer helpers and return
 * zero. Scene, audio/event, sprite, and SDK state change; no direct MMIO occurs.
 */
extern "C" s32 func_ov017_02200c20(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        s32 progress = ++FIELD(s32, data_ov017_022016e0, 0);
        if (progress >= FIELD(s32, data_ov017_022016e0, 8) ||
            FIELD(s32, data_ov017_022016e0, 0x80) == 0) {
            func_ov017_021fe71c(FIELD(void *, state, 0x254));
            SceneSound_StopPackedEffect(state, 0x4114);
            if (FIELD(void *, state, 0x440) != 0) {
                SceneSound_StopPackedEffect(state, 0x4115);
            }
            func_ov017_021fea8c(state, data_ov017_02201550[0],
                                data_ov017_02201550[1], 0);
        }
    }
    func_ov017_02200188(state);
    func_ov017_022008ac(state);
    return 0;
}
