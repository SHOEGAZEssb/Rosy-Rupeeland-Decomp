#include "tingle/types.h"

/* Overlay 21 transaction prompt, animated result, and category-message routing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void **data_021f5128;
extern const u8 data_ov021_02202cd0[];
extern const u32 data_ov021_02202d38[];
extern const u32 data_ov021_02202d48[];
extern const u32 data_ov021_02202d58[];
extern const u32 data_ov021_02202d68[];
extern const u32 data_ov021_02202d70[];
extern const u32 data_ov021_02202d90[];
extern const u32 data_ov021_02202fb8[];
extern u8 gHeapContext[];
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern void func_02062ca8(void *);
extern void GraphicsSpriteText_FormatDecimal(void *, s32, u32, s32);
extern void RecordCategory_PublishById(void *, u16);
extern const void *RecordDescriptor_GetMessage(const void *, s32);
extern void RecordDescriptor_SetValue(void *, s32);
extern s32 func_0209189c(void *, s32, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void Presentation_SetScript(void *, const void *, s32);
extern s32 Presentation_IsScriptComplete(void *);
extern void func_ov002_021fbe68(void *);
extern void Overlay021_List_Show(void *);
extern void Overlay021_List_RenderVisibleRows(void *);
extern void Overlay021_List_UpdateSelectionDisplay(void *);
extern void Overlay021_SetTransition(void *, u32, u32);
extern void Overlay021_SetupMainBackground(void *);
extern void Overlay021_SetupSceneSprites(void *);
extern void Overlay021_UpdateScene(void *);
extern void Overlay021_DestroyAuxiliaryPanel(void *);
extern void func_ov021_021fee54(void *);
extern void func_ov021_021ff050(void *, s32);
extern s32 func_ov021_021ff0c8(void *);
extern void func_ov021_021ff0e0(void *, s32);
extern void func_ov021_021ff1d0(void *, const void *);
extern s32 func_ov021_021ff274(void *);
extern void func_ov021_021ff380(void *);
extern void func_ov021_021ff3ac(void *);
extern void Overlay021_UpdateTileTransitionOffset20(void *);
extern u32 Overlay021Descriptor_GetFlags16_19(const void *);
extern s32 func_ov021_021ffa10(const void *);
extern void func_ov045_0220bc40(void *);
extern s32 func_ov045_0220b924(void *, s32, s32, s32);
extern s32 func_ov045_0220b9b8(void *);
extern s32 func_ov045_0220bc34(void *);
extern void func_ov045_0220bd90(void *);
extern void func_ov045_0220bdb0(void *);
extern void func_ov045_0220bdd0(void *);
extern void func_ov045_0220bdf0(void *);
#ifdef __cplusplus
}
#endif

static void change_state(void *state, const u32 *next)
{
    Overlay021_SetTransition(state, next[0], next[1]);
}

static void advance(void *state)
{
    FIELD(s32, state, 4)++;
    FIELD(s32, state, 8) = 0;
}

static void destroy_polymorphic(void *object)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((void (*)(void *))vtable[1])(object);
    }
}

static void animate_currency(void *state, s32 amount, s32 debit)
{
    s32 anim = func_ov045_0220b924(FIELD(void *, state, 0x3ec),
                                   GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud), amount, debit);
    GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, debit ? -amount : amount, anim);
}

static void prepare_result_widget(void *state)
{
    Overlay021_UpdateTileTransitionOffset20(state);
    void *widget = FIELD(void *, state, 0x384);
    PresentationScalar_TransitionTo((u8 *)widget + 0xc, 2, 0x160);
    FIELD(s32, widget, 0x7c) = 0x10;
    FIELD(s32, widget, 0x80) = 0;
}

/*
 * Runs the complete transaction confirmation flow. State 0 fades to -8 and
 * states 1-3 allocate/configure a 0xB0-byte overlay-45 prompt object at +0x384,
 * position it from +0x2CC, and choose prompt behavior from action +0x2C8.
 * State 4 commits the selected credit/debit or descriptor counter update.
 * States 10/20/21 and 50/51/52 wait for currency animation, animate and destroy
 * the prompt, rebuild list/panel resources, and route through the appropriate
 * descriptor. Input is overlay state. Heap ownership, persistent currency and
 * records, dialog/audio, graphics, and transitions change; return is zero.
 */
extern "C" s32 func_ov021_022023f0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        advance(state);
        /* Deliberate fall-through. */
    case 1: {
        if (DisplayBrightness_IsMainTransitionComplete() == 0)
            break;
        SceneSound_PlayPackedEffect(state, 0x6c);
        void *prompt = Heap_Alloc(0xb0, data_ov021_02202fb8, 4, gHeapContext);
        if (prompt != 0)
            func_ov045_0220bc40(prompt);
        FIELD(void *, state, 0x384) = prompt;
        Presentation_SetScript(prompt, data_ov021_02202cd0, 0);
        advance(state);
        break;
    }
    case 2:
        if (Presentation_IsScriptComplete(FIELD(void *, state, 0x384)) != 0) {
            s32 position = (s16)func_0209189c((u8 *)state + 0x2cc, 60, 90);
            FIELD(s32, FIELD(void *, state, 0x384), 0x7c) = position;
            FIELD(s32, FIELD(void *, state, 0x384), 0x80) = 0;
            advance(state);
        }
        break;
    case 3:
        if (func_ov021_021ff0c8(FIELD(void *, state, 0x384)) != 0) {
            SceneSound_StopPackedEffect(state, 0x6c);
            s32 action = FIELD(s32, state, 0x2c8);
            u8 *desc = FIELD(u8 *, state, 0x2bc);
            u8 *record = FIELD(u8 *, desc, 4);
            if (action == 1) {
                SceneSound_PlayPackedEffect(state, 0x6a);
                if (FIELD(s32, state, 0x394) <= FIELD(s32, desc, 8) / 2)
                    func_ov045_0220bd90(FIELD(void *, state, 0x384));
                else {
                    func_ov045_0220bdf0(FIELD(void *, state, 0x384));
                    func_ov021_021ff380(state);
                }
                func_ov021_021ff0e0(state, 6);
            } else if (action == 2) {
                SceneSound_PlayPackedEffect(state, 0x6b);
                func_ov045_0220bdb0(FIELD(void *, state, 0x384));
                func_ov021_021ff3ac(state);
                GraphicsSpriteText_FormatDecimal((u8 *)state + 0x3b8,
                              FIELD(s32, record, 0x14), 0xff676980, 0);
                func_ov021_021ff0e0(state, 9);
            } else if (action == 3) {
                SceneSound_PlayPackedEffect(state, 0x6a);
                if (FIELD(s32, state, 0x394) >= FIELD(s32, record, 0x10) * 2) {
                    func_ov045_0220bd90(FIELD(void *, state, 0x384));
                    FIELD(s32, state, 0x3e8) = 1;
                    func_ov021_021ff1d0(state, RecordDescriptor_GetMessage(desc, 4));
                } else {
                    func_ov045_0220bdf0(FIELD(void *, state, 0x384));
                    func_ov021_021ff380(state);
                    func_ov021_021ff1d0(state, RecordDescriptor_GetMessage(desc, 3));
                }
            } else if (action == 4) {
                SceneSound_PlayPackedEffect(state, 0x6b);
                func_ov045_0220bdb0(FIELD(void *, state, 0x384));
                func_ov021_021ff3ac(state);
                func_ov021_021ff1d0(
                    state, RecordDescriptor_GetMessage(
                        desc, FIELD(s32, state, 0x394) <=
                                      FIELD(s32, record, 0x10) / 2 ? 6 : 5));
            }
            advance(state);
        }
        break;
    case 4:
        if (func_ov021_021ff274(state) != 0) {
            if (FIELD(s32, state, 0x3e8) != 0) {
                FIELD(s32, state, 0x3e8) = 0;
                func_ov045_0220bdd0(FIELD(void *, state, 0x384));
            }
            s32 action = FIELD(s32, state, 0x2c8);
            if (action == 1) {
                animate_currency(state, FIELD(s32, state, 0x394), 0);
                FIELD(s32, state, 4) = 20;
                FIELD(s32, state, 8) = 0;
            } else if (action == 2) {
                s32 gain = FIELD(s32, FIELD(u8 *, FIELD(void *, state, 0x2bc), 4), 0x14);
                animate_currency(state, gain, 0);
                FIELD(s32, state, 4) = 20;
                FIELD(s32, state, 8) = 0;
            } else if (action == 3) {
                FIELD(s32, state, 0x3d8) = 1;
                RecordDescriptor_SetValue(FIELD(void *, state, 0x2bc),
                              FIELD(s32, state, 0x394));
                animate_currency(state, FIELD(s32, state, 0x394), 1);
                FIELD(s32, state, 4) = 10;
                FIELD(s32, state, 8) = 0;
            } else if (action == 4) {
                animate_currency(state, FIELD(s32, state, 0x394), 1);
                FIELD(s32, state, 4) = 50;
                FIELD(s32, state, 8) = 0;
            }
        }
        break;
    case 10:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, state, 0x3ec)) == 0) {
            DisplayBrightness_StartMaskedTransitions(1, -16);
            FIELD(s32, state, 4) = 30;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 20:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, state, 0x3ec)) == 0) {
            prepare_result_widget(state);
            advance(state);
        }
        break;
    case 21:
        if (func_ov021_021ff0c8(FIELD(void *, state, 0x384)) != 0) {
            destroy_polymorphic(FIELD(void *, state, 0x384));
            FIELD(void *, state, 0x384) = 0;
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            DisplayBrightness_StartMaskedTransitions(1, -16);
            FIELD(s32, state, 4) = 30;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 30:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay021_DestroyAuxiliaryPanel(state);
            Overlay021_SetupSceneSprites(state);
            func_ov021_021ff050(state, FIELD(s32, state, 0x2c4));
            if (FIELD(void *, state, 0x37c) != 0) {
                if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                    FIELD(s32, state, 0x3d8) = 1;
                func_02062ca8(FIELD(void *, state, 0x37c));
                change_state(state, data_ov021_02202d68);
            } else if (FIELD(void *, state, 0x380) != 0) {
                if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                    FIELD(s32, state, 0x3d8) = 1;
                func_02062ca8(FIELD(void *, state, 0x380));
                change_state(state, data_ov021_02202d38);
            } else {
                Overlay021_SetupMainBackground(state);
                Overlay021_List_Show(FIELD(void *, state, 0x2c0));
                Overlay021_List_RenderVisibleRows(FIELD(void *, state, 0x2c0));
                Overlay021_List_UpdateSelectionDisplay(FIELD(void *, state, 0x2c0));
                func_ov021_021fee54(state);
                if (func_ov021_021ffa10(FIELD(void *, state, 0x2bc)) != 0)
                    FIELD(s32, state, 0x3d8) = 1;
                u8 *record = FIELD(u8 *, FIELD(u8 *, state, 0x2bc), 4);
                RecordCategory_PublishById(data_021f5128[FIELD(s32, state, 0x54)],
                              FIELD(u16, record, 0));
                change_state(state, data_ov021_02202d58);
            }
        }
        break;
    case 50:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0x3ec)) != 0 &&
            func_ov045_0220bc34(FIELD(void *, state, 0x3ec)) == 0) {
            prepare_result_widget(state);
            func_ov021_021ff1d0(
                state, RecordDescriptor_GetMessage(FIELD(void *, state, 0x2bc), 1));
            advance(state);
        }
        break;
    case 51:
        if (func_ov021_021ff274(state) != 0 &&
            func_ov021_021ff0c8(FIELD(void *, state, 0x384)) != 0) {
            destroy_polymorphic(FIELD(void *, state, 0x384));
            FIELD(void *, state, 0x384) = 0;
            DisplayBrightness_StartMaskedTransitions(1, 0);
            advance(state);
        }
        break;
    case 52:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov002_021fbe68(FIELD(void *, state, 0x390));
            change_state(state, data_ov021_02202d90);
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Shows a category-dependent informational message before returning to the
 * originating category panel. It fades to -8, opens message 1 for descriptor
 * category 2 or message 8 otherwise, waits for dialog completion, resets the
 * text object, and routes to the primary-success or secondary-success state
 * according to whether +0x354 exists. Input UI/transition state changes and
 * the function always returns zero.
 */
extern "C" s32 func_ov021_02202be0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        advance(state);
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov021_021ff0e0(
                state, Overlay021Descriptor_GetFlags16_19(FIELD(void *, state, 0x2bc)) == 2
                           ? 1 : 8);
            advance(state);
        }
        break;
    case 2:
        if (func_ov021_021ff274(state) != 0) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            change_state(state, FIELD(void *, state, 0x354) != 0
                                    ? data_ov021_02202d48
                                    : data_ov021_02202d70);
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}
