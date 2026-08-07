#include "tingle/types.h"

/* Overlay 16 primary selectable-list interaction state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_022013c8[];
extern const u32 data_ov016_02201450[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020628c8(void *);
extern void func_02092260(void *, s32);
extern void func_02093d50(void *, s32);
extern void func_02093de4(void *);
extern void func_02093e0c(void *);
extern void func_02093e20(void *);
extern s32 func_02093e3c(void *);
extern s32 func_02093e58(void *);
extern s32 func_02093ffc(void *);
extern s32 func_020945c8(void *, void *);
extern s32 func_02094600(void *, void *);
extern s32 func_02094638(void *, void *);
extern s32 func_02094668(void *, void *);
extern s32 func_02094698(void *, void *);
extern s32 func_02094758(void *);
extern void func_02094874(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern s32 func_02095dd4(void *, void *, s32);
extern void func_ov016_021fd3f8(void *);
extern s32 func_ov016_021fd5b8(void *, void *);
extern void *func_ov016_021fd628(void *);
extern s32 func_ov016_021fd640(void *);
extern s32 func_ov016_021fe728(void *);
extern void func_ov016_021fe754(void *, u32, u32);
extern void func_ov016_021ff7bc(void *);
extern void func_ov016_021ff908(void *, s32, s32, void *);
extern void func_ov016_021ff9b8(void *);
extern void func_ov016_021ffba4(void *);
extern void func_ov016_021ffbd8(void *);
extern void func_ov016_021fffcc(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the primary list state machine in state word +4. States 0/1 open the
 * presentation at list +0x444/+0x58 and deliberately fall through as animation
 * completes. State 2 routes key bits +0x40/+0x80, touch/navigation helpers, list
 * index selection, actor hit tests, confirmation, and cancellation. It changes
 * to state 20 after selecting a new row, invokes 0x021FFFCC when confirming the
 * current row, or transitions using fixed pairs 0x221450/0x2213C8. States 3/4
 * open and close the selected-row message; state 10 waits for actor completion;
 * state 20 delays nine frames before returning to state 0. Always update all
 * scene components through 0x021FF7BC and return zero. UI, audio/action, and
 * transition state change; no direct MMIO occurs in this handler.
 */
extern "C" s32 func_ov016_0220007c(void *state)
{
    void *list = FIELD(void *, state, 0x444);
    void *presentation = FIELD(void *, list, 0x58);
    s32 selected;

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_02094874(presentation);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* The original handler deliberately continues into state 1. */
    case 1:
        if (func_02093ffc(presentation) != 0) {
            func_ov016_021ffbd8(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (func_ov016_021fd640(list) != 0) {
                func_ov016_021ffba4(state);
            }
            break;
        }
        /* Completed opening continues directly into interactive state 2. */
    case 2:
        func_02093de4(presentation);
        if ((FIELD(u16, FIELD(void *, state, 0x2c), 0) & 0x40) != 0) {
            func_02093e0c(presentation);
        } else if ((FIELD(u16, FIELD(void *, state, 0x2c), 0) & 0x80) != 0) {
            func_02093e20(presentation);
        } else if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            selected = func_ov016_021fd5b8(list, (u8 *)state + 0x30);
            if (func_02094638(presentation, (u8 *)state + 0x30) != 0) {
                func_02093e3c(presentation);
            } else if (func_02094668(presentation, (u8 *)state + 0x30) != 0) {
                func_02093e58(presentation);
            } else if ((FIELD(u32, state, 0x20) & 0x20) != 0) {
                if (func_020945c8(presentation, (u8 *)state + 0x30) != 0) {
                    if (func_02093e3c(presentation) == 0) {
                        func_02092260(state, 0x16);
                    }
                } else if (func_02094600(presentation,
                                          (u8 *)state + 0x30) != 0) {
                    if (func_02093e58(presentation) == 0) {
                        func_02092260(state, 0x16);
                    }
                } else if (func_02094698(presentation,
                                          (u8 *)state + 0x30) != 0 &&
                           (FIELD(u32, state, 0x20) & 0x20) != 0) {
                    func_ov016_021fe754(state, data_ov016_02201450[0],
                                        data_ov016_02201450[1]);
                    break;
                } else if (selected >= 0) {
                    if (selected != FIELD(s32, presentation, 0x14)) {
                        func_02092260(state, 0);
                        func_02093d50(presentation, selected);
                        func_ov016_021ffba4(state);
                        func_ov016_021ffbd8(state);
                        FIELD(s32, state, 4) = 0x14;
                        FIELD(s32, state, 8) = 0;
                    } else {
                        func_ov016_021fffcc(state);
                    }
                    break;
                } else if (func_02095860((u8 *)state + 0xe8,
                                          (u8 *)state + 0x30, 0, 4) != 0) {
                    func_ov016_021fffcc(state);
                    break;
                } else if (func_02095860((u8 *)state + 0x194,
                                          (u8 *)state + 0x30, 0, 4) != 0) {
                    func_02092260(state, 3);
                    func_ov016_021fe754(state, data_ov016_022013c8[0],
                                        data_ov016_022013c8[1]);
                    break;
                }
            }
        }
        if (func_02094758(presentation) != 0) {
            func_02092260(state, 0);
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (func_ov016_021fe728((u8 *)state + 0xe8) != 0) {
            void *descriptor = func_ov016_021fd628(list);
            if ((FIELD(u16, descriptor, 0xc) & 4) != 0) {
                func_ov016_021ff908(state, 0x1c, 0, 0);
            } else {
                void *slot = FIELD(void *, descriptor, 0);
                void *record = FIELD(void *, slot, 0);
                func_ov016_021ff908(state, 0xe, 0,
                                    func_020628c8((u8 *)record + 4));
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 4:
        if (func_02095dd4(FIELD(void *, state, 0x460),
                          (u8 *)state + 0x30,
                          (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) >= 0) {
            func_ov016_021ff9b8(state);
            func_ov016_021fd3f8(list);
            FIELD(s32, state, 4) -= 2;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 10:
        if (func_ov016_021fe728((u8 *)state + 0xe8) != 0) {
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 20:
        FIELD(s32, state, 8)++;
        if (FIELD(s32, state, 8) > 8) {
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}
