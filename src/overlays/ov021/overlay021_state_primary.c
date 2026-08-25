#include "tingle/types.h"

/* Overlay 21 primary-selection screen and its successful-selection transition. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u32 data_ov021_02202d30[];
extern const u32 data_ov021_02202dd0[];
extern const u32 data_ov021_02202dd8[];
extern const u32 data_ov021_02202de0[];
extern const u32 data_ov021_02202de8[];
extern const u32 data_ov021_02202df0[];
extern const u32 data_ov021_02202df8[];
extern const u32 data_ov021_02202e00[];
extern const u32 data_ov021_02202e08[];
extern void *gGameWork;
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern void GameWork_SetFlag(void *, u32);
extern s32 GameWork_TestFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern s32 ActorDescriptor_IsInvalid(void *);
extern void func_02062ca8(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void SpriteMotionController_Hide(void *);
extern void func_ov000_021fc3f8(void *);
extern s32 func_ov000_021fc450(void *);
extern s32 func_ov000_021fc460(void *);
extern s32 func_ov000_021fc424(void *);
extern s32 func_ov000_021fc4fc(void *);
extern s32 func_ov000_021fc528(void *);
extern s32 func_ov000_021fc538(void *);
extern s32 func_ov000_021fc5ac(void *, void *);
extern s32 func_ov000_021fc5fc(void *, void *);
extern void func_ov000_021fc714(void *);
extern void func_ov000_021fc9d4(void *);
extern void func_ov000_021fca4c(void *, s32);
extern void *Overlay000_GetActiveMetadata(void *);
extern s32 func_ov000_021fcb98(void *, s32);
extern s32 func_ov000_021fc298(void *, void *);
extern s32 func_ov000_021fcca8(void *, void *);
extern s32 func_ov000_021fcc18(void *, void *);
extern s32 func_ov000_021fccfc(void *, void *);
extern void func_ov021_021fd7c0(void *, u32, u32);
extern void Overlay021_RefreshSelectionBackground(void *);
extern void func_ov021_021fea68(void *);
extern s32 Overlay021_IsAuxiliaryRecordAvailable(void *);
extern void func_ov021_021feea4(void *);
extern void func_ov021_021feb60(void *);
extern void func_ov021_021ff050(void *, s32);
extern void func_ov021_021ff0e0(void *, s32);
extern s32 func_ov021_021ff274(void *);
extern u32 Overlay021Descriptor_GetFlags16_19(const void *);
extern void func_ov021_021ff5b8(void *);
extern s32 func_ov021_021ff62c(void *, s32);
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
 * Runs the primary +0x354 selection widget. It opens/closes the widget around
 * states 0, 1, and 3, consumes controller +0x30 while state 2 is interactive,
 * changes the highlighted row, handles cancel/alternate commands, and resolves
 * a confirmed row into descriptor +0x2BC and routes based on its category.
 * Category 1 also records the current row at +0x374, the selected halfword at
 * +0x378, and starts transition (1,-16). Input is the overlay state; widget,
 * audio, dialog, and transition state change. It always returns zero.
 */
extern "C" s32 func_ov021_02201410(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        func_ov000_021fc3f8(FIELD(void *, state, 0x354));
        func_ov021_021ff5b8(state);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 1:
        if (func_ov000_021fc450(FIELD(void *, state, 0x354)) != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc460(FIELD(void *, state, 0x354)) != 0) {
            func_ov021_021ff5b8(state);
        }
        break;
    case 2: {
        void *widget = FIELD(void *, state, 0x354);
        void *input = (u8 *)state + 0x30;
        if (func_ov000_021fcb98(widget, FIELD(s32, state, 0x2c)) == 0 &&
            (FIELD(u32, state, 0x20) & 0x10) != 0 &&
            func_ov000_021fcca8(widget, input) == 0 &&
            (FIELD(u32, state, 0x20) & 0x20) != 0) {
            s32 row = func_ov000_021fc298(widget, input);
            if (func_ov000_021fcc18(widget, input) == 0) {
                if (func_ov000_021fccfc(widget, input) != 0) {
                    change_state(state, data_ov021_02202d30);
                    break;
                }
                if (row >= 0) {
                    SceneSound_PlayPackedEffect(state, 0);
                    if (row != FIELD(s32, widget, 0x25c)) {
                        func_ov000_021fca4c(widget, row);
                        func_ov000_021fc9d4(widget);
                        func_ov021_021ff5b8(state);
                    }
                    break;
                }
                if (func_ov000_021fc5ac(widget, input) != 0) {
                    TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                    SceneSound_PlayPackedEffect(state, 3);
                    change_state(state, data_ov021_02202e08);
                    break;
                }
                if (func_ov000_021fc5fc(widget, input) != 0) {
                    if (Overlay021_IsAuxiliaryRecordAvailable(state) != 0) {
                        TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                        SceneSound_PlayPackedEffect(state, 11);
                        change_state(state, data_ov021_02202e00);
                    } else {
                        SceneSound_PlayPackedEffect(state, 9);
                    }
                    break;
                }
                void *controller = (u8 *)state + 0x14c +
                                   FIELD(s32, state, 0x2c4) * 0xac;
                if (SpriteMotionController_BeginHitResponse(controller, input, 0, 4) != 0) {
                    void *entry = Overlay000_GetActiveMetadata(widget);
                    if (func_ov021_021ff62c(entry, 1) == 0) {
                        FIELD(void *, state, 0x37c) = FIELD(void *, entry, 0xc);
                        void *selected = FIELD(void *, state, 0x37c);
                        if (selected != 0 && FIELD(void *, selected, 0xc) != 0) {
                            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                            SceneSound_PlayPackedEffect(state, 2);
                            FIELD(void *, state, 0x2bc) = FIELD(void *, selected, 0xc);
                            u32 category = Overlay021Descriptor_GetFlags16_19(
                                FIELD(void *, state, 0x2bc));
                            if (category == 1) {
                                FIELD(s32, state, 0x374) = FIELD(s32, widget, 0x25c);
                                FIELD(u32, state, 0x378) = FIELD(u16, selected, 0);
                                DisplayBrightness_StartMaskedTransitions(1, -16);
                                change_state(state, data_ov021_02202df8);
                            } else if (category == 0) {
                                change_state(state, data_ov021_02202df0);
                            } else {
                                change_state(state, data_ov021_02202de8);
                            }
                            break;
                        }
                    }
                    SceneSound_PlayPackedEffect(state, 9);
                    break;
                }
            }
        }
        if (func_ov000_021fc424(widget) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc4fc(widget) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    case 3:
        if (func_ov000_021fc528(FIELD(void *, state, 0x354)) != 0) {
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc538(FIELD(void *, state, 0x354)) != 0) {
            func_ov021_021ff5b8(state);
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Commits a successful primary selection. It decrements the chosen entry's
 * remaining count, refreshes the widget, credits descriptor +8 currency using
 * the +0x3EC animation, destroys auxiliary +0x37C, and conditionally sets
 * game flag 0x3DF after flag 0x71. It may show message 6, waits through the
 * dialog/delay and transition -16, closes the primary panel, then routes via
 * 0x02202DD8. Persistent flags/currency and UI state change; returns zero.
 */
extern "C" s32 func_ov021_02201800(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0: {
        void *entry = Overlay000_GetActiveMetadata(FIELD(void *, state, 0x354));
        FIELD(s32, entry, 0x1c)--;
        func_ov000_021fc714(FIELD(void *, state, 0x354));
        if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
            FIELD(s32, state, 0x3d8) = 1;
        s32 gain = FIELD(s32, FIELD(void *, state, 0x2bc), 8);
        s32 anim = func_ov045_0220b924(FIELD(void *, state, 0x3ec),
                                       GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud), gain, 0);
        GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, gain, anim);
        func_02062ca8(FIELD(void *, state, 0x37c));
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through into animation completion. */
    }
    case 1:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0) {
            if (GameWork_TestFlag(gGameWork, 0x3df) == 0 &&
                GameWork_TestFlag(gGameWork, 0x71) != 0) {
                GameWork_SetFlag(gGameWork, 0x3df);
                DisplayBrightness_StartMaskedTransitions(1, -8);
                FIELD(s32, state, 0x3d8) = 1;
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else if (ActorDescriptor_IsInvalid(FIELD(void *, state, 0x37c)) != 0 ||
                       FIELD(s32, state, 0x3d8) != 0) {
                DisplayBrightness_StartMaskedTransitions(1, -8);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                FIELD(void *, state, 0x37c) = 0;
                func_ov021_021ff0e0(state, 6);
                change_state(state, data_ov021_02202de0);
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
            if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                FIELD(s32, state, 0x3d8) = 1;
            func_ov021_021fea68(state);
            change_state(state, data_ov021_02202dd8);
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Enters the secondary information scene. It mirrors 0x022012F0: clear flags
 * 0x387/0x388, wait, reset controller +0xA0, rebuild selection and secondary
 * panel resources, install graphics mode 0x021FE458, open message 2, start
 * transition (1,0), and route through 0x02202DD0. It mutates state and flags,
 * may touch graphics MMIO through helpers, and always returns zero.
 */
extern "C" s32 func_ov021_02201a88(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        GameWork_ClearFlag(gGameWork, 0x387);
        GameWork_ClearFlag(gGameWork, 0x388);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            SpriteMotionController_Hide((u8 *)state + 0xa0);
            func_ov021_021ff050(state, FIELD(s32, state, 0x2c4));
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            func_ov021_021feb60(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        Overlay021_RefreshSelectionBackground(state);
        func_ov021_021ff0e0(state, 2);
        DisplayBrightness_StartMaskedTransitions(1, 0);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            change_state(state, data_ov021_02202dd0);
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}
