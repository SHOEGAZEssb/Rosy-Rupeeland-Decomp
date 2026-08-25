#include "tingle/types.h"

/* Overlay 21 entry, resume, and list-channel selection state handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void **data_021f5128;
extern const u16 data_021f5ed0[];
extern const u32 data_ov021_02202d28[];
extern const u32 data_ov021_02202e50[];
extern const u32 data_ov021_02202f10[];
extern const u32 data_ov021_02202f18[];
extern const u32 data_ov021_02202f20[];
extern const u32 data_ov021_02202f28[];
extern const u32 data_ov021_02202f30[];
extern const u32 data_ov021_02202f38[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern s32 GameWork_TestFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern const void *RecordDescriptor_GetMessage(const void *, s32);
extern void RecordCategory_PublishById(void *, u16);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void TitlePalette_SetMainBackdrop(s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern void TitleDialog_ClearTextRect(void *);
extern void SpriteMotionController_Show(void *);
extern void SpriteMotionController_Hide(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void Overlay021_List_Show(void *);
extern void Overlay021_List_RenderVisibleRows(void *);
extern void Overlay021_List_UpdateSelectionDisplay(void *);
extern void Overlay021_SetTransition(void *, u32, u32);
extern void Overlay021_CreateLists(void *);
extern void Overlay021_DestroyListsAndSavePositions(void *);
extern void Overlay021_RefreshListButtonAnimations(void *);
extern s32 Overlay021_IsAuxiliaryRecordAvailable(void *);
extern void Overlay021_UpdateScene(void *);
extern void Overlay021_ShowListMarker(void *);
extern void Overlay021_PositionListButtons(void *);
extern void Overlay021_SelectList(void *, s32);
extern void Overlay021_Dialog_ShowMessage(void *, s32);
extern void Overlay021_Dialog_ShowContent(void *, const void *);
extern s32 Overlay021_Dialog_UpdatePrompt(void *);
extern s32 Overlay021_Descriptor_HasFlag29(const void *);
extern void func_ov045_0220c028(void *);
extern void func_ov045_0220c128(void *, s32);
extern s32 func_ov045_0220c9e8(s32, s32);
extern void Overlay045_DrawSelectorPreview(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * One-time scene entry handler. Unless game-work flag 0x3B2 is set, start an
 * overlay-45 object for mode +0x54 and store its handle at +0x2D0. Commit both
 * fonts, disable input helper +0xA0, and enable the global currency HUD. If saved row
 * +0x3E4 is valid, activate list zero, cache that row descriptor +0x2BC,
 * restore external value for record tag 0xEE0E, and transition through
 * data_ov021_02202E50. Otherwise clear flag 0x3B2 and restore font state when
 * present, or open message zero, then transition through 0x02202D28. Set scene
 * flag bit zero, update all components, and return zero. Game-work, UI,
 * transition, and external-object state change; no direct MMIO occurs.
 */
extern "C" s32 func_ov021_021ff6b8(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        if (GameWork_TestFlag(gGameWork, 0x3b2) == 0) {
            FIELD(s32, state, 0x2d0) =
                func_ov045_0220c9e8(FIELD(s32, state, 0x54), 0);
        }
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        SpriteMotionController_Hide((u8 *)state + 0xa0);
        GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);

        if (FIELD(s32, state, 0x3e4) >= 0) {
            FIELD(s32, state, 0x2c4) = 0;
            void *list = FIELD(void *, state, 0x2a4);
            FIELD(void *, state, 0x2c0) = list;
            s32 index = FIELD(s32, state, 0x3e4);
            const void *descriptor =
                FIELD(const void *, FIELD(u8 *, list, 0x4c) + index * 12, 0);
            FIELD(const void *, state, 0x2bc) = descriptor;
            const u16 *record = (const u16 *)RecordDescriptor_GetMessage(descriptor, 0);
            if (record[0] == 0xee0e)
                func_ov045_0220c128(FIELD(void *, state, 0x38c), record[1]);
            Overlay021_SetTransition(state, data_ov021_02202e50[0],
                                data_ov021_02202e50[1]);
        } else {
            if (GameWork_TestFlag(gGameWork, 0x3b2) != 0) {
                GameWork_ClearFlag(gGameWork, 0x3b2);
                GraphicsSpriteRenderer_SetFontResource(
                    gDebugFont, FIELD(void *, state, 0x58));
                Overlay045_DrawSelectorPreview(FIELD(s32, state, 0x54), 0);
            } else {
                Overlay021_Dialog_ShowMessage(state, 0);
            }
            Overlay021_SetTransition(state, data_ov021_02202d28[0],
                                data_ov021_02202d28[1]);
        }
        FIELD(u32, state, 0x20) |= 1;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Five-state post-action rebuild handler. State 0 starts transition (1,-8).
 * State 1 waits, resolves selected descriptor +0x2BC into dialog content,
 * renders it and normalizes external dialog state. State 2 waits for prompt
 * completion, emits transition (1,-16), records descriptor flag bit 29 at
 * +0x3D8, and applies its nested ID to the current mode record. State 3 waits,
 * resets dialog/font and destroys both lists. State 4 rebuilds lists/input
 * animations, then routes to 0x02202F38 when +0x3D8 is set or resets saved row
 * +0x3E4 and routes through 0x02202F30 after transition (1,0). Always update
 * components and return zero. Dialog/list/game-record/transition state changes.
 */
extern "C" s32 func_ov021_021ff834(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through to wait state 1. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            const void *content =
                RecordDescriptor_GetMessage(FIELD(void *, state, 0x2bc), 0);
            Overlay021_Dialog_ShowContent(state, content);
            s32 result = TitleDialog_UpdateTextPage(FIELD(void *, state, 0x388),
                                       data_021f5ed0);
            if ((result & 0x200) == 0)
                func_ov045_0220c028(FIELD(void *, state, 0x38c));
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (Overlay021_Dialog_UpdatePrompt(state) != 0) {
            DisplayBrightness_StartMaskedTransitions(1, -16);
            if (Overlay021_Descriptor_HasFlag29(FIELD(void *, state, 0x2bc)) != 0)
                FIELD(s32, state, 0x3d8) = 1;
            const u8 *descriptor = FIELD(const u8 *, state, 0x2bc);
            const u8 *record = FIELD(const u8 *, descriptor, 4);
            void *modeRecord =
                data_021f5128[FIELD(s32, state, 0x54)];
            RecordCategory_PublishById(modeRecord, FIELD(u16, record, 0));
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            Overlay021_DestroyListsAndSavePositions(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 4:
        Overlay021_CreateLists(state);
        Overlay021_RefreshListButtonAnimations(state);
        if (FIELD(s32, state, 0x3d8) != 0) {
            FIELD(s32, state, 0x48) = 0;
            TitlePalette_SetMainBackdrop(0);
            Overlay021_SetTransition(state, data_ov021_02202f38[0],
                                data_ov021_02202f38[1]);
        } else {
            DisplayBrightness_StartMaskedTransitions(1, 0);
            FIELD(s32, state, 0x3e4) = -1;
            Overlay021_SetTransition(state, data_ov021_02202f30[0],
                                data_ov021_02202f30[1]);
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Five-state list-channel chooser. It begins by processing any active prompt.
 * State 0 hides both marker sprites, clears scene flag bit one, restores normal
 * helper positions, disables +0xA0, and falls through to transition wait.
 * State 2 accepts +0xA0 as cancel (action 3, transition 0x02202F28) or either
 * channel helper: unavailable channels emit action 9; available channel one
 * branches to 0x02202F20/0x02202F18 based on secondary-record availability,
 * while channel zero opens message 3 and advances. State 3 waits, activates and
 * renders the selected list, shows its marker, starts transition (1,0), and
 * advances. State 4 waits then transitions through 0x02202F10. Always update
 * components and return zero. Input/list/dialog/transition state changes.
 */
extern "C" s32 func_ov021_021ffa38(void *state)
{
    Overlay021_Dialog_UpdatePrompt(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(u32, state, 0x48) &= ~2U;
        FIELD(u16, FIELD(void *, state, 0x98), 0x24) |= 4;
        FIELD(u16, FIELD(void *, state, 0x9c), 0x24) |= 4;
        Overlay021_PositionListButtons(state);
        SpriteMotionController_Show((u8 *)state + 0xa0);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through to wait state 1. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if ((FIELD(u32, state, 0x20) & 0x20) != 0) {
            if (SpriteMotionController_BeginHitResponse((u8 *)state + 0xa0,
                              (u8 *)state + 0x30, 0, 4) != 0) {
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                SceneSound_PlayPackedEffect(state, 3);
                Overlay021_SetTransition(state, data_ov021_02202f28[0],
                                    data_ov021_02202f28[1]);
                break;
            }
            s32 channel;
            for (channel = 0; channel < 2; channel++) {
                if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x14c + channel * 0xac,
                                  (u8 *)state + 0x30, 0, 4) == 0)
                    continue;
                if (FIELD(void *, state, 0x2a4 + channel * 4) == 0) {
                    SceneSound_PlayPackedEffect(state, 9);
                    continue;
                }
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
                SceneSound_PlayPackedEffect(state, 2);
                FIELD(s32, state, 0x2c4) = channel;
                DisplayBrightness_StartMaskedTransitions(1, -16);
                if (channel == 1) {
                    if (Overlay021_IsAuxiliaryRecordAvailable(state) != 0)
                        Overlay021_SetTransition(
                            state, data_ov021_02202f20[0],
                            data_ov021_02202f20[1]);
                    else
                        Overlay021_SetTransition(
                            state, data_ov021_02202f18[0],
                            data_ov021_02202f18[1]);
                } else {
                    Overlay021_Dialog_ShowMessage(state, 3);
                    FIELD(s32, state, 4)++;
                    FIELD(s32, state, 8) = 0;
                }
                break;
            }
        }
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            Overlay021_SelectList(state, FIELD(s32, state, 0x2c4));
            Overlay021_List_Show(FIELD(void *, state, 0x2c0));
            Overlay021_List_RenderVisibleRows(FIELD(void *, state, 0x2c0));
            Overlay021_List_UpdateSelectionDisplay(FIELD(void *, state, 0x2c0));
            Overlay021_ShowListMarker(state);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 4:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            Overlay021_SetTransition(state, data_ov021_02202f10[0],
                                data_ov021_02202f10[1]);
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}
