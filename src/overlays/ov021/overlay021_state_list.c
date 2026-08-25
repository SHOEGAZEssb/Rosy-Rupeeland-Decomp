#include "tingle/types.h"

/* Overlay 21 active-list interaction and generic panel/list closing state handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u32 data_ov021_02202ed8[];
extern const u32 data_ov021_02202ee0[];
extern const u32 data_ov021_02202ee8[];
extern const u32 data_ov021_02202ef0[];
extern const u32 data_ov021_02202ef8[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
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
extern s32 Overlay000_Grid_UpdateTransition(void *);
extern s32 func_ov000_021fc560(void *, void *);
extern s32 Overlay001_Grid_UpdateTransition(void *);
extern s32 func_ov001_021fc348(void *, void *);
extern void Overlay021_List_Hide(void *);
extern void Overlay021_List_UpdateSelectionDisplay(void *);
extern s32 Overlay021_List_HitTestRow(void *, const void *);
extern s32 Overlay021_List_UpdateVisibleRows(void *);
extern void Overlay021_SetTransition(void *, u32, u32);
extern void Overlay021_UpdateScene(void *);
extern void func_ov021_021fee54(void *);
extern s32 func_ov021_021ff274(void *);
extern void func_ov021_021ff5b8(void *);
extern void func_ov021_021ff644(void *);
extern void func_ov021_021ffcb4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the primary active-list handler. States 0/1 open controller
 * list(+0x2C0)->+0x58 and refresh list/marker while waiting. State 2 handles
 * key bits 0x40/0x80, touch navigation, row hit testing, selection changes,
 * repeated-selection action through 0x021FFCB4, active-channel and cancel
 * helpers, back transition 0x02202EF8, and close completion. A changed row
 * enters state 10 for a nine-frame delay before reopening. State 3 waits for
 * cancel transition, resets dialog/font, hides list/markers, starts (1,0), and
 * routes through 0x02202EF0. Always process prompt/update components and return
 * zero. Input/list/dialog/action/transition state changes; no direct MMIO.
 */
extern "C" s32 func_ov021_021ffd5c(void *state)
{
    void *list = FIELD(void *, state, 0x2c0);
    void *controller = FIELD(void *, list, 0x58);
    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_ResetPresentationState(controller);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through into opening wait. */
    case 1:
        if (InventoryScroll_UpdateInterpolation(controller) != 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (Overlay021_List_UpdateVisibleRows(list) != 0)
                func_ov021_021fee54(state);
            break;
        }
        /* Completed opening deliberately continues into interaction. */
    case 2: {
        InventoryScroll_SaveOrigins(controller);
        u16 keys = FIELD(u16, FIELD(void *, state, 0x2c), 0);
        if ((keys & 0x40) != 0) {
            InventoryScroll_MoveSelectionUp(controller);
        } else if ((keys & 0x80) != 0) {
            InventoryScroll_MoveSelectionDown(controller);
        } else if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            s32 selected = Overlay021_List_HitTestRow(list,
                                               (u8 *)state + 0x30);
            if (InventoryScroll_TestUpperArrowHold(controller, (u8 *)state + 0x30) != 0) {
                InventoryScroll_PageUp(controller);
            } else if (InventoryScroll_TestLowerArrowHold(controller,
                                     (u8 *)state + 0x30) != 0) {
                InventoryScroll_PageDown(controller);
            } else if ((FIELD(u32, state, 0x20) & 0x20) != 0) {
                if (InventoryScroll_TestUpperArrowPress(controller,
                                  (u8 *)state + 0x30) != 0) {
                    if (InventoryScroll_PageUp(controller) == 0)
                        SceneSound_PlayPackedEffect(state, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(controller,
                                         (u8 *)state + 0x30) != 0) {
                    if (InventoryScroll_PageDown(controller) == 0)
                        SceneSound_PlayPackedEffect(state, 0x16);
                } else if (InventoryScroll_TestMarkerHit(controller,
                                         (u8 *)state + 0x30) != 0) {
                    Overlay021_SetTransition(state,
                                        data_ov021_02202ef8[0],
                                        data_ov021_02202ef8[1]);
                    break;
                } else if (selected >= 0) {
                    if (selected != FIELD(s32, controller, 0x14)) {
                        SceneSound_PlayPackedEffect(state, 0);
                        InventoryScroll_SetSelectedRow(controller, selected);
                        Overlay021_List_UpdateSelectionDisplay(list);
                        func_ov021_021fee54(state);
                        FIELD(s32, state, 4) = 10;
                        FIELD(s32, state, 8) = 0;
                    } else {
                        func_ov021_021ffcb4(state);
                    }
                    break;
                } else {
                    s32 channel = FIELD(s32, state, 0x2c4);
                    if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x14c +
                                      channel * 0xac,
                                      (u8 *)state + 0x30, 0, 4) != 0) {
                        func_ov021_021ffcb4(state);
                        break;
                    }
                    if (SpriteMotionController_BeginHitResponse((u8 *)state + 0xa0,
                                      (u8 *)state + 0x30, 0, 4) != 0) {
                        SceneSound_PlayPackedEffect(state, 3);
                        DisplayBrightness_StartMaskedTransitions(1, -16);
                        FIELD(s32, state, 4)++;
                        FIELD(s32, state, 8) = 0;
                        break;
                    }
                }
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(controller) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x388));
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            FIELD(u32, state, 0x48) &= ~2U;
            FIELD(u16, FIELD(void *, state, 0x98), 0x24) |= 4;
            FIELD(u16, FIELD(void *, state, 0x9c), 0x24) |= 4;
            Overlay021_List_Hide(list);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            Overlay021_SetTransition(state, data_ov021_02202ef0[0],
                                data_ov021_02202ef0[1]);
        }
        break;
    case 10:
        FIELD(s32, state, 8)++;
        if (FIELD(s32, state, 8) > 8) {
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}

/*
 * Generic three-state close handler for overlay-0 panel +0x354, overlay-1
 * panel +0x358, or the active list +0x2C0. State 0 starts controller mode 4 and
 * falls through. State 1 waits for opening, emits action 8 when controller
 * indices +0x0C/+0x10 differ, or refreshes the appropriate panel/list while
 * waiting. State 2 accepts panel/list touch input while scene flag bit 4 is set,
 * emitting action 8 and backing up one state; when the flag is clear, close
 * controller mode 6 and route through 0x02202EE8, 0x02202EE0, or 0x02202ED8
 * according to active widget. Always process prompt/update components and
 * return zero. Input/panel/list/action/transition state changes; no MMIO.
 */
extern "C" s32 func_ov021_022000f0(void *state)
{
    void *primary = FIELD(void *, state, 0x354);
    void *secondary = FIELD(void *, state, 0x358);
    void *controller;
    if (primary != 0)
        controller = FIELD(void *, primary, 0x26c);
    else if (secondary != 0)
        controller = FIELD(void *, secondary, 0x1bc);
    else
        controller = FIELD(void *, FIELD(void *, state, 0x2c0), 0x58);

    func_ov021_021ff274(state);
    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(controller, 4);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through into opening wait. */
    case 1:
        if (InventoryScroll_UpdateInterpolation(controller) != 0) {
            if (FIELD(s32, controller, 0xc) !=
                FIELD(s32, controller, 0x10))
                SceneSound_StopPackedEffect(state, 8);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else if (primary != 0) {
            if (Overlay000_Grid_UpdateTransition(primary) != 0)
                func_ov021_021ff5b8(state);
            break;
        } else if (secondary != 0) {
            if (Overlay001_Grid_UpdateTransition(secondary) != 0)
                func_ov021_021ff644(state);
            break;
        } else {
            if (Overlay021_List_UpdateVisibleRows(FIELD(void *, state, 0x2c0)) != 0)
                func_ov021_021fee54(state);
            break;
        }
        /* Completed opening deliberately continues into input state 2. */
    case 2:
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            s32 accepted;
            if (primary != 0)
                accepted = func_ov000_021fc560(primary,
                                               (u8 *)state + 0x30);
            else if (secondary != 0)
                accepted = func_ov001_021fc348(secondary,
                                               (u8 *)state + 0x30);
            else {
                InventoryScroll_SaveOrigins(controller);
                accepted = InventoryScroll_UpdateMarkerDrag(controller,
                                         (u8 *)state + 0x30);
            }
            if (accepted != 0) {
                SceneSound_PlayPackedEffect(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(controller, 6);
            if (primary != 0)
                Overlay021_SetTransition(state, data_ov021_02202ee8[0],
                                    data_ov021_02202ee8[1]);
            else if (secondary != 0)
                Overlay021_SetTransition(state, data_ov021_02202ee0[0],
                                    data_ov021_02202ee0[1]);
            else
                Overlay021_SetTransition(state, data_ov021_02202ed8[0],
                                    data_ov021_02202ed8[1]);
        }
        break;
    }
    Overlay021_UpdateScene(state);
    return 0;
}
