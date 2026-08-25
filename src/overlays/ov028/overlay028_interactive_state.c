#include "tingle/types.h"

/* Overlay 28 interactive list navigation and touch/button state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov028_021ff260[];
extern const s32 data_ov028_021ff258[];
extern const s32 data_ov028_021ff220[];
extern const s32 data_ov028_021ff248[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02092260(void *, s32);
extern void InventoryScroll_SetSelectedRow(void *, s32);
extern void InventoryScroll_SaveOrigins(void *);
extern void InventoryScroll_MoveSelectionUp(void *);
extern void InventoryScroll_MoveSelectionDown(void *);
extern s32 InventoryScroll_PageUp(void *);
extern s32 InventoryScroll_PageDown(void *);
extern s32 InventoryScroll_UpdateInterpolation(void *);
extern s32 InventoryScroll_TestUpperArrowPress(void *, const void *);
extern s32 InventoryScroll_TestLowerArrowPress(void *, const void *);
extern s32 InventoryScroll_TestUpperArrowHold(void *, const void *);
extern s32 InventoryScroll_TestLowerArrowHold(void *, const void *);
extern s32 InventoryScroll_TestMarkerHit(void *, const void *);
extern s32 InventoryScroll_UpdateSelectionMovement(void *);
extern void InventoryScroll_ResetPresentationState(void *);
extern s32 SpriteMotionController_BeginHitResponse(void *, const void *, s32, s32);
extern s32 func_ov028_021fd558(void *, const void *);
extern s32 func_ov028_021fd5e0(void *);
extern void func_ov028_021fdad8(void *, s32, s32);
extern void func_ov028_021fe438(void *);
extern void func_ov028_021fe6bc(void *);
#ifdef __cplusplus
}
#endif

static void Overlay028_SetPair(void *state, const s32 *pair)
{
    func_ov028_021fdad8(state, pair[0], pair[1]);
}

/*
 * Runs the primary interaction state at scene +4 with timer +8 and list
 * controller +0x220/+0x44. State 0 starts controller motion; state 1 waits for
 * it or a scroll midpoint; state 2 processes D-pad up/down, touch drag/release,
 * row selection/confirmation, and the two side controls +0x98/+0x144; state 10
 * delays eight frames before returning to zero. Touch coordinates are at +0x30
 * and availability gates are bits 4/5 of +0x20. Actions select callback pairs
 * 0x021FF260/258/220/248, play event IDs 0/2/3/22, update cursor/selection,
 * and may transition through state 10. Controller completion backs up one
 * state. The common graphics update always runs and the function returns zero;
 * input, audio, UI, and graphics SDK state may change.
 */
extern "C" s32 func_ov028_021fe77c(void *state)
{
    void *list = FIELD(void *, state, 0x220);
    void *controller = FIELD(void *, list, 0x44);
    s32 phase = FIELD(s32, state, 4);

    if (phase == 0) {
        InventoryScroll_ResetPresentationState(controller);
        FIELD(s32, state, 4) = 1;
        FIELD(s32, state, 8) = 0;
        phase = 1;
    }
    if (phase == 1) {
        if (InventoryScroll_UpdateInterpolation(controller) != 0) {
            FIELD(s32, state, 4) = 2;
            FIELD(s32, state, 8) = 0;
            phase = 2;
        } else {
            if (func_ov028_021fd5e0(list) != 0)
                func_ov028_021fe6bc(state);
            func_ov028_021fe438(state);
            return 0;
        }
    }
    if (phase == 2) {
        InventoryScroll_SaveOrigins(controller);
        u16 keys = FIELD(u16, FIELD(void *, state, 0x2c), 0);
        if (keys & 0x40) {
            InventoryScroll_MoveSelectionUp(controller);
        } else if (keys & 0x80) {
            InventoryScroll_MoveSelectionDown(controller);
        } else if (FIELD(u32, state, 0x20) & 0x10) {
            const void *point = (u8 *)state + 0x30;
            s32 hit = func_ov028_021fd558(list, point);
            if (InventoryScroll_TestUpperArrowHold(controller, point) != 0) {
                InventoryScroll_PageUp(controller);
            } else if (InventoryScroll_TestLowerArrowHold(controller, point) != 0) {
                InventoryScroll_PageDown(controller);
            } else if (FIELD(u32, state, 0x20) & 0x20) {
                if (InventoryScroll_TestUpperArrowPress(controller, point) != 0) {
                    if (InventoryScroll_PageUp(controller) == 0)
                        func_02092260(state, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(controller, point) != 0) {
                    if (InventoryScroll_PageDown(controller) == 0)
                        func_02092260(state, 0x16);
                } else if (InventoryScroll_TestMarkerHit(controller, point) != 0) {
                    Overlay028_SetPair(state, data_ov028_021ff260);
                    func_ov028_021fe438(state);
                    return 0;
                } else if (hit >= 0) {
                    if (hit != FIELD(s32, controller, 0x14)) {
                        func_02092260(state, 0);
                        InventoryScroll_SetSelectedRow(controller, hit);
                        func_ov028_021fe6bc(state);
                        FIELD(s32, state, 4) = 10;
                        FIELD(s32, state, 8) = 0;
                    } else {
                        func_02092260(state, 2);
                        Overlay028_SetPair(state, data_ov028_021ff258);
                    }
                } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x98,
                                         point, 0, 4) != 0) {
                    func_02092260(state, 2);
                    Overlay028_SetPair(state, data_ov028_021ff220);
                } else if (SpriteMotionController_BeginHitResponse((u8 *)state + 0x144,
                                         point, 0, 4) != 0) {
                    func_02092260(state, 3);
                    Overlay028_SetPair(state, data_ov028_021ff248);
                }
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(controller) != 0) {
            func_02092260(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        }
    } else if (phase == 10) {
        if (++FIELD(s32, state, 8) > 8) {
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
    }
    func_ov028_021fe438(state);
    return 0;
}
