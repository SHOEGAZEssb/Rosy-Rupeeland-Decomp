#include "tingle/types.h"

/* Overlay 23 main/group list navigation, detail-dialog transitions, and terminal state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define ADVANCE(s) do { ++FIELD(s32, s, 4); FIELD(s32, s, 8) = 0; } while (0)
#define CALLBACK(s, t) func_ov023_021fd9d0(s, t[0], t[1])

extern void *data_ov023_021ffb30[];
extern void *data_ov023_021ffb38[];
extern void *data_ov023_021ffb40[];
extern void *data_ov023_021ffb48[];
extern void *data_ov023_021ffb58[];
extern void *data_ov023_021ffb68[];
extern void *data_ov023_021ffb70[];
extern void *data_ov023_021ffb78[];
extern void *data_ov023_021ffb80[];
extern void *data_ov023_021ffb88[];
extern void *data_ov023_021ffb90[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern const void *RecordDescriptor_GetMessage(void *, s32);
extern void TitleInterpolatedValue_Configure(void *, s32, s32, s32, s32);
extern s32 TitleInterpolatedValue_Evaluate(void *, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void IndexedSelectionController_SnapTransitionOrigin(void *);
extern void IndexedSelectionController_IncrementWrap(void *);
extern void IndexedSelectionController_DecrementWrap(void *);
extern s32 IndexedSelectionController_GetLastDirection(void *);
extern s32 IndexedSelectionController_AdvanceTransition(void *);
extern s32 IndexedSelectionController_AdvancePacing(void *);
extern void InventoryScroll_SetSelectedRow(void *, s32);
extern void InventoryScroll_SaveOrigins(void *);
extern s32 InventoryScroll_MoveSelectionUp(void *);
extern s32 InventoryScroll_MoveSelectionDown(void *);
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
extern void PresentationScalar_SetImmediate(void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern s32 SpriteMotionController_BeginHitResponse(void *, void *, s32, s32);
extern void SpriteMotionController_SetPosition(void *, s32, s32);
extern void SpriteMotionController_Show(void *);
extern void func_ov023_021fd08c(void *);
extern void func_ov023_021fd0dc(void *);
extern void func_ov023_021fd268(void *);
extern s32 func_ov023_021fd328(void *, void *);
extern void *func_ov023_021fd398(void *);
extern s32 func_ov023_021fd3b0(void *);
extern void func_ov023_021fd730(void *);
extern void func_ov023_021fd780(void *);
extern void func_ov023_021fd7a8(void *);
extern s32 func_ov023_021fd8e4(void *, void *);
extern void *func_ov023_021fd954(void *);
extern s32 func_ov023_021fd968(void *);
extern void func_ov023_021fd9d0(void *, void *, void *);
extern void func_ov023_021fe6e4(void *);
extern s32 func_ov023_021fe694(void *);
extern s32 func_ov023_021fe6bc(void *);
extern void func_ov023_021fe77c(void *);
extern void func_ov023_021fe804(void *, const void *, void *);
extern s32 func_ov023_021fe88c(void *);
extern void func_ov023_021fe994(void *, s32);
extern s32 func_ov023_021fea34(void *);
extern void *func_ov023_021fea88(void *);
extern void func_ov023_021feb60(void *);
extern s32 func_ov023_021fef54(void *);
extern void func_ov023_021ff2a0(void *);
extern void func_ov045_0220c274(void *, s32);
extern void Overlay045Graphics_SetUniformValue(void *, s32);
#ifdef __cplusplus
}
#endif

static void select_row(void *scene, void *ui, s32 row)
{
    SceneSound_PlayPackedEffect(scene, 0);
    InventoryScroll_SetSelectedRow(ui, row);
    func_ov023_021fe6e4(scene);
    FIELD(s32, scene, 4) = 20;
    FIELD(s32, scene, 8) = 0;
}

/*
 * Main-record list state machine. Steps 0/1 open and settle the list; step 2
 * handles keys, touch/drag, row selection, confirm/cancel controllers, and the
 * mode-switch controller; step 10 waits for that controller before hiding the
 * main list and entering the matching grouped list; step 20 debounces selection
 * changes. Scene/list/UI/audio/callback/overlay state may change. Per-frame
 * maintenance always runs and the function returns zero.
 */
extern "C" s32 func_ov023_021febbc(void *scene)
{
    void *list = FIELD(void *, scene, 0x390);
    void *ui = FIELD(void *, list, 0x38);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov023_021fd268(list);
        func_ov023_021fd08c(list);
        func_ov023_021fe6e4(scene);
        InventoryScroll_ResetPresentationState(ui);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (InventoryScroll_UpdateInterpolation(ui)) ADVANCE(scene);
        else if (func_ov023_021fd3b0(list)) func_ov023_021fe6e4(scene);
        break;
    case 2: {
        InventoryScroll_SaveOrigins(ui);
        u16 keys = FIELD(u16, FIELD(void *, scene, 0x2c), 0);
        if (keys & 0x40) InventoryScroll_MoveSelectionUp(ui);
        else if (keys & 0x80) InventoryScroll_MoveSelectionDown(ui);
        else if (FIELD(u32, scene, 0x20) & 0x10) {
            s32 hit = func_ov023_021fd328(list, (u8 *)scene + 0x30);
            if (InventoryScroll_TestUpperArrowHold(ui, (u8 *)scene + 0x30)) InventoryScroll_PageUp(ui);
            else if (InventoryScroll_TestLowerArrowHold(ui, (u8 *)scene + 0x30)) InventoryScroll_PageDown(ui);
            else if ((FIELD(u32, scene, 0x20) & 0x20) &&
                     InventoryScroll_TestMarkerHit(ui, (u8 *)scene + 0x30)) {
                CALLBACK(scene, data_ov023_021ffb90);
                break;
            } else if (hit >= 0) {
                if (hit != FIELD(s32, ui, 0x14)) select_row(scene, ui, hit);
                else func_ov023_021feb60(scene);
                break;
            }
        }
        if (SpriteMotionController_BeginHitResponse((u8 *)scene + 0xd0,
                          (u8 *)scene + 0x30, 0, 4)) {
            func_ov023_021feb60(scene);
        } else if (SpriteMotionController_BeginHitResponse((u8 *)scene + 0x17c,
                                 (u8 *)scene + 0x30, 0, 4)) {
            SceneSound_PlayPackedEffect(scene, 3);
            CALLBACK(scene, data_ov023_021ffb88);
        } else {
            FIELD(s32, scene, 0x38c) = func_ov023_021fea34(scene);
            if (FIELD(s32, scene, 0x38c) == 1) {
                SceneSound_PlayPackedEffect(scene, 11);
                FIELD(s32, scene, 4) = 10;
                FIELD(s32, scene, 8) = 0;
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(ui)) {
            SceneSound_PlayPackedEffect(scene, 0);
            --FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 10: {
        void *controller = (u8 *)scene + 0x228 +
                           FIELD(s32, scene, 0x38c) * 0xac;
        if (func_ov023_021fef54(controller)) {
            func_ov023_021fd0dc(list);
            FIELD(void *, scene, 0x478) = func_ov023_021fea88(scene);
            func_ov023_021fe994(scene, FIELD(s32, scene, 0x38c));
            func_ov023_021fe6e4(scene);
            CALLBACK(scene, data_ov023_021ffb80);
        }
        break;
    }
    case 20:
        if (++FIELD(s32, scene, 8) > 8) {
            FIELD(s32, scene, 4) = 0;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    func_ov023_021fe77c(scene);
    return 0;
}

/* Returns one when controller progress +0x80 reaches target +0x7C, else zero. */
extern "C" s32 func_ov023_021fef54(void *controller)
{
    return FIELD(s32, controller, 0x80) >= FIELD(s32, controller, 0x7c);
}

static s32 recenter_machine(void *scene, void *collection, void **next)
{
    void *ui = FIELD(void *, collection,
                     collection == FIELD(void *, scene, 0x390) ? 0x38 : 0x48);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(ui, 4);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (InventoryScroll_UpdateInterpolation(ui)) {
            if (FIELD(s32, ui, 0xc) != FIELD(s32, ui, 0x10))
                SceneSound_StopPackedEffect(scene, 8);
            ADVANCE(scene);
        } else {
            if (collection == FIELD(void *, scene, 0x390))
                func_ov023_021fd3b0(collection);
            else func_ov023_021fd968(collection);
            func_ov023_021fe6e4(scene);
        }
        break;
    case 2:
        InventoryScroll_SaveOrigins(ui);
        if (FIELD(u32, scene, 0x20) & 0x10) {
            if (InventoryScroll_UpdateMarkerDrag(ui, (u8 *)scene + 0x30)) {
                SceneSound_PlayPackedEffect(scene, 8);
                --FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(ui, 6);
            CALLBACK(scene, next);
        }
        break;
    }
    func_ov023_021fe77c(scene);
    return 0;
}

/* Recenters the main list after a touch selection; returns zero. */
extern "C" s32 func_ov023_021fef6c(void *scene)
{
    return recenter_machine(scene, FIELD(void *, scene, 0x390),
                            data_ov023_021ffb78);
}

static s32 detail_machine(void *scene, void *entry, void **next)
{
    void *transition = (u8 *)scene + 0x4dc;
    switch (FIELD(s32, scene, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        TitleInterpolatedValue_Configure(transition, 4, -128, 0, 8);
        ADVANCE(scene);
        /* fall through */
    case 1: {
        func_ov045_0220c274(FIELD(void *, scene, 0x4bc),
                            func_02091c7c(transition, 1));
        Overlay045Graphics_SetUniformValue(FIELD(void *, scene, 0x4bc),
                            TitleInterpolatedValue_Evaluate(transition, 1, 0x200, 0x180));
        if (func_02091cf0(transition) && DisplayBrightness_IsMainTransitionComplete()) {
            void *record = FIELD(void *, entry, 0);
            const void *text = RecordDescriptor_GetMessage(
                record, FIELD(s32, record, 0xc));
            func_ov023_021fe804(scene, text, record);
            ADVANCE(scene);
        }
        break;
    }
    case 2:
        if (func_ov023_021fe88c(scene)) {
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            DisplayBrightness_StartMaskedTransitions(1, 0);
            TitleInterpolatedValue_Configure(transition, 5, 0, -128, 8);
            ADVANCE(scene);
        }
        break;
    case 3:
        func_ov045_0220c274(FIELD(void *, scene, 0x4bc),
                            func_02091c7c(transition, 1));
        Overlay045Graphics_SetUniformValue(FIELD(void *, scene, 0x4bc),
                            TitleInterpolatedValue_Evaluate(transition, 1, 0x180, 0x200));
        if (func_02091cf0(transition)) {
            void *detail = FIELD(void *, scene, 0x4bc);
            if (detail) {
                typedef void (*Dtor)(void *);
                ((Dtor)FIELD(void *, FIELD(void *, detail, 0), 4))(detail);
            }
            FIELD(void *, scene, 0x4bc) = 0;
            CALLBACK(scene, next);
        }
        break;
    }
    func_ov023_021fe77c(scene);
    return 0;
}

/* Main-list detail dialog/slide state machine; always returns zero. */
extern "C" s32 func_ov023_021ff0a4(void *scene)
{
    return detail_machine(scene, FIELD(void *, scene, 0x394),
                          data_ov023_021ffb70);
}

/*
 * Confirms the grouped-list selection, storing pointer element +0x47C,
 * creating overlay-45 detail +0x4BC, positioning it at -128, and installing
 * the grouped detail callback. Audio/overlay/selection/callback state changes.
 */
extern "C" void func_ov023_021ff2a0(void *scene)
{
    SceneSound_PlayPackedEffect(scene, 2);
    void *entry = func_ov023_021fd954(FIELD(void *, scene, 0x478));
    FIELD(void *, scene, 0x47c) = entry;
    void *record = FIELD(void *, entry, 0);
    void *descriptor = FIELD(void *, record, 4);
    extern void *func_ov045_0220c48c(s32, u16, s32);
    void *detail = func_ov045_0220c48c(
        FIELD(u32, descriptor, 0xc) & 0xff,
        FIELD(u16, descriptor, 4), 1);
    FIELD(void *, scene, 0x4bc) = detail;
    func_ov045_0220c274(detail, -128);
    CALLBACK(scene, data_ov023_021ffb68);
}

/*
 * Grouped pointer-list state machine. It opens/redraws the current bank group,
 * handles scrolling, touch/drag, navigation effects, row confirmation,
 * cancel/mode controllers, and selector animation between groups. Steps 10/20
 * wait for controller/debounce completion. Scene/group/UI/effect/callback state
 * may change; maintenance always runs and the function returns zero.
 */
extern "C" s32 func_ov023_021ff2fc(void *scene)
{
    void *list = FIELD(void *, scene, 0x478);
    void *ui = FIELD(void *, list, 0x48);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov023_021fd7a8(list);
        func_ov023_021fd730(list);
        func_ov023_021fe6e4(scene);
        InventoryScroll_ResetPresentationState(ui);
        ADVANCE(scene);
        /* fall through */
    case 1:
        if (InventoryScroll_UpdateInterpolation(ui)) ADVANCE(scene);
        else if (func_ov023_021fd968(list)) func_ov023_021fe6e4(scene);
        break;
    case 2: {
        InventoryScroll_SaveOrigins(ui);
        IndexedSelectionController_SnapTransitionOrigin((u8 *)scene + 0x480);
        u16 keys = FIELD(u16, FIELD(void *, scene, 0x2c), 0);
        if (keys & 0x40) InventoryScroll_MoveSelectionUp(ui);
        else if (keys & 0x80) InventoryScroll_MoveSelectionDown(ui);
        else if (FIELD(u32, scene, 0x20) & 0x10) {
            s32 hit = func_ov023_021fd8e4(list, (u8 *)scene + 0x30);
            if (InventoryScroll_TestUpperArrowHold(ui, (u8 *)scene + 0x30)) InventoryScroll_PageUp(ui);
            else if (InventoryScroll_TestLowerArrowHold(ui, (u8 *)scene + 0x30)) InventoryScroll_PageDown(ui);
            else if (func_ov023_021fe694(scene)) IndexedSelectionController_IncrementWrap((u8 *)scene + 0x480);
            else if (func_ov023_021fe6bc(scene)) IndexedSelectionController_DecrementWrap((u8 *)scene + 0x480);
            else if ((FIELD(u32, scene, 0x20) & 0x20) &&
                     InventoryScroll_TestMarkerHit(ui, (u8 *)scene + 0x30)) {
                CALLBACK(scene, data_ov023_021ffb38);
                break;
            } else if (hit >= 0) {
                if (hit != FIELD(s32, ui, 0x14)) select_row(scene, ui, hit);
                else func_ov023_021ff2a0(scene);
                break;
            }
        }
        if (SpriteMotionController_BeginHitResponse((u8 *)scene + 0xd0,
                          (u8 *)scene + 0x30, 0, 4)) {
            func_ov023_021ff2a0(scene);
        } else if (SpriteMotionController_BeginHitResponse((u8 *)scene + 0x17c,
                                 (u8 *)scene + 0x30, 0, 4)) {
            SceneSound_PlayPackedEffect(scene, 3);
            CALLBACK(scene, data_ov023_021ffb58);
        } else {
            FIELD(s32, scene, 0x38c) = func_ov023_021fea34(scene);
            if (FIELD(s32, scene, 0x38c) == 0) {
                SceneSound_PlayPackedEffect(scene, 11);
                FIELD(s32, scene, 4) = 10;
                FIELD(s32, scene, 8) = 0;
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(ui)) { SceneSound_PlayPackedEffect(scene, 0); --FIELD(s32, scene, 4); }
        if (IndexedSelectionController_AdvanceTransition((u8 *)scene + 0x480)) {
            SceneSound_PlayPackedEffect(scene, 0);
            void *effect = IndexedSelectionController_GetLastDirection((u8 *)scene + 0x480) ?
                FIELD(void *, scene, 0x380) : FIELD(void *, scene, 0x384);
            PresentationScalar_SetImmediate((u8 *)effect + 0x1c,
                          effect == FIELD(void *, scene, 0x380) ? 0x12000 : 0x4e000);
            PresentationScalar_TransitionTo((u8 *)effect + 0x1c, 1,
                          effect == FIELD(void *, scene, 0x380) ? 0x16000 : 0x4a000);
            FIELD(s32, effect, 0x7c) = 4;
            FIELD(s32, effect, 0x80) = 0;
            ADVANCE(scene);
        }
        break;
    }
    case 3:
        if (IndexedSelectionController_AdvancePacing((u8 *)scene + 0x480)) {
            func_ov023_021fd780(list);
            list = FIELD(void *, scene, 0x430 + FIELD(s32, scene, 0x48c) * 4);
            FIELD(void *, scene, 0x478) = list;
            func_ov023_021fd730(list);
            func_ov023_021fd7a8(list);
            func_ov023_021fe6e4(scene);
            --FIELD(s32, scene, 4);
        }
        break;
    case 10:
        if (func_ov023_021fef54((u8 *)scene + 0x228 +
                                FIELD(s32, scene, 0x38c) * 0xac)) {
            func_ov023_021fd780(list);
            FIELD(void *, scene, 0x478) = 0;
            func_ov023_021fe994(scene, FIELD(s32, scene, 0x38c));
            func_ov023_021fe6e4(scene);
            CALLBACK(scene, data_ov023_021ffb30);
        }
        break;
    case 20:
        if (++FIELD(s32, scene, 8) > 8) { FIELD(s32, scene, 4) = 0; FIELD(s32, scene, 8) = 0; }
        break;
    }
    func_ov023_021fe77c(scene);
    return 0;
}

/* Recenters the grouped list after a touch selection; always returns zero. */
extern "C" s32 func_ov023_021ff7d8(void *scene)
{
    return recenter_machine(scene, FIELD(void *, scene, 0x478),
                            data_ov023_021ffb48);
}

/* Grouped-list detail dialog/slide state machine; always returns zero. */
extern "C" s32 func_ov023_021ff910(void *scene)
{
    return detail_machine(scene, FIELD(void *, scene, 0x47c),
                          data_ov023_021ffb40);
}

/* Terminal callback: performs per-frame maintenance and returns one. */
extern "C" s32 func_ov023_021ffb0c(void *scene)
{
    func_ov023_021fe77c(scene);
    return 1;
}
