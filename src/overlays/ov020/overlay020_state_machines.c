#include "tingle/types.h"

/* Overlay 20 primary and alternate selectable-list interaction state machines. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov020_021fe450[];
extern const u32 data_ov020_021fe468[];
extern const u32 data_ov020_021fe470[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02092260(void *, s32);
extern void func_02092288(void *, s32);
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
extern void func_020946a8(void *, s32);
extern s32 func_020946c8(void *, void *);
extern void func_02094738(void *, s32);
extern s32 func_02094758(void *);
extern void func_02094874(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern s32 func_ov020_021fd280(void *);
extern void func_ov020_021fd81c(void *, u32, u32, s32);
extern void func_ov020_021fde6c(void *);
extern void func_ov020_021fde9c(void *);
extern s32 func_ov020_021fdee0(void *);
extern s32 func_ov020_021fdf08(void *);
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
extern "C" s32 func_ov020_021fe024(void *state)
{
    void *list = FIELD(void *, state, 0x1dc);
    void *presentation = FIELD(void *, list, 0x44);
    s32 selected;

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_02094874(presentation);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Opening starts and deliberately continues into its wait state. */
    case 1:
        if (func_02093ffc(presentation) != 0) {
            func_ov020_021fdee0(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (func_ov020_021fd280(list) != 0)
                func_ov020_021fde9c(state);
            break;
        }
        /* Completed opening deliberately continues into interactive state 2. */
    case 2:
        func_02093de4(presentation);
        if ((FIELD(u16, FIELD(void *, state, 0x2c), 0) & 0x40) != 0) {
            func_02093e0c(presentation);
        } else if ((FIELD(u16, FIELD(void *, state, 0x2c), 0) & 0x80) != 0) {
            func_02093e20(presentation);
        } else if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            selected = func_ov020_021fdf08(state);
            if (func_02094638(presentation, (u8 *)state + 0x30) != 0) {
                func_02093e3c(presentation);
            } else if (func_02094668(presentation, (u8 *)state + 0x30) != 0) {
                func_02093e58(presentation);
            } else if ((FIELD(u32, state, 0x20) & 0x20) != 0) {
                if (func_020945c8(presentation, (u8 *)state + 0x30) != 0) {
                    if (func_02093e3c(presentation) == 0)
                        func_02092260(state, 0x16);
                } else if (func_02094600(presentation,
                                          (u8 *)state + 0x30) != 0) {
                    if (func_02093e58(presentation) == 0)
                        func_02092260(state, 0x16);
                } else if (func_02094698(presentation,
                                          (u8 *)state + 0x30) != 0) {
                    func_ov020_021fd81c(state, data_ov020_021fe470[0],
                                        data_ov020_021fe470[1], 0);
                    break;
                } else if (selected >= 0) {
                    if (selected != FIELD(s32, presentation, 0x14)) {
                        func_02092260(state, 0);
                        func_02093d50(presentation, selected);
                        func_ov020_021fde9c(state);
                        func_ov020_021fdee0(state);
                    }
                } else if (func_02095860((u8 *)state + 0x70,
                                          (u8 *)state + 0x30, 0, 4) != 0) {
                    func_02092260(state, 3);
                    func_ov020_021fd81c(state, data_ov020_021fe468[0],
                                        data_ov020_021fe468[1], 0);
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
    }
    func_ov020_021fde6c(state);
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
extern "C" s32 func_ov020_021fe2a4(void *state)
{
    void *list = FIELD(void *, state, 0x1dc);
    void *presentation = FIELD(void *, list, 0x44);

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_020946a8(presentation, 4);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while the opening sequence begins. */
    case 1:
        if (func_02093ffc(presentation) != 0) {
            if (FIELD(s32, presentation, 0xc) !=
                FIELD(s32, presentation, 0x10)) {
                func_ov020_021fdee0(state);
                func_02092288(state, 8);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (func_ov020_021fd280(list) != 0)
                func_ov020_021fde9c(state);
            break;
        }
        /* Completed opening deliberately continues into interactive state 2. */
    case 2:
        func_02093de4(presentation);
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            if (func_020946c8(presentation, (u8 *)state + 0x30) != 0) {
                func_02092260(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            func_02094738(presentation, 6);
            func_ov020_021fd81c(state, data_ov020_021fe450[0],
                                data_ov020_021fe450[1], 0);
        }
        break;
    }
    func_ov020_021fde6c(state);
    return 0;
}
