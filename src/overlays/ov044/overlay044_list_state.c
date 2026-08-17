#include "tingle/types.h"

/*
 * Overlay 44 list interaction state. This recovered multi-state handler starts
 * the panel viewport, processes buttons and touch gestures, routes selection
 * and cancellation, handles short debounce/completion substates, and flushes
 * all display resources every frame.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 data_ov044_0220d2b8[2];
extern "C" u32 data_ov044_0220d2d8[2];
extern "C" void InventoryScroll_ResetPresentationState(void *child);
extern "C" s32 InventoryScroll_UpdateInterpolation(void *child);
extern "C" s32 func_ov044_0220bdac(void *panel);
extern "C" void func_ov044_0220c700(void *object);
extern "C" void InventoryScroll_SaveOrigins(void *child);
extern "C" void InventoryScroll_MoveSelectionUp(void *child);
extern "C" void InventoryScroll_MoveSelectionDown(void *child);
extern "C" s32 func_ov044_0220bd28(void *panel, void *touch);
extern "C" s32 InventoryScroll_TestUpperArrowHold(void *child, void *touch);
extern "C" s32 InventoryScroll_PageUp(void *child);
extern "C" s32 InventoryScroll_TestLowerArrowHold(void *child, void *touch);
extern "C" s32 InventoryScroll_PageDown(void *child);
extern "C" s32 InventoryScroll_TestUpperArrowPress(void *child, void *touch);
extern "C" s32 InventoryScroll_TestLowerArrowPress(void *child, void *touch);
extern "C" s32 InventoryScroll_TestMarkerHit(void *child, void *touch);
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second);
extern "C" void func_02092260(void *object, s32 state);
extern "C" void InventoryScroll_SetSelectedRow(void *child, s32 index);
extern "C" void func_ov044_0220caa4(void *object);
extern "C" s32 func_02095860(void *presentation, void *touch,
                              s32 first, s32 second);
extern "C" s32 InventoryScroll_UpdateSelectionMovement(void *child);
extern "C" void func_ov044_0220c880(void *object);

static void advance_substate(void *object)
{
    ++FIELD(s32, object, 4);
    FIELD(s32, object, 8) = 0;
}

/*
 * Process one list-interaction frame and return zero. State 0 starts child
 * +0x44, then falls into state 1. State 1 waits for the child transition; while
 * pending, a midpoint sync redraws the panel. State 2 updates the child and
 * handles key bits 0x40/0x80, touch availability in object flag bit four, and
 * the secondary touch gate in bit five. Gesture helpers route scroll actions,
 * state 0x16, callback pair data_ov044_0220d2b8, selection changes, selected-row
 * confirmation, or presentation hit targets. The common child-completion path
 * decrements the substate and resets +0x08. State 10 waits for +0x1FC to reach
 * +0x1F8; state 20 waits nine frames. Every path flushes display state through
 * func_ov044_0220c880 before returning.
 */
extern "C" s32 func_ov044_0220cb04(void *object)
{
    void *panel = FIELD(void *, object, 0x228);
    void *child = FIELD(void *, panel, 0x44);
    s32 state = FIELD(s32, object, 4);

    if (state == 0) {
        InventoryScroll_ResetPresentationState(child);
        advance_substate(object);
        state = 1;
    }
    if (state == 1) {
        if (InventoryScroll_UpdateInterpolation(child)) {
            advance_substate(object);
            state = 2;
        } else {
            if (func_ov044_0220bdac(panel))
                func_ov044_0220c700(object);
            func_ov044_0220c880(object);
            return 0;
        }
    }
    if (state == 2) {
        InventoryScroll_SaveOrigins(child);
        u16 keys = FIELD(u16, FIELD(void *, object, 0x2c), 0);
        if (keys & 0x40) {
            InventoryScroll_MoveSelectionUp(child);
        } else if (keys & 0x80) {
            InventoryScroll_MoveSelectionDown(child);
        } else if (FIELD(u32, object, 0x20) & 0x10) {
            void *touch = (u8 *)object + 0x30;
            s32 hit = func_ov044_0220bd28(panel, touch);
            if (InventoryScroll_TestUpperArrowHold(child, touch)) {
                InventoryScroll_PageUp(child);
            } else if (InventoryScroll_TestLowerArrowHold(child, touch)) {
                InventoryScroll_PageDown(child);
            } else if (FIELD(u32, object, 0x20) & 0x20) {
                if (InventoryScroll_TestUpperArrowPress(child, touch)) {
                    if (!InventoryScroll_PageUp(child))
                        func_02092260(object, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(child, touch)) {
                    if (!InventoryScroll_PageDown(child))
                        func_02092260(object, 0x16);
                } else if (InventoryScroll_TestMarkerHit(child, touch)) {
                    func_ov044_0220be38(object,
                                        data_ov044_0220d2b8[0],
                                        data_ov044_0220d2b8[1]);
                    func_ov044_0220c880(object);
                    return 0;
                } else if (hit >= 0) {
                    if (hit != FIELD(s32, child, 0x14)) {
                        func_02092260(object, 0);
                        InventoryScroll_SetSelectedRow(child, hit);
                        func_ov044_0220c700(object);
                        FIELD(s32, object, 4) = 0x14;
                        FIELD(s32, object, 8) = 0;
                        func_ov044_0220c880(object);
                        return 0;
                    }
                    func_ov044_0220caa4(object);
                    func_ov044_0220c880(object);
                    return 0;
                } else if (func_02095860((u8 *)object + 0x17c,
                                         touch, 0, 4)) {
                    func_ov044_0220caa4(object);
                    func_ov044_0220c880(object);
                    return 0;
                } else if (func_02095860((u8 *)object + 0xd0,
                                         touch, 0, 4)) {
                    func_02092260(object, 3);
                    func_ov044_0220be38(object,
                                        data_ov044_0220d2d8[0],
                                        data_ov044_0220d2d8[1]);
                    func_ov044_0220c880(object);
                    return 0;
                }
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(child)) {
            func_02092260(object, 0);
            --FIELD(s32, object, 4);
            FIELD(s32, object, 8) = 0;
        }
    } else if (state == 10) {
        if (FIELD(s32, object, 0x1fc) >= FIELD(s32, object, 0x1f8)) {
            FIELD(s32, object, 4) = 0;
            FIELD(s32, object, 8) = 0;
        }
    } else if (state == 20) {
        if (++FIELD(s32, object, 8) > 8) {
            FIELD(s32, object, 4) = 0;
            FIELD(s32, object, 8) = 0;
        }
    }
    func_ov044_0220c880(object);
    return 0;
}
