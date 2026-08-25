#include "tingle/types.h"

/* Overlay 22 hub, descriptor-action, menu, confirmation, and destructor state machines. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define ADVANCE(scene) do { ++FIELD(s32, scene, 4); FIELD(s32, scene, 8) = 0; } while (0)
#define CALLBACK(scene, table) func_ov022_021fdd1c(scene, table[0], table[1])

extern void *data_020f4e14;
extern const u8 data_020d782e[];
extern void *data_ov022_022004e8[];
extern void *data_ov022_022004f0[];
extern void *data_ov022_022004f8[];
extern void *data_ov022_02200510[];
extern void *data_ov022_02200518[];
extern void *data_ov022_02200520[];
extern void *data_ov022_02200530[];
extern void *data_ov022_02200548[];
extern void *data_ov022_02200550[];
extern void *data_ov022_02200560[];
extern void *data_ov022_02200654;
extern void *gGameWork;
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 DisplayBrightness_IsSubTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern void IndexedSelectionController_ResetTransition(void *);
extern void IndexedSelectionController_SnapTransitionOrigin(void *);
extern void IndexedSelectionController_Increment(void *);
extern s32 IndexedSelectionController_AdvanceTransition(void *);
extern s32 IndexedSelectionController_AdvancePacing(void *);
extern void InventoryScroll_SetSelectedRow(void *, s32);
extern void InventoryScroll_SaveOrigins(void *);
extern s32 InventoryScroll_MoveSelectionUp(void *);
extern s32 InventoryScroll_MoveSelectionDown(void *);
extern s32 InventoryScroll_PageUp(void *);
extern s32 InventoryScroll_PageDown(void *);
extern s32 InventoryScroll_UpdateInterpolation(void *);
extern void InventoryScroll_UpdatePresentation(void *);
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
extern s32 Presentation_InterpolateScalar(void *, s32, s32, s32);
extern void PresentationList_DeleteAll(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_02095988(void *, s32);
extern void func_02092260(void *, s32);
extern void func_02092288(void *, s32);
extern void func_020922f0(void *, s32);
extern void GameWork_ClearFlag(void *, u16);
extern s32 func_ov022_021fcfd4(void *, s32, s32, s32);
extern s32 func_ov022_021fd068(void *);
extern void func_ov022_021fdafc(void *);
extern void func_ov022_021fdb38(void *);
extern s32 func_ov022_021fdc30(void *, void *);
extern void *func_ov022_021fdca0(void *);
extern s32 func_ov022_021fdcb4(void *);
extern void func_ov022_021fdd1c(void *, void *, void *);
extern void func_ov022_021fe544(void *);
extern void func_ov022_021fe688(void *);
extern void func_ov022_021fe81c(void *);
extern void func_ov022_021fe898(void *);
extern void func_ov022_021fe920(void *);
extern void func_ov022_021fe94c(void *);
extern void func_ov022_021fe9e8(void *);
extern void func_ov022_021feac8(void *);
extern void func_ov022_021feb78(void *);
extern void func_ov022_021fed74(void *);
extern void func_ov022_021fef48(void *);
extern void func_ov022_021fefe0(void *);
extern void func_ov022_021ff048(void *);
extern void func_ov022_021ff0d0(void *);
extern void func_ov022_021ff1e4(void *);
extern void func_ov022_021ff220(void *, s32);
extern void func_ov022_021ff2c4(void *, s32);
extern s32 func_ov022_021ff368(void *);
extern s32 func_ov022_021fceb0(void *);
#ifdef __cplusplus
}
#endif

/*
 * Runs the 13-step hub-selection state machine. It services dialog input,
 * opens either the descriptor collection or menu, animates the corresponding
 * embedded controller, creates/destroys overlay-46 selection state, routes
 * sounds and callback pairs, and handles the one-time 0x312 message path.
 * Scene step/timer, UI, dialog, audio, callbacks, flags, and teardown state
 * may change. The function always returns zero.
 */
extern "C" s32 func_ov022_021ff5ec(void *scene)
{
    func_ov022_021ff368(scene);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        FIELD(u32, scene, 0x48) &= ~2u;
        FIELD(u16, FIELD(void *, scene, 0xa4), 0x24) |= 4;
        func_ov022_021ff1e4(scene);
        if (FIELD(s32, scene, 0x2b0)) {
            FIELD(s32, scene, 4) = 10;
            FIELD(s32, scene, 8) = 0;
            break;
        }
        func_02095928((u8 *)scene + 0xa8);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete())
            ADVANCE(scene);
        break;
    case 2:
        if (!(FIELD(u32, scene, 0x20) & 0x20))
            break;
        if (func_02095860((u8 *)scene + 0xa8, (u8 *)scene + 0x30, 0, 4)) {
            TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
            func_02092260(scene, 3);
            CALLBACK(scene, data_ov022_02200530);
        } else if (func_02095860((u8 *)scene + 0x154,
                                 (u8 *)scene + 0x30, 0, 4)) {
            if (FIELD(void *, scene, 0x2b4)) {
                TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
                func_02092260(scene, 2);
                FIELD(s32, scene, 0x2c0) = 0;
                DisplayBrightness_StartMaskedTransitions(1, -16);
                ADVANCE(scene);
            } else {
                func_02092260(scene, 9);
            }
        } else if (func_02095860((u8 *)scene + 0x200,
                                 (u8 *)scene + 0x30, 0, 4)) {
            if (FIELD(void *, scene, 0x2b8)) {
                TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
                func_02092260(scene, 2);
                FIELD(s32, scene, 0x2c0) = 1;
                DisplayBrightness_StartMaskedTransitions(1, -16);
                ADVANCE(scene);
            } else {
                func_02092260(scene, 9);
            }
        }
        break;
    case 3:
        if (!DisplayBrightness_IsMainTransitionComplete())
            break;
        if (FIELD(s32, scene, 0x2c0) == 0) {
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            func_02095940((u8 *)scene + 0xa8);
            func_02095820((u8 *)scene + 0x154, -64, 64);
            func_02095820((u8 *)scene + 0x200, -64, 112);
            func_ov022_021fe898(scene);
        } else {
            func_ov022_021fdafc(FIELD(void *, scene, 0x2b8));
            func_ov022_021fdb38(FIELD(void *, scene, 0x2b8));
            func_ov022_021fefe0(scene);
            func_ov022_021ff048(scene);
            func_02095820((u8 *)scene + 0x154, -64, 64);
            func_02095820((u8 *)scene + 0x200, 128, 170);
        }
        DisplayBrightness_StartMaskedTransitions(1, 0);
        ADVANCE(scene);
        break;
    case 4:
        if (!DisplayBrightness_IsMainTransitionComplete())
            break;
        if (FIELD(s32, scene, 0x2c0) == 0) {
            GameWork_ClearFlag(gGameWork, 0x3ca);
            CALLBACK(scene, data_ov022_02200550);
        } else {
            CALLBACK(scene, data_ov022_02200518);
        }
        break;
    case 10:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            FIELD(s32, scene, 0x2b0) = 0;
            func_ov022_021ff2c4(scene, 0x312);
            func_02095820((u8 *)scene + 0x200, 128, 208);
            func_02095988((u8 *)scene + 0x200, 2);
            ADVANCE(scene);
        }
        break;
    case 11:
        if (func_ov022_021ff368(scene)) {
            func_02092260(scene, 0x2e);
            func_02095928((u8 *)scene + 0x200);
            FIELD(s32, scene, 0x27c) = 30;
            FIELD(s32, scene, 0x280) = 0;
            ADVANCE(scene);
        }
        break;
    case 12:
        if (func_ov022_021fceb0((u8 *)scene + 0x200)) {
            func_02095928((u8 *)scene + 0xa8);
            FIELD(s32, scene, 4) = 2;
            FIELD(s32, scene, 8) = 0;
        } else {
            s32 y = Presentation_InterpolateScalar((u8 *)scene + 0x200, 4, 208, 112);
            func_02095820((u8 *)scene + 0x200, 128, y);
        }
        break;
    }
    func_ov022_021ff0d0(scene);
    return 0;
}

/*
 * Runs the descriptor-action animation. It resolves the selected record,
 * emits random particles during two waits, starts currency-HUD effects keyed by the
 * descriptor and completion table, presents action/progress messages, advances
 * the collection, interpolates overlay-46 selection, and rebuilds collections
 * before returning to the hub callback. Scene, collection, effects, messages,
 * audio, callbacks, and teardown state may change; returns zero.
 */
extern "C" s32 func_ov022_021ffa1c(void *scene)
{
    func_ov022_021fd068(FIELD(void *, scene, 0x354));
    switch (FIELD(s32, scene, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(2, -8);
        func_ov022_021fe94c(scene);
        IndexedSelectionController_ResetTransition(FIELD(void *, scene, 0x2b4));
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (DisplayBrightness_IsSubTransitionComplete()) {
            func_02092260(scene, 0x30);
            ADVANCE(scene);
        }
        break;
    case 2:
        if (++FIELD(s32, scene, 8) <= 60) {
            func_ov022_021fe9e8(scene);
        } else {
            DisplayBrightness_StartMaskedTransitions(2, 0);
            DisplayBrightness_StartMaskedTransitions(1, -8);
            func_020922f0(scene, 0x9d);
            func_ov022_021feac8(scene);
            ADVANCE(scene);
        }
        break;
    case 3:
        if (func_ov022_021ff368(scene)) {
            s32 currency = GamePhaseCurrencyHud_GetCurrency(
                gGamePhaseCurrencyHud);
            s32 id = FIELD(u16, FIELD(void *, scene, 0x360), 0x18);
            s32 duration = func_ov022_021fcfd4(
                FIELD(void *, scene, 0x354), currency, id, 0);
            GamePhaseCurrencyHud_AddCurrency(
                gGamePhaseCurrencyHud, id, duration);
            ADVANCE(scene);
        } else {
            func_ov022_021fe9e8(scene);
        }
        break;
    case 4:
        if (FIELD(s32, FIELD(void *, scene, 0x354), 0x54) == 0) {
            func_ov022_021feb78(scene);
            ADVANCE(scene);
        } else {
            func_ov022_021fe9e8(scene);
        }
        break;
    case 5:
        if (func_ov022_021ff368(scene)) {
            if (FIELD(s32, scene, 0x2ac)) {
                s32 offset = FIELD(s32, scene, 0x358) * 0x34;
                s32 id = FIELD(u16, data_020d782e, offset);
                s32 currency = GamePhaseCurrencyHud_GetCurrency(
                    gGamePhaseCurrencyHud);
                s32 duration = func_ov022_021fcfd4(
                    FIELD(void *, scene, 0x354), currency, id, 0);
                GamePhaseCurrencyHud_AddCurrency(
                    gGamePhaseCurrencyHud, id, duration);
            }
            ADVANCE(scene);
        }
        break;
    case 6:
        if (FIELD(s32, FIELD(void *, scene, 0x354), 0x54) == 0) {
            TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
            void *collection = FIELD(void *, scene, 0x2b4);
            IndexedSelectionController_SnapTransitionOrigin(collection);
            IndexedSelectionController_Increment(collection);
            if (IndexedSelectionController_AdvanceTransition(collection)) {
                DisplayBrightness_StartMaskedTransitions(1, 0);
                ADVANCE(scene);
            } else {
                DisplayBrightness_StartMaskedTransitions(1, -16);
                FIELD(s32, scene, 4) = 20;
                FIELD(s32, scene, 8) = 0;
            }
        }
        break;
    case 7:
        if (IndexedSelectionController_AdvancePacing(FIELD(void *, scene, 0x2b4))) {
            FIELD(s32, scene, 4) = 0;
            FIELD(s32, scene, 8) = 0;
        }
        func_ov022_021fed74(scene);
        break;
    case 20:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            func_ov022_021fe920(scene);
            func_ov022_021fe81c(scene);
            func_ov022_021fe688(scene);
            func_ov022_021fef48(scene);
            func_ov022_021fe544(scene);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            CALLBACK(scene, data_ov022_022004f0);
        }
        break;
    }
    func_ov022_021ff0d0(scene);
    return 0;
}

/*
 * Runs the scrollable-menu interaction state machine. It opens and updates the
 * menu UI, handles keys/touch/drag gestures, keeps cursor/message state aligned
 * with selection, rejects unavailable entries, routes confirm/cancel callback
 * pairs, and closes menu resources after the transition. Scene/menu/dialog,
 * input, audio, callback, and teardown state may change; returns zero.
 */
extern "C" s32 func_ov022_021ffd8c(void *scene)
{
    void *menu = FIELD(void *, scene, 0x2b8);
    void *ui = FIELD(void *, menu, 0x30);
    func_ov022_021ff368(scene);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        InventoryScroll_ResetPresentationState(ui);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (InventoryScroll_UpdateInterpolation(ui)) {
            ADVANCE(scene);
        } else if (func_ov022_021fdcb4(menu)) {
            func_ov022_021fefe0(scene);
            func_ov022_021ff048(scene);
        }
        break;
    case 2: {
        InventoryScroll_SaveOrigins(ui);
        u16 keys = FIELD(u16, FIELD(void *, scene, 0x2c), 0);
        if (keys & 0x40) {
            InventoryScroll_MoveSelectionUp(ui);
        } else if (keys & 0x80) {
            InventoryScroll_MoveSelectionDown(ui);
        } else if (FIELD(u32, scene, 0x20) & 0x10) {
            s32 hit = func_ov022_021fdc30(menu, (u8 *)scene + 0x30);
            if (InventoryScroll_TestUpperArrowHold(ui, (u8 *)scene + 0x30)) {
                InventoryScroll_PageUp(ui);
            } else if (InventoryScroll_TestLowerArrowHold(ui, (u8 *)scene + 0x30)) {
                InventoryScroll_PageDown(ui);
            } else if (FIELD(u32, scene, 0x20) & 0x20) {
                if (InventoryScroll_TestUpperArrowPress(ui, (u8 *)scene + 0x30)) {
                    if (!InventoryScroll_PageUp(ui)) func_02092260(scene, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(ui, (u8 *)scene + 0x30)) {
                    if (!InventoryScroll_PageDown(ui)) func_02092260(scene, 0x16);
                } else if (InventoryScroll_TestMarkerHit(ui, (u8 *)scene + 0x30)) {
                    CALLBACK(scene, data_ov022_02200548);
                    break;
                } else if (hit >= 0) {
                    if (hit != FIELD(s32, ui, 0x14)) {
                        func_02092260(scene, 0);
                        InventoryScroll_SetSelectedRow(ui, hit);
                        func_ov022_021fefe0(scene);
                        func_ov022_021ff048(scene);
                        FIELD(s32, scene, 4) = 10;
                        FIELD(s32, scene, 8) = 0;
                        break;
                    }
                    void *entry = func_ov022_021fdca0(menu);
                    if (FIELD(s32, entry, 4)) {
                        func_02092260(scene, 9);
                    } else {
                        TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
                        func_02092260(scene, 2);
                        CALLBACK(scene, data_ov022_022004e8);
                    }
                    break;
                }
            }
        }
        if (func_02095860((u8 *)scene + 0x200,
                          (u8 *)scene + 0x30, 0, 4)) {
            void *entry = func_ov022_021fdca0(menu);
            if (FIELD(s32, entry, 4)) func_02092260(scene, 9);
            else {
                TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
                func_02092260(scene, 2);
                CALLBACK(scene, data_ov022_02200560);
            }
        } else if (func_02095860((u8 *)scene + 0xa8,
                                 (u8 *)scene + 0x30, 0, 4)) {
            func_02092260(scene, 3);
            DisplayBrightness_StartMaskedTransitions(1, -16);
            ADVANCE(scene);
        } else if (InventoryScroll_UpdateSelectionMovement(ui)) {
            func_02092260(scene, 0);
            --FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            TitleDialog_ClearTextRect(FIELD(void *, scene, 0x2cc));
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            FIELD(u32, scene, 0x48) &= ~2u;
            FIELD(u16, FIELD(void *, scene, 0xa4), 0x24) |= 4;
            GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, ui, 0x50));
            DisplayBrightness_StartMaskedTransitions(1, 0);
            CALLBACK(scene, data_ov022_02200510);
        }
        break;
    case 10:
        if (++FIELD(s32, scene, 8) > 8) {
            FIELD(s32, scene, 4) = 0;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    func_ov022_021ff0d0(scene);
    return 0;
}

/*
 * Runs the short menu-selection recenter state. It starts UI animation 4,
 * waits for completion while maintaining the cursor, optionally plays effect
 * 8 when scroll and target differ, then either handles a touch recenter or
 * restores the selected message and returns to the menu callback. UI, audio,
 * callback, message, and teardown state may change; returns zero.
 */
extern "C" s32 func_ov022_022001a0(void *scene)
{
    void *ui = FIELD(void *, FIELD(void *, scene, 0x2b8), 0x30);
    func_ov022_021ff368(scene);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(ui, 4);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (InventoryScroll_UpdateInterpolation(ui)) {
            if (FIELD(s32, ui, 0xc) != FIELD(s32, ui, 0x10))
                func_02092288(scene, 8);
            ADVANCE(scene);
        } else if (func_ov022_021fdcb4(FIELD(void *, scene, 0x2b8))) {
            func_ov022_021fefe0(scene);
        }
        break;
    case 2:
        if (FIELD(u32, scene, 0x20) & 0x10) {
            InventoryScroll_SaveOrigins(ui);
            if (InventoryScroll_UpdateMarkerDrag(ui, (u8 *)scene + 0x30)) {
                func_02092260(scene, 8);
                --FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
                break;
            }
        } else {
            InventoryScroll_EndMarkerDrag(ui, 6);
            func_ov022_021ff048(scene);
            CALLBACK(scene, data_ov022_02200520);
        }
        break;
    }
    func_ov022_021ff0d0(scene);
    return 0;
}

/*
 * Runs the five-step confirmed-menu action. It increments game-work halfword
 * +0x98, closes the menu, starts a currency-HUD effect keyed by selected descriptor
 * word +0x24 (with its negated external key), waits for the emitter, presents
 * message key 6 and waits for acknowledgement, then after 60 frames stores
 * descriptor halfword +2 at game-work +0x204, clears descriptor flag +0x20,
 * and installs the completion callback. Persistent game work, effects,
 * messages, callbacks, and teardown state may change; returns zero.
 */
extern "C" s32 func_ov022_022002e4(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        ++FIELD(s16, gGameWork, 0x98);
        DisplayBrightness_StartMaskedTransitions(1, -8);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            void *descriptor = FIELD(void *, scene, 0x2bc);
            s32 id = FIELD(s32, descriptor, 0x24);
            s32 currency = GamePhaseCurrencyHud_GetCurrency(
                gGamePhaseCurrencyHud);
            s32 duration = func_ov022_021fcfd4(
                FIELD(void *, scene, 0x354), currency, id, 1);
            GamePhaseCurrencyHud_AddCurrency(
                gGamePhaseCurrencyHud, -id, duration);
            ADVANCE(scene);
        }
        break;
    case 2:
        if (func_ov022_021fd068(FIELD(void *, scene, 0x354)) &&
            FIELD(s32, FIELD(void *, scene, 0x354), 0x54) == 0) {
            func_ov022_021ff220(scene, 6);
            ADVANCE(scene);
        }
        break;
    case 3:
        if (func_ov022_021ff368(scene))
            ADVANCE(scene);
        break;
    case 4:
        if (++FIELD(s32, scene, 8) > 60) {
            void *descriptor = FIELD(void *, scene, 0x2bc);
            FIELD(u16, gGameWork, 0x204) = FIELD(u16, descriptor, 2);
            GameWork_ClearFlag(gGameWork, FIELD(u16, descriptor, 0x20));
            CALLBACK(scene, data_ov022_022004f8);
        }
        break;
    }
    func_ov022_021ff0d0(scene);
    return 0;
}

/*
 * Plain heap destructor thunk. It frees the supplied allocation and returns
 * the original pointer value; heap ownership changes and no SDK/MMIO state is
 * otherwise touched.
 */
extern "C" void *func_ov022_02200478(void *object)
{
    Heap_Free(object);
    return object;
}

/*
 * Derived heap destructor thunk. It restores vtable data_ov022_02200654,
 * invokes base cleanup PresentationList_DeleteAll, frees the object, and returns the original
 * pointer. Object/vtable and heap ownership change; no hardware state changes.
 */
extern "C" void *func_ov022_0220048c(void *object)
{
    FIELD(void *, object, 0) = data_ov022_02200654;
    PresentationList_DeleteAll(object);
    Heap_Free(object);
    return object;
}
