#include "tingle/types.h"

/* Overlay 21 secondary-selection screen, commit path, and shared panel restoration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u32 data_ov021_02202d38[];
extern const u32 data_ov021_02202d50[];
extern const u32 data_ov021_02202d60[];
extern const u32 data_ov021_02202d78[];
extern const u32 data_ov021_02202d80[];
extern const u32 data_ov021_02202d88[];
extern const u32 data_ov021_02202d98[];
extern const u32 data_ov021_02202da0[];
extern const u32 data_ov021_02202da8[];
extern const u32 data_ov021_02202db8[];
extern const u32 data_ov021_02202dc0[];
extern const u32 data_ov021_02202dc8[];
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern void func_02062ca8(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void SpriteMotionController_Show(void *);
extern void func_ov001_021fc1f0(void *);
extern s32 func_ov001_021fc214(void *);
extern s32 func_ov001_021fc240(void *);
extern s32 func_ov001_021fc250(void *);
extern s32 func_ov001_021fc2e4(void *);
extern s32 func_ov001_021fc310(void *);
extern s32 func_ov001_021fc320(void *);
extern s32 func_ov001_021fc3c4(void *, void *);
extern s32 func_ov001_021fc3ec(void *, void *);
extern void func_ov001_021fc644(void *);
extern void func_ov001_021fc758(void *, s32);
extern void *func_ov001_021fc7e4(void *);
extern s32 func_ov001_021fcae0(void *, s32);
extern s32 func_ov001_021fcbf0(void *, void *);
extern s32 func_ov001_021fc0ac(void *, void *);
extern s32 func_ov001_021fcb60(void *, void *);
extern s32 func_ov001_021fcc44(void *, void *);
extern void func_ov021_021fd7c0(void *, u32, u32);
extern void Overlay021_SetupMainBackground(void *);
extern void func_ov021_021fe390(void *);
extern void Overlay021_RefreshSelectionBackground(void *);
extern void func_ov021_021fe8e8(void *);
extern void func_ov021_021fea68(void *);
extern s32 func_ov021_021feae4(void *);
extern void func_ov021_021feb60(void *);
extern void func_ov021_021fecd0(void *);
extern void func_ov021_021feea4(void *);
extern void func_ov021_021fefcc(void *);
extern void func_ov021_021ff0e0(void *, s32);
extern s32 func_ov021_021ff274(void *);
extern u32 Overlay021Descriptor_GetFlags16_19(const void *);
extern s32 func_ov021_021ff62c(void *, s32);
extern void func_ov021_021ff644(void *);
extern s32 func_ov021_021ffa10(const void *);
extern s32 func_ov045_0220b924(void *, s32, s32, s32);
extern s32 func_ov045_0220b9b8(void *);
#ifdef __cplusplus
}
#endif

static void change_state(void *state, const u32 *next)
{
    func_ov021_021fd7c0(state, next[0], next[1]);
}

/*
 * Runs secondary widget +0x358. This mirrors the primary handler at
 * 0x02201410 with the overlay-1 widget API and row field +0x1AC. It opens and
 * closes the widget, processes navigation/cancel/alternate actions, resolves a
 * confirmed entry into +0x380/+0x2BC, records category-1 row/ID fields, and
 * routes by descriptor category. Input is the overlay state; UI, audio, and
 * transition state change. The return value is always zero.
 */
extern "C" s32 func_ov021_02201ba8(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        func_ov001_021fc1f0(FIELD(void *, state, 0x358));
        func_ov021_021ff644(state);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 1:
        if (func_ov001_021fc240(FIELD(void *, state, 0x358)) != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov001_021fc250(FIELD(void *, state, 0x358)) != 0) {
            func_ov021_021ff644(state);
        }
        break;
    case 2: {
        void *widget = FIELD(void *, state, 0x358);
        void *input = (u8 *)state + 0x30;
        if (func_ov001_021fcae0(widget, FIELD(s32, state, 0x2c)) == 0 &&
            (FIELD(u32, state, 0x20) & 0x10) != 0 &&
            func_ov001_021fcbf0(widget, input) == 0 &&
            (FIELD(u32, state, 0x20) & 0x20) != 0) {
            s32 row = func_ov001_021fc0ac(widget, input);
            if (func_ov001_021fcb60(widget, input) == 0) {
                if (func_ov001_021fcc44(widget, input) != 0) {
                    change_state(state, data_ov021_02202dc8);
                    break;
                }
                if (row >= 0) {
                    SceneSound_PlayPackedEffect(state, 0);
                    if (row != FIELD(s32, widget, 0x1ac)) {
                        func_ov001_021fc758(widget, row);
                        func_ov001_021fc644(widget);
                        func_ov021_021ff644(state);
                    }
                    break;
                }
                if (func_ov001_021fc3c4(widget, input) != 0) {
                    TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                    SceneSound_PlayPackedEffect(state, 3);
                    change_state(state, data_ov021_02202dc0);
                    break;
                }
                if (func_ov001_021fc3ec(widget, input) != 0) {
                    if (func_ov021_021feae4(state) != 0) {
                        TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                        SceneSound_PlayPackedEffect(state, 11);
                        change_state(state, data_ov021_02202db8);
                    } else {
                        SceneSound_PlayPackedEffect(state, 9);
                    }
                    break;
                }
                void *controller = (u8 *)state + 0x14c +
                                   FIELD(s32, state, 0x2c4) * 0xac;
                if (SpriteMotionController_BeginHitResponse(controller, input, 0, 4) != 0) {
                    void *entry = func_ov001_021fc7e4(widget);
                    if (func_ov021_021ff62c(entry, 1) == 0) {
                        FIELD(void *, state, 0x380) = FIELD(void *, entry, 0xc);
                        void *selected = FIELD(void *, state, 0x380);
                        if (selected != 0 && FIELD(void *, selected, 0xc) != 0) {
                            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                            SceneSound_PlayPackedEffect(state, 2);
                            FIELD(void *, state, 0x2bc) = FIELD(void *, selected, 0xc);
                            u32 category = Overlay021Descriptor_GetFlags16_19(
                                FIELD(void *, state, 0x2bc));
                            if (category == 1) {
                                FIELD(s32, state, 0x374) = FIELD(s32, widget, 0x1ac);
                                FIELD(u32, state, 0x378) = FIELD(u16, selected, 0);
                                DisplayBrightness_StartMaskedTransitions(1, -16);
                                change_state(state, data_ov021_02202d60);
                            } else if (category == 0) {
                                change_state(state, data_ov021_02202da8);
                            } else {
                                change_state(state, data_ov021_02202da0);
                            }
                            break;
                        }
                    }
                    SceneSound_PlayPackedEffect(state, 9);
                    break;
                }
            }
        }
        if (func_ov001_021fc214(widget) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov001_021fc2e4(widget) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    case 3:
        if (func_ov001_021fc310(FIELD(void *, state, 0x358)) != 0) {
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov001_021fc320(FIELD(void *, state, 0x358)) != 0) {
            func_ov021_021ff644(state);
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Commits a successful secondary selection. It decrements the chosen entry,
 * credits descriptor +8 currency through animation +0x3EC, destroys +0x380,
 * and either transitions immediately or displays message 6. After the dialog
 * and 60-frame delay it resets text, starts transition -16, closes the
 * secondary panel, and routes via 0x02202D50. It changes persistent currency
 * and UI state and always returns zero.
 */
extern "C" s32 func_ov021_02201f98(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0: {
        void *entry = func_ov001_021fc7e4(FIELD(void *, state, 0x358));
        FIELD(s32, entry, 0x1c)--;
        if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
            FIELD(s32, state, 0x3d8) = 1;
        s32 gain = FIELD(s32, FIELD(void *, state, 0x2bc), 8);
        s32 anim = func_ov045_0220b924(FIELD(void *, state, 0x3ec),
                                       GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud), gain, 0);
        GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, gain, anim);
        func_02062ca8(FIELD(void *, state, 0x380));
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through into animation completion. */
    }
    case 1:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0) {
            void *selected = FIELD(void *, state, 0x380);
            if (FIELD(u16, selected, 4) == 0 || FIELD(s32, state, 0x3d8) != 0) {
                DisplayBrightness_StartMaskedTransitions(1, -8);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                FIELD(void *, state, 0x380) = 0;
                func_ov021_021ff0e0(state, 6);
                change_state(state, data_ov021_02202d98);
            }
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov021_021ff0e0(state, 6);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (func_ov021_021ff274(state) != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 4:
        if (++FIELD(s32, state, 8) > 60) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            DisplayBrightness_StartMaskedTransitions(1, -16);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 5:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov021_021fecd0(state);
            change_state(state, data_ov021_02202d50);
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Tears down both category panels and returns to the base list. After waiting
 * for transition -16 it closes +0x354/+0x358, restores graphics, hides both
 * marker sprites and display bit 1, resets controller +0xA0, rebuilds the base
 * prompt, starts transition (1,0), then routes through 0x02202D88. Input state
 * and graphics/UI state change; the function always returns zero.
 */
extern "C" s32 func_ov021_02202194(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -16);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov021_021fea68(state);
            func_ov021_021fecd0(state);
            Overlay021_SetupMainBackground(state);
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            FIELD(u32, state, 0x48) &= ~2U;
            FIELD(u16, FIELD(void *, state, 0x98), 0x24) |= 4;
            FIELD(u16, FIELD(void *, state, 0x9c), 0x24) |= 4;
            SpriteMotionController_Show((u8 *)state + 0xa0);
            func_ov021_021fefcc(state);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            change_state(state, data_ov021_02202d88);
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Reopens whichever category panel exists after an interstitial state. It
 * waits for transition -16, commits font state, closes the active panel and
 * reconstructs its counterpart resources, applies the corresponding graphics
 * mode, opens message 2, starts transition (1,0), then routes to the primary or
 * secondary input handler. It changes UI/graphics state and returns zero.
 */
extern "C" s32 func_ov021_022022a4(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -16);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            if (FIELD(void *, state, 0x354) != 0) {
                func_ov021_021fea68(state);
                func_ov021_021feb60(state);
            } else {
                func_ov021_021fecd0(state);
                func_ov021_021fe8e8(state);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (FIELD(void *, state, 0x354) != 0)
            func_ov021_021fe390(state);
        else
            Overlay021_RefreshSelectionBackground(state);
        func_ov021_021ff0e0(state, 2);
        DisplayBrightness_StartMaskedTransitions(1, 0);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            change_state(state, FIELD(void *, state, 0x354) != 0
                                    ? data_ov021_02202d80
                                    : data_ov021_02202d78);
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}
