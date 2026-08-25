#include "tingle/types.h"

/* Overlay 21 confirmation, record-application, list-rebuild, and auxiliary-action states. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void **data_021f5128;
extern const u32 data_ov021_02202e98[];
extern const u32 data_ov021_02202ea0[];
extern const u32 data_ov021_02202ea8[];
extern const u32 data_ov021_02202eb0[];
extern const u32 data_ov021_02202eb8[];
extern const u32 data_ov021_02202ec0[];
extern const u32 data_ov021_02202ec8[];
extern const u32 data_ov021_02202ed0[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, u32);
extern s32 GameWork_TestFlag(void *, u32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern const void *RecordDescriptor_GetMessage(const void *, s32);
extern void RecordCategory_PublishById(void *, u16);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void TitlePalette_SetMainBackdrop(s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern void func_ov002_021fbdc0(void *);
extern s32 Overlay002_UpdateFooterAnimation(void *);
extern s32 func_ov002_021fbe60(void *);
extern void Overlay021_List_Show(void *);
extern u32 Overlay021_Descriptor_GetCategory(const void *);
extern void Overlay021_List_Hide(void *);
extern void Overlay021_List_RenderVisibleRows(void *);
extern void Overlay021_List_UpdateSelectionDisplay(void *);
extern void Overlay021_SetTransition(void *, u32, u32);
extern void Overlay021_SetupMainBackground(void *);
extern void Overlay021_SetupAlternateMainBackground(void *);
extern void Overlay021_CreateLists(void *);
extern void Overlay021_DestroyListsAndSavePositions(void *);
extern void Overlay021_RefreshListButtonAnimations(void *);
extern void Overlay021_ResetSceneSprites(void *);
extern void Overlay021_DestroyPrimaryPanel(void *);
extern void func_ov021_021fecd0(void *);
extern void func_ov021_021fedac(void *);
extern void Overlay021_UpdateScene(void *);
extern void func_ov021_021fee54(void *);
extern void func_ov021_021ff0e0(void *, s32);
extern void func_ov021_021ff1d0(void *, const void *);
extern s32 func_ov021_021ff274(void *);
extern u32 Overlay021Descriptor_GetFlags16_19(const void *);
extern s32 func_ov021_021ffa10(const void *);
extern void func_ov045_0220c028(void *);
#ifdef __cplusplus
}
#endif

/*
 * Three-state descriptor confirmation. State 0 starts transition (1,-8) and
 * falls through. State 1 waits, resolves selected descriptor +0x2BC variant
 * zero into dialog content, opens it, resets the external dialog, and advances.
 * State 2 waits for prompt completion, starts (1,-16), applies the descriptor's
 * nested halfword ID to the mode record selected by +0x54, and transitions via
 * data_ov021_02202ED0. Always update components and return zero. Dialog,
 * game-record, and transition state change; no direct MMIO occurs.
 */
extern "C" s32 func_ov021_02200360(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            const void *content =
                RecordDescriptor_GetMessage(FIELD(void *, state, 0x2bc), 0);
            func_ov021_021ff1d0(state, content);
            func_ov045_0220c028(FIELD(void *, state, 0x38c));
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (func_ov021_021ff274(state) != 0) {
            DisplayBrightness_StartMaskedTransitions(1, -16);
            const u8 *descriptor = FIELD(const u8 *, state, 0x2bc);
            const u8 *record = FIELD(const u8 *, descriptor, 4);
            RecordCategory_PublishById(data_021f5128[FIELD(s32, state, 0x54)],
                          FIELD(u16, record, 0));
            Overlay021_SetTransition(state, data_ov021_02202ed0[0],
                                data_ov021_02202ed0[1]);
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Three-state first-time record application. State 0 advances immediately.
 * State 1 waits, opens descriptor +0x2BC content variant +0x3DC, resets the
 * external dialog, and advances. State 2 waits for prompt completion, starts
 * (1,-16), resets dialog, and on the first use sets game-work flags
 * 0x39A/0x3B7/0x389/0x3B2, stores mode +0x54 at game-work +0x204, and marks
 * +0x3D8. It also marks +0x3D8 for descriptor bit 29 or a full bit-31 record,
 * applies the nested ID to the current mode record, and transitions through
 * 0x02202EC8. Always update/return zero. Persistent game-work and UI state change.
 */
extern "C" s32 func_ov021_0220044c(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            const void *content = RecordDescriptor_GetMessage(
                FIELD(void *, state, 0x2bc),
                FIELD(s32, state, 0x3dc));
            func_ov021_021ff1d0(state, content);
            func_ov045_0220c028(FIELD(void *, state, 0x38c));
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (func_ov021_021ff274(state) != 0) {
            DisplayBrightness_StartMaskedTransitions(1, -16);
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            if (GameWork_TestFlag(gGameWork, 0x39a) == 0) {
                GameWork_SetFlag(gGameWork, 0x39a);
                GameWork_SetFlag(gGameWork, 0x3b7);
                GameWork_SetFlag(gGameWork, 0x389);
                GameWork_SetFlag(gGameWork, 0x3b2);
                FIELD(u16, gGameWork, 0x204) =
                    FIELD(u16, state, 0x54);
                FIELD(s32, state, 0x3d8) = 1;
            }
            const u8 *descriptor = FIELD(const u8 *, state, 0x2bc);
            const u8 *record = FIELD(const u8 *, descriptor, 4);
            if (func_ov021_021ffa10(descriptor) != 0) {
                FIELD(s32, state, 0x3d8) = 1;
            } else {
                u32 flags = FIELD(u32, record, 0xc);
                if ((flags & 0x80000000U) != 0) {
                    s32 value = FIELD(s32, descriptor, 8);
                    s32 limit = (s32)((flags >> 12) & 0xf) - 1;
                    if (value == 0 ||
                        FIELD(s32, descriptor, 0xc) >= limit)
                        FIELD(s32, state, 0x3d8) = 1;
                }
            }
            RecordCategory_PublishById(data_021f5128[FIELD(s32, state, 0x54)],
                          FIELD(u16, record, 0));
            Overlay021_SetTransition(state, data_ov021_02202ec8[0],
                                data_ov021_02202ec8[1]);
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Four-state list rebuild/router. State 0 advances; state 1 waits, commits the
 * font and destroys both lists. State 2 rebuilds lists/input animations. A set
 * +0x3D8 disables display selector +0x48 and routes to 0x02202EC0. If the
 * chosen channel remains unavailable, optional +0x37C/+0x380 force graphics
 * restoration, markers are hidden, transition (1,0) begins, and routing uses
 * 0x02202EB8. With an available list, +0x37C/+0x380 route through
 * 0x02202EB0/0x02202EA8; otherwise activate/render the list, show its marker,
 * start (1,0), and advance. State 3 waits then routes through 0x02202EA0.
 * Always update/return zero. List/graphics/UI/transition state changes.
 */
extern "C" s32 func_ov021_02200630(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            Overlay021_DestroyListsAndSavePositions(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2: {
        Overlay021_CreateLists(state);
        Overlay021_RefreshListButtonAnimations(state);
        if (FIELD(s32, state, 0x3d8) != 0) {
            FIELD(s32, state, 0x48) = 0;
            TitlePalette_SetMainBackdrop(0);
            Overlay021_SetTransition(state, data_ov021_02202ec0[0],
                                data_ov021_02202ec0[1]);
            break;
        }
        s32 channel = FIELD(s32, state, 0x2c4);
        void *list = FIELD(void *, state, 0x2a4 + channel * 4);
        if (list == 0) {
            if (FIELD(s32, state, 0x37c) != 0 ||
                FIELD(s32, state, 0x380) != 0) {
                Overlay021_SetupMainBackground(state);
                FIELD(s32, state, 0x37c) = 0;
                FIELD(s32, state, 0x380) = 0;
            }
            FIELD(u32, state, 0x48) &= ~2U;
            FIELD(u16, FIELD(void *, state, 0x98), 0x24) |= 4;
            FIELD(u16, FIELD(void *, state, 0x9c), 0x24) |= 4;
            DisplayBrightness_StartMaskedTransitions(1, 0);
            Overlay021_SetTransition(state, data_ov021_02202eb8[0],
                                data_ov021_02202eb8[1]);
        } else if (FIELD(s32, state, 0x37c) != 0) {
            FIELD(s32, state, 0x37c) = 0;
            Overlay021_SetTransition(state, data_ov021_02202eb0[0],
                                data_ov021_02202eb0[1]);
        } else if (FIELD(s32, state, 0x380) != 0) {
            FIELD(s32, state, 0x380) = 0;
            Overlay021_SetTransition(state, data_ov021_02202ea8[0],
                                data_ov021_02202ea8[1]);
        } else {
            DisplayBrightness_StartMaskedTransitions(1, 0);
            FIELD(void *, state, 0x2c0) = list;
            Overlay021_List_Show(list);
            Overlay021_List_RenderVisibleRows(list);
            Overlay021_List_UpdateSelectionDisplay(list);
            func_ov021_021fee54(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            Overlay021_SetTransition(state, data_ov021_02202ea0[0],
                                data_ov021_02202ea0[1]);
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Four-state auxiliary-action setup. State 0 advances; state 1 waits, closes
 * whichever primary/secondary/list widget is active, resets scene sprites,
 * commits the font, constructs panel +0x390, and advances. State 2 installs
 * graphics mode 0x021FE29C, optionally opens message 4 or 5 based on selected
 * descriptor categories when +0x3E0 is clear, starts (1,0), starts the panel,
 * and advances. State 3 waits for panel completion and transition completion,
 * then emits action 0x3C84, clears +0x3FC, and routes through 0x02202E98;
 * otherwise +0x3FC tracks the negated panel position. Always update/return zero.
 * Panel/list/dialog/graphics/transition state changes; graphics helpers use MMIO.
 */
extern "C" s32 func_ov021_02200840(void *state)
{
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            if (FIELD(void *, state, 0x354) != 0)
                Overlay021_DestroyPrimaryPanel(state);
            else if (FIELD(void *, state, 0x358) != 0)
                func_ov021_021fecd0(state);
            else
                Overlay021_List_Hide(FIELD(void *, state, 0x2c0));
            Overlay021_ResetSceneSprites(state);
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            func_ov021_021fedac(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        Overlay021_SetupAlternateMainBackground(state);
        if (FIELD(s32, state, 0x3e0) == 0) {
            const void *descriptor = FIELD(void *, state, 0x2bc);
            if (Overlay021_Descriptor_GetCategory(descriptor) == 1)
                func_ov021_021ff0e0(state, 4);
            else if (Overlay021Descriptor_GetFlags16_19(descriptor) == 1)
                func_ov021_021ff0e0(state, 5);
        }
        DisplayBrightness_StartMaskedTransitions(1, 0);
        func_ov002_021fbdc0(FIELD(void *, state, 0x390));
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 3:
        if (Overlay002_UpdateFooterAnimation(FIELD(void *, state, 0x390)) != 0 &&
            DisplayBrightness_IsMainTransitionComplete() != 0) {
            SceneSound_PlayPackedEffect(state, 0x3c84);
            FIELD(s32, state, 0x3fc) = 0;
            Overlay021_SetTransition(state, data_ov021_02202e98[0],
                                data_ov021_02202e98[1]);
        } else {
            FIELD(s32, state, 0x3fc) =
                -func_ov002_021fbe60(FIELD(void *, state, 0x390));
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}
