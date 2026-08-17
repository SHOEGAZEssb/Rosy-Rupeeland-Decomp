#include "tingle/types.h"

/* Overlay 32 detail-widget input, scrolling, row selection, and close-transition state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 gSystemState[];
extern void *gSoundContext;
extern u8 data_021f6288[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov032_02201ea4(void *);
extern void func_ov032_02201930(void *);
extern void InventoryScroll_ResetPresentationState(void *);
extern s32 InventoryScroll_UpdateInterpolation(void *);
extern s32 func_ov032_02201e58(void *);
extern void InventoryScroll_SaveOrigins(void *);
extern void InventoryScroll_MoveSelectionUp(void *);
extern void InventoryScroll_MoveSelectionDown(void *);
extern s32 InventoryScroll_TestUpperArrowHold(...);
extern s32 InventoryScroll_PageUp(void *);
extern s32 InventoryScroll_TestLowerArrowHold(...);
extern s32 InventoryScroll_PageDown(void *);
extern s32 Overlay032Widget_HitTestRow(void *, void *);
extern s32 InventoryScroll_TestUpperArrowPress(...);
extern s32 InventoryScroll_TestLowerArrowPress(...);
extern s32 InventoryScroll_TestMarkerHit(...);
extern void Sound_Play(...);
extern void InventoryScroll_SetSelectedRow(...);
extern s32 Overlay032SpriteWrapper_HitTest(...);
extern s32 InventoryScroll_UpdateSelectionMovement(void *);
extern void InventoryScroll_BeginMarkerDrag(...);
extern void func_0205940c(...);
extern s32 InventoryScroll_UpdateMarkerDrag(...);
extern void InventoryScroll_EndMarkerDrag(...);
extern void InventoryScroll_UpdatePresentation(void *);
#ifdef __cplusplus
}
#endif

static void mark_selected_record(void *widget)
{
    void *scene = FIELD(void *, widget, 0);
    s32 selected = FIELD(s32, FIELD(void *, widget, 0x4c), 0x14);
    FIELD(s32, scene, 0xf14) = selected;
    u8 *record = data_021f6288 + selected * 8;
    if (FIELD(u16, record, 2) != 1) {
        FIELD(u16, record, 2) = 1;
        func_ov032_02201ea4(widget);
    }
}

/*
 * Runs the detail widget's state at +0x04. States 0..2 initialize and process
 * pad/touch scrolling and selection; a row or footer hit stores scene +0xF14,
 * marks the selected record's halfword +2, and returns one. The back wrapper
 * stores -1 and returns one. States 10..12 animate an alternate scroll/close
 * path and return to state zero when touch is released. All non-selection paths
 * advance SDK list rendering via 0x02094574 and return zero.
 */
extern "C" s32 func_ov032_02201960(void *widget)
{
    void *scene = FIELD(void *, widget, 0);
    void *list = FIELD(void *, widget, 0x4c);
    void *touch = (u8 *)scene + 0xb54;
    switch (FIELD(s32, widget, 4)) {
    case 0:
        func_ov032_02201ea4(widget);
        func_ov032_02201930(widget);
        InventoryScroll_ResetPresentationState(list);
        ++FIELD(s32, widget, 4);
        /* Confirmed fallthrough: initialization immediately polls state 1. */
    case 1:
        if (InventoryScroll_UpdateInterpolation(list)) {
            ++FIELD(s32, widget, 4);
        } else if (func_ov032_02201e58(widget)) {
            func_ov032_02201930(widget);
        }
        break;
    case 2: {
        InventoryScroll_SaveOrigins(list);
        u16 pad = FIELD(u16, gSystemState, 0xa);
        if (pad & 0x40) {
            InventoryScroll_MoveSelectionUp(list);
        } else if (pad & 0x80) {
            InventoryScroll_MoveSelectionDown(list);
        } else {
            if (FIELD(s32, scene, 0xb80)) {
                if (InventoryScroll_TestUpperArrowHold(list, touch)) {
                    InventoryScroll_PageUp(list);
                    break;
                }
                if (InventoryScroll_TestLowerArrowHold(list, touch)) {
                    InventoryScroll_PageDown(list);
                    break;
                }
            }
            if (FIELD(s32, scene, 0xb84)) {
                s32 row = Overlay032Widget_HitTestRow(widget, touch);
                if (InventoryScroll_TestUpperArrowPress(list, touch)) {
                    if (!InventoryScroll_PageUp(list)) Sound_Play(gSoundContext, 0, 0x16);
                } else if (InventoryScroll_TestLowerArrowPress(list, touch)) {
                    if (!InventoryScroll_PageDown(list)) Sound_Play(gSoundContext, 0, 0x16);
                } else if (InventoryScroll_TestMarkerHit(list, touch)) {
                    FIELD(s32, widget, 4) = 10;
                } else if (row >= 0) {
                    s32 current = FIELD(s32, list, 0x14);
                    if (row != current) {
                        Sound_Play(gSoundContext, 0, 0);
                        InventoryScroll_SetSelectedRow(list, row);
                        func_ov032_02201930(widget);
                    } else {
                        mark_selected_record(widget);
                        return 1;
                    }
                } else if (Overlay032SpriteWrapper_HitTest((u8 *)scene + 0xb14, touch, -1, -1)) {
                    mark_selected_record(widget);
                    return 1;
                } else if (Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x154, touch, -1, -1)) {
                    FIELD(s32, scene, 0xf14) = -1;
                    return 1;
                }
            }
        }
        if (InventoryScroll_UpdateSelectionMovement(list)) {
            Sound_Play(gSoundContext, 0, 0);
            --FIELD(s32, widget, 4);
        }
        break;
    }
    case 10:
        InventoryScroll_BeginMarkerDrag(list, 4);
        ++FIELD(s32, widget, 4);
        break;
    case 11:
        if (InventoryScroll_UpdateInterpolation(list)) {
            if (FIELD(s32, list, 0xc) != FIELD(s32, list, 0x10))
                func_0205940c(gSoundContext, 0, 8);
            ++FIELD(s32, widget, 4);
        } else if (func_ov032_02201e58(widget)) {
            func_ov032_02201930(widget);
        }
        break;
    case 12:
        InventoryScroll_SaveOrigins(list);
        if (FIELD(s32, scene, 0xb80)) {
            if (InventoryScroll_UpdateMarkerDrag(list, touch)) {
                Sound_Play(gSoundContext, 0, 8);
                --FIELD(s32, widget, 4);
            }
        } else {
            InventoryScroll_EndMarkerDrag(list, 6);
            FIELD(s32, widget, 4) = 0;
        }
        break;
    }
    InventoryScroll_UpdatePresentation(list);
    return 0;
}
