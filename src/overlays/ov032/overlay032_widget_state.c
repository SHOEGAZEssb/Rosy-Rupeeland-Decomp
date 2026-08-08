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
extern void func_02094874(void *);
extern s32 func_02093ffc(void *);
extern s32 func_ov032_02201e58(void *);
extern void func_02093de4(void *);
extern void func_02093e0c(void *);
extern void func_02093e20(void *);
extern s32 func_02094638(...);
extern s32 func_02093e3c(void *);
extern s32 func_02094668(...);
extern s32 func_02093e58(void *);
extern s32 func_ov032_02201de4(void *, void *);
extern s32 func_020945c8(...);
extern s32 func_02094600(...);
extern s32 func_02094698(...);
extern void Sound_Play(...);
extern void func_02093d50(...);
extern s32 func_ov032_021ff288(...);
extern s32 func_02094758(void *);
extern void func_020946a8(...);
extern void func_0205940c(...);
extern s32 func_020946c8(...);
extern void func_02094738(...);
extern void func_02094574(void *);
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
        func_02094874(list);
        ++FIELD(s32, widget, 4);
        /* Confirmed fallthrough: initialization immediately polls state 1. */
    case 1:
        if (func_02093ffc(list)) {
            ++FIELD(s32, widget, 4);
        } else if (func_ov032_02201e58(widget)) {
            func_ov032_02201930(widget);
        }
        break;
    case 2: {
        func_02093de4(list);
        u16 pad = FIELD(u16, gSystemState, 0xa);
        if (pad & 0x40) {
            func_02093e0c(list);
        } else if (pad & 0x80) {
            func_02093e20(list);
        } else {
            if (FIELD(s32, scene, 0xb80)) {
                if (func_02094638(list, touch)) {
                    func_02093e3c(list);
                    break;
                }
                if (func_02094668(list, touch)) {
                    func_02093e58(list);
                    break;
                }
            }
            if (FIELD(s32, scene, 0xb84)) {
                s32 row = func_ov032_02201de4(widget, touch);
                if (func_020945c8(list, touch)) {
                    if (!func_02093e3c(list)) Sound_Play(gSoundContext, 0, 0x16);
                } else if (func_02094600(list, touch)) {
                    if (!func_02093e58(list)) Sound_Play(gSoundContext, 0, 0x16);
                } else if (func_02094698(list, touch)) {
                    FIELD(s32, widget, 4) = 10;
                } else if (row >= 0) {
                    s32 current = FIELD(s32, list, 0x14);
                    if (row != current) {
                        Sound_Play(gSoundContext, 0, 0);
                        func_02093d50(list, row);
                        func_ov032_02201930(widget);
                    } else {
                        mark_selected_record(widget);
                        return 1;
                    }
                } else if (func_ov032_021ff288((u8 *)scene + 0xb14, touch, -1, -1)) {
                    mark_selected_record(widget);
                    return 1;
                } else if (func_ov032_021ff288((u8 *)scene + 0x154, touch, -1, -1)) {
                    FIELD(s32, scene, 0xf14) = -1;
                    return 1;
                }
            }
        }
        if (func_02094758(list)) {
            Sound_Play(gSoundContext, 0, 0);
            --FIELD(s32, widget, 4);
        }
        break;
    }
    case 10:
        func_020946a8(list, 4);
        ++FIELD(s32, widget, 4);
        break;
    case 11:
        if (func_02093ffc(list)) {
            if (FIELD(s32, list, 0xc) != FIELD(s32, list, 0x10))
                func_0205940c(gSoundContext, 0, 8);
            ++FIELD(s32, widget, 4);
        } else if (func_ov032_02201e58(widget)) {
            func_ov032_02201930(widget);
        }
        break;
    case 12:
        func_02093de4(list);
        if (FIELD(s32, scene, 0xb80)) {
            if (func_020946c8(list, touch)) {
                Sound_Play(gSoundContext, 0, 8);
                --FIELD(s32, widget, 4);
            }
        } else {
            func_02094738(list, 6);
            FIELD(s32, widget, 4) = 0;
        }
        break;
    }
    func_02094574(list);
    return 0;
}
