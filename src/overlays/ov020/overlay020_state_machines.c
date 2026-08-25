#include "tingle/types.h"

/* Overlay 20 primary and alternate selectable-list interaction state machines. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov020_021fe450[];
extern const u32 data_ov020_021fe468[];
extern const u32 data_ov020_021fe470[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void InventoryScroll_SetSelectedRow(void *, s32);
extern void InventoryScroll_SaveOrigins(void *);
extern void InventoryScroll_MoveSelectionUp(void *);
extern void InventoryScroll_MoveSelectionDown(void *);
extern s32 InventoryScroll_PageUp(void *);
extern s32 InventoryScroll_PageDown(void *);
extern s32 InventoryScroll_UpdateInterpolation(void *);
extern s32 InventoryScroll_TestUpperArrowPress(void *, void *);
extern s32 InventoryScroll_TestLowerArrowPress(void *, void *);
extern s32 InventoryScroll_TestUpperArrowHold(void *, void *);
extern s32 InventoryScroll_TestLowerArrowHold(void *, void *);
extern s32 InventoryScroll_TestMarkerHit(void *, void *);
extern void InventoryScroll_BeginMarkerDrag(void *, s32);
extern s32 InventoryScroll_UpdateMarkerDrag(void *, void *);
extern void InventoryScroll_EndMarkerDrag(void *, s32);
extern s32 InventoryScroll_UpdateSelectionMovement(void *);
extern void InventoryScroll_ResetPresentationState(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern s32 Overlay020_List_UpdateVisibleRows(void *);
extern void func_ov020_021fd81c(void *, u32, u32, s32);
extern void Overlay020_UpdateSceneUi(void *);
extern void func_ov020_021fde9c(void *);
extern s32 func_ov020_021fdee0(void *);
extern s32 Overlay020_HitTestListRow(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the primary list handler in substate +4. States 0/1 open the list and
 * refresh details while the opening animation completes, deliberately falling
 * through on completion. State 2 handles key bits 0x40/0x80, touch navigation,
 * row hit testing, selection changes, back transitions 0x021FE470/0x021FE468,
 * and close completion. Always refresh scene components through 0x021FDE6C and
 * return zero. UI, action/audio, list selection, detail, and transition state
 * may change; no direct MMIO occurs.
 */
extern "C" s32 Overlay020_UpdatePrimaryList(void *state)
{
    void *list = FIELD(void *, state, 0x1dc);
    void *presentation = FIELD(void *, list, 0x44);
    s32 selected;

    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_ResetPresentationState(presentation);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Opening starts and deliberately continues into its wait state. */
    case 1:
        if (InventoryScroll_UpdateInterpolation(presentation) != 0) {
            func_ov020_021fdee0(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (Overlay020_List_UpdateVisibleRows(list) != 0)
                func_ov020_021fde9c(state);
            break;
        }
        /* Completed opening deliberately continues into interactive state 2. */
    case 2:
        InventoryScroll_SaveOrigins(presentation);
        if ((FIELD(u16, FIELD(void *, state, 0x2c), 0) & 0x40) != 0) {
            InventoryScroll_MoveSelectionUp(presentation);
        } else if ((FIELD(u16, FIELD(void *, state, 0x2c), 0) & 0x80) != 0) {
            InventoryScroll_MoveSelectionDown(presentation);
        } else if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            selected = Overlay020_HitTestListRow(state);
            if (InventoryScroll_TestUpperArrowHold(presentation, (u8 *)state + 0x30) != 0) {
                InventoryScroll_PageUp(presentation);
            } else if (InventoryScroll_TestLowerArrowHold(presentation, (u8 *)state + 0x30) != 0) {
                InventoryScroll_PageDown(presentation);
            } else if ((FIELD(u32, state, 0x20) & 0x20) != 0) {
                if (InventoryScroll_TestUpperArrowPress(presentation, (u8 *)state + 0x30) != 0) {
                    if (InventoryScroll_PageUp(presentation) == 0)
                        SceneSound_PlayPackedEffect(state, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(presentation,
                                          (u8 *)state + 0x30) != 0) {
                    if (InventoryScroll_PageDown(presentation) == 0)
                        SceneSound_PlayPackedEffect(state, 0x16);
                } else if (InventoryScroll_TestMarkerHit(presentation,
                                          (u8 *)state + 0x30) != 0) {
                    func_ov020_021fd81c(state, data_ov020_021fe470[0],
                                        data_ov020_021fe470[1], 0);
                    break;
                } else if (selected >= 0) {
                    if (selected != FIELD(s32, presentation, 0x14)) {
                        SceneSound_PlayPackedEffect(state, 0);
                        InventoryScroll_SetSelectedRow(presentation, selected);
                        func_ov020_021fde9c(state);
                        func_ov020_021fdee0(state);
                    }
                } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x70,
                                          (u8 *)state + 0x30, 0, 4) != 0) {
                    SceneSound_PlayPackedEffect(state, 3);
                    func_ov020_021fd81c(state, data_ov020_021fe468[0],
                                        data_ov020_021fe468[1], 0);
                    break;
                }
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(presentation) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    Overlay020_UpdateSceneUi(state);
    return 0;
}

/*
 * Run the alternate list handler in substate +4. State 0 starts presentation
 * mode 4 and falls through; state 1 waits for opening, optionally synchronizes
 * changed indices with action 8, then advances. State 2 accepts touch input
 * while scene flag bit 4 is set, backing up one state on acceptance; otherwise
 * it closes with mode 6 and transition 0x021FE450. Always refresh scene
 * components and return zero. UI/action/list and transition state may change;
 * no direct MMIO occurs.
 */
extern "C" s32 Overlay020_UpdateAlternateList(void *state)
{
    void *list = FIELD(void *, state, 0x1dc);
    void *presentation = FIELD(void *, list, 0x44);

    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(presentation, 4);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while the opening sequence begins. */
    case 1:
        if (InventoryScroll_UpdateInterpolation(presentation) != 0) {
            if (FIELD(s32, presentation, 0xc) !=
                FIELD(s32, presentation, 0x10)) {
                func_ov020_021fdee0(state);
                SceneSound_StopPackedEffect(state, 8);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (Overlay020_List_UpdateVisibleRows(list) != 0)
                func_ov020_021fde9c(state);
            break;
        }
        /* Completed opening deliberately continues into interactive state 2. */
    case 2:
        InventoryScroll_SaveOrigins(presentation);
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            if (InventoryScroll_UpdateMarkerDrag(presentation, (u8 *)state + 0x30) != 0) {
                SceneSound_PlayPackedEffect(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(presentation, 6);
            func_ov020_021fd81c(state, data_ov020_021fe450[0],
                                data_ov020_021fe450[1], 0);
        }
        break;
    }
    Overlay020_UpdateSceneUi(state);
    return 0;
}
