#include "tingle/types.h"

/* Overlay 21 panel-result, currency-exchange, and return-to-list state machines. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void **data_021f5128;
extern const u32 data_ov021_02202db0[];
extern const u32 data_ov021_02202e18[];
extern const u32 data_ov021_02202e20[];
extern const u32 data_ov021_02202e28[];
extern const u32 data_ov021_02202e30[];
extern const u32 data_ov021_02202e38[];
extern const u32 data_ov021_02202e40[];
extern const u32 data_ov021_02202e48[];
extern const u32 data_ov021_02202e58[];
extern const u32 data_ov021_02202e60[];
extern const u32 data_ov021_02202e68[];
extern const u32 data_ov021_02202e70[];
extern const u32 data_ov021_02202e78[];
extern const u32 data_ov021_02202e80[];
extern const u32 data_ov021_02202e88[];
extern const u32 data_ov021_02202e90[];
extern void *gGameWork;
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern void func_02062ca8(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteText_FormatDecimal(void *, s32, u32, s32);
extern void RecordCategory_PublishById(void *, u16);
extern const void *RecordDescriptor_GetMessage(const void *, s32);
extern void RecordDescriptor_SetValue(void *, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern void SpriteMotionController_Hide(void *);
extern u32 genrand_int32(void);
extern s32 Overlay002_HitTestIcon(void *, void *);
extern s32 Overlay002_ApplySelectedKey(void *);
extern void func_ov002_021fbd64(void *);
extern s32 func_ov002_021fbd98(void *);
extern s32 func_ov002_021fbdb0(void *);
extern u32 Overlay021_Descriptor_GetCategory(const void *);
extern void Overlay021_List_Show(void *);
extern void Overlay021_List_RenderVisibleRows(void *);
extern void Overlay021_List_UpdateSelectionDisplay(void *);
extern void func_ov021_021fd7c0(void *, u32, u32);
extern void Overlay021_SetupMainBackground(void *);
extern void func_ov021_021fe390(void *);
extern void func_ov021_021fe6b0(void *);
extern void func_ov021_021fe8e8(void *);
extern void func_ov021_021feea4(void *);
extern void Overlay021_DestroyAuxiliaryPanel(void *);
extern void func_ov021_021fee54(void *);
extern void func_ov021_021ff050(void *, s32);
extern void func_ov021_021ff0e0(void *, s32);
extern void func_ov021_021ff1d0(void *, const void *);
extern s32 func_ov021_021ff274(void *);
extern s32 func_ov021_021ffa10(const void *);
extern s32 func_ov045_0220b924(void *, s32, s32, s32);
extern s32 func_ov045_0220b9b8(void *);
extern s32 func_ov045_0220bc34(void *);
extern void func_ov045_0220c028(void *);
#ifdef __cplusplus
}
#endif

static void change_state(void *state, const u32 *next)
{
    func_ov021_021fd7c0(state, next[0], next[1]);
}

/*
 * Drives the auxiliary panel after it opens. Input is the overlay state. It
 * waits for panel readiness, emits one of two randomized action codes, then
 * interprets panel result 12 as a cancel/alternate route and result 13 as a
 * numeric choice. Valid choices construct the +0x398 effect and route through
 * 0x02202E90; insufficient resources enter a short retry delay or message
 * state 20. It updates panel, dialog, transition, and state fields and always
 * returns zero; the called UI helpers may touch graphics hardware.
 */
extern "C" s32 func_ov021_022009e0(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if ((FIELD(u32, state, 0x20) & 0x20) != 0 &&
            Overlay002_HitTestIcon(FIELD(void *, state, 0x390),
                                (u8 *)state + 0x30) >= 0) {
            SceneSound_PlayPackedEffect(state, (genrand_int32() & 1) ? 0x3c80 : 0x3c81);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (func_ov002_021fbd98(FIELD(void *, state, 0x390)) == 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3: {
        void *panel = FIELD(void *, state, 0x390);
        if (Overlay002_ApplySelectedKey(panel) != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
            break;
        }
        func_ov002_021fbd64(panel);
        s32 result = FIELD(s32, panel, 0x8c);
        if (result == 13) {
            if (FIELD(s32, panel, 0x90) == 0) {
                SceneSound_PlayPackedEffect(state, 9);
                FIELD(s32, state, 4) = 0;
                FIELD(s32, state, 8) = 0;
                break;
            }
            FIELD(s32, state, 0x394) = FIELD(s32, panel, 0x88);
            if (FIELD(s32, state, 0x394) == 0 &&
                Overlay021_Descriptor_GetCategory(FIELD(void *, state, 0x2bc)) == 0) {
                SceneSound_PlayPackedEffect(state, 9);
                FIELD(s32, state, 4) = 0;
                FIELD(s32, state, 8) = 0;
            } else if (Overlay021_Descriptor_GetCategory(FIELD(void *, state, 0x2bc)) == 1 &&
                       GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud) <= FIELD(s32, state, 0x394)) {
                SceneSound_PlayPackedEffect(state, 9);
                FIELD(s32, state, 4) = 10;
                FIELD(s32, state, 8) = 0;
            } else {
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                GraphicsSpriteText_FormatDecimal((u8 *)state + 0x398,
                              FIELD(s32, state, 0x394), 0xff676980, 0);
                change_state(state, data_ov021_02202e90);
            }
        } else if (result == 12) {
            SceneSound_PlayPackedEffect(state, 3);
            if (FIELD(s32, state, 0x3e0) != 0) {
                DisplayBrightness_StartMaskedTransitions(1, -8);
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                func_ov021_021ff1d0(
                    state, RecordDescriptor_GetMessage(FIELD(void *, state, 0x2bc), 2));
                func_ov045_0220c028(FIELD(void *, state, 0x38c));
                FIELD(s32, state, 4) = 20;
                FIELD(s32, state, 8) = 0;
            } else {
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                change_state(state, data_ov021_02202e88);
            }
        }
        break;
    }
    case 4:
        if (func_ov002_021fbdb0(FIELD(void *, state, 0x390)) != 0) {
            func_ov002_021fbd64(FIELD(void *, state, 0x390));
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 10:
        if (++FIELD(s32, state, 8) > 20) {
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 20:
        if (func_ov021_021ff274(state) != 0) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            change_state(state, data_ov021_02202e80);
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Applies the amount selected by 0x022009E0. Depending on descriptor category
 * and resource limits, it either routes to an error descriptor, animates a
 * currency debit through +0x3EC, updates the descriptor counters, or marks an
 * item record selected. Later states wait for animation/dialog completion,
 * rebuild the list and sprites, restore graphics, and route back to the proper
 * list state. The input state is mutated; persistent currency/item records and
 * UI/transition state may change. The function always returns zero.
 */
extern "C" s32 func_ov021_02200d10(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1: {
        if (DisplayBrightness_IsMainTransitionComplete() == 0)
            break;
        u8 *desc = FIELD(u8 *, state, 0x2bc);
        s32 amount = FIELD(s32, state, 0x394);
        if (FIELD(s32, state, 0x3e0) != 0) {
            FIELD(s32, state, 0x2c8) =
                FIELD(s32, FIELD(u8 *, desc, 4), 0x10) > amount ? 4 : 3;
            change_state(state, FIELD(s32, state, 0x2c8) == 4
                                    ? data_ov021_02202e78
                                    : data_ov021_02202e70);
        } else if (Overlay021_Descriptor_GetCategory(desc) == 1) {
            s32 capacity = FIELD(s32, FIELD(u8 *, desc, 4), 0x10);
            if (capacity > amount) {
                s32 anim = func_ov045_0220b924(FIELD(void *, state, 0x3ec),
                                               GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud),
                                               amount, 1);
                GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, -amount, anim);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            } else {
                s32 previous = FIELD(s32, desc, 8);
                RecordDescriptor_SetValue(desc, amount);
                FIELD(s32, state, 0x3dc) = FIELD(s32, desc, 0xc);
                if (previous > amount)
                    RecordDescriptor_SetValue(desc, previous);
                FIELD(s32, state, 4) = 10;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            FIELD(s32, state, 0x2c8) = FIELD(s32, desc, 8) < amount ? 2 : 1;
            change_state(state, data_ov021_02202e68);
        }
        break;
    }
    case 2:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, state, 0x3ec)) == 0) {
            func_ov021_021ff0e0(state, 10);
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
            change_state(state, data_ov021_02202e60);
        }
        break;
    case 5:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            change_state(state, data_ov021_02202e58);
        break;
    case 10: {
        s32 anim = func_ov045_0220b924(FIELD(void *, state, 0x3ec),
                                       GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud),
                                       FIELD(s32, state, 0x394), 1);
        GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, -FIELD(s32, state, 0x394), anim);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through into the animation wait. */
    }
    case 11:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, state, 0x3ec)) == 0) {
            DisplayBrightness_StartMaskedTransitions(1, -16);
            FIELD(s32, state, 4) = 30;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 30:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay021_DestroyAuxiliaryPanel(state);
            func_ov021_021fe6b0(state);
            func_ov021_021ff050(state, FIELD(s32, state, 0x2c4));
            if (FIELD(void *, state, 0x37c) != 0) {
                if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                    FIELD(s32, state, 0x3d8) = 1;
                func_02062ca8(FIELD(void *, state, 0x37c));
                change_state(state, data_ov021_02202db0);
            } else if (FIELD(void *, state, 0x380) != 0) {
                if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                    FIELD(s32, state, 0x3d8) = 1;
                func_02062ca8(FIELD(void *, state, 0x380));
                change_state(state, data_ov021_02202e48);
            } else {
                Overlay021_SetupMainBackground(state);
                Overlay021_List_Show(FIELD(void *, state, 0x2c0));
                Overlay021_List_RenderVisibleRows(FIELD(void *, state, 0x2c0));
                Overlay021_List_UpdateSelectionDisplay(FIELD(void *, state, 0x2c0));
                func_ov021_021fee54(state);
                if (Overlay021_Descriptor_GetCategory(FIELD(void *, state, 0x2bc)) == 1) {
                    FIELD(s32, state, 0x3e0) = 0;
                    DisplayBrightness_StartMaskedTransitions(1, -8);
                    change_state(state, data_ov021_02202e40);
                } else {
                    if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                        FIELD(s32, state, 0x3d8) = 1;
                    u8 *record = FIELD(u8 *, FIELD(u8 *, state, 0x2bc), 4);
                    RecordCategory_PublishById(data_021f5128[FIELD(s32, state, 0x54)],
                                  FIELD(u16, record, 0));
                    change_state(state, data_ov021_02202e38);
                }
            }
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Restores the list after the exchange branch. It waits for transition -16,
 * rebuilds sprites and the selection display, routes immediately when either
 * auxiliary widget exists, otherwise restores graphics/list focus and waits
 * for transition (1,0) before clearing +0x3E0 and routing through 0x02202E20.
 * The state and UI are updated; return is always zero.
 */
extern "C" s32 func_ov021_022011a4(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -16);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay021_DestroyAuxiliaryPanel(state);
            func_ov021_021fe6b0(state);
            func_ov021_021ff050(state, FIELD(s32, state, 0x2c4));
            if (FIELD(void *, state, 0x37c) != 0) {
                FIELD(void *, state, 0x37c) = 0;
                change_state(state, data_ov021_02202e30);
            } else if (FIELD(void *, state, 0x380) != 0) {
                FIELD(void *, state, 0x380) = 0;
                change_state(state, data_ov021_02202e28);
            } else {
                Overlay021_SetupMainBackground(state);
                Overlay021_List_Show(FIELD(void *, state, 0x2c0));
                Overlay021_List_RenderVisibleRows(FIELD(void *, state, 0x2c0));
                Overlay021_List_UpdateSelectionDisplay(FIELD(void *, state, 0x2c0));
                func_ov021_021fee54(state);
                DisplayBrightness_StartMaskedTransitions(1, 0);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            }
        }
        break;
    case 2:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            FIELD(s32, state, 0x3e0) = 0;
            change_state(state, data_ov021_02202e20);
        }
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}

/*
 * Enters the post-exchange information scene. It clears game flags 0x387 and
 * 0x388, waits for the current transition, resets the +0xA0 controller,
 * rebuilds selection/panel resources, applies graphics mode 0x021FE390, opens
 * message 2, and finally routes through 0x02202E18. State and persistent flags
 * change; graphics helpers may access MMIO. The return value is always zero.
 */
extern "C" s32 func_ov021_022012f0(void *state)
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
            func_ov021_021fe8e8(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        func_ov021_021fe390(state);
        func_ov021_021ff0e0(state, 2);
        DisplayBrightness_StartMaskedTransitions(1, 0);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            change_state(state, data_ov021_02202e18);
        break;
    }
    func_ov021_021feea4(state);
    return 0;
}
