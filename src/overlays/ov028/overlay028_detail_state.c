#include "tingle/types.h"

/* Overlay 28 detail-panel transition and two-choice interaction state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay028Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay028Row;

extern const s32 data_ov028_021ff218[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02002d94(void);
extern void func_02092260(void *, s32);
extern s32 func_02092910(void *, const void *);
extern void func_02092c8c(s32, s32);
extern void func_02093adc(void *, s32, s32, s32);
extern void func_02093b20(void *);
extern void func_02093b30(void *);
extern void func_02093b8c(void *);
extern void func_02093bb0(void *);
extern s32 func_02093bd4(void *);
extern s32 func_02093bdc(void *);
extern s32 func_02093c64(void *);
extern s32 func_02093c78(void *);
extern void func_02093d50(void *, s32);
extern void func_02093d7c(void *, s32);
extern void func_02094574(void *);
extern void func_020948d4(void *, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_020954e0(void *);
extern void func_020954f4(void *);
extern s32 func_02095860(void *, const void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_ov028_021fce28(void *);
extern void func_ov028_021fd274(void *);
extern void func_ov028_021fd2c4(void *);
extern void func_ov028_021fd2ec(void *);
extern void func_ov028_021fd34c(void *);
extern void func_ov028_021fd468(void *);
extern Overlay028Row *func_ov028_021fd5c8(void *);
extern void func_ov028_021fd8b8(void *, const void *, s32);
extern void func_ov028_021fd86c(void *);
extern void func_ov028_021fdad8(void *, s32, s32);
extern void func_ov028_021fe438(void *);
extern void func_ov028_021fe558(void *, s32);
extern void func_ov028_021fe6bc(void *);
#ifdef __cplusplus
}
#endif

static void Overlay028_NextPhase(void *state)
{
    FIELD(s32, state, 4)++;
    FIELD(s32, state, 8) = 0;
}

/*
 * Runs the detail-panel state machine at scene +4. Phases 0..2 fade from the
 * list into a detail view: they hide list/cursor sprites, populate effect owner
 * +0x224 from the selected row, configure two-choice controller +0x228, reset
 * optional choice children, and refresh randomized scanline ranges. Phases 3/4
 * initialize and process the two-choice control using D-pad/touch at +0x30,
 * debounce +0x1F8, buttons +0x1F0/+0x1F4, and control +0x144; a committed side
 * animates its child over four ticks and advances to phase 5. Phase 5 handles
 * cancellation or updates the displayed row at the choice animation midpoint.
 * Phases 10..12 fade back, restore list selection/sprites/cursor and controller
 * state, then install callback pair 0x021FF218. Other phases idle. The common
 * graphics update always runs and zero is returned. Input, audio, transitions,
 * PRNG, sprite, list, controller, and graphics SDK state may all change.
 */
extern "C" s32 func_ov028_021febd0(void *state)
{
    void *list = FIELD(void *, state, 0x220);
    void *listController = FIELD(void *, list, 0x44);
    void *choice = (u8 *)state + 0x228;
    const void *point = (u8 *)state + 0x30;
    s32 phase = FIELD(s32, state, 4);

    switch (phase) {
    case 0:
        FIELD(s32, state, 0x1f8) = 0;
        func_02092c8c(1, -0x10);
        Overlay028_NextPhase(state);
        /* fall through */
    case 1:
        if (func_02002d94() == 0)
            break;
        func_ov028_021fd2c4(list);
        func_ov028_021fd34c(list);
        FIELD(u16, FIELD(void *, state, 0x8c), 0x24) |= 4;
        func_02095940((u8 *)state + 0x98);
        FIELD(s32, state, 0x48) = 0x1d;
        {
            s32 selected = FIELD(s32, listController, 0x14);
            Overlay028Row *row = func_ov028_021fd5c8(list);
            func_ov028_021fd8b8(FIELD(void *, state, 0x224),
                                 row->descriptor, selected);
            func_02093adc(choice, 0, FIELD(s32, list, 0x3c) - 1, selected);
        }
        if (FIELD(s32, list, 0x40) > 1) {
            func_020954e0(FIELD(void *, state, 0x1f0));
            func_020954e0(FIELD(void *, state, 0x1f4));
        }
        func_ov028_021fce28((u8 *)state + 0x280);
        func_02092c8c(1, 0);
        Overlay028_NextPhase(state);
        break;
    case 2:
        if (func_02002d94() != 0)
            Overlay028_NextPhase(state);
        break;
    case 3:
        func_02093b20(choice);
        Overlay028_NextPhase(state);
        /* fall through */
    case 4: {
        func_02093b30(choice);
        u16 keys = FIELD(u16, FIELD(void *, state, 0x2c), 0);
        if (keys & 0x20) {
            func_02093bb0(choice);
        } else if (keys & 0x10) {
            func_02093b8c(choice);
        } else if (FIELD(u32, state, 0x20) & 0x10) {
            s32 leftHit = func_02092910(
                FIELD(void *, FIELD(void *, state, 0x1f0), 0x9c), point);
            if (leftHit && FIELD(s32, state, 0x1f8)) {
                func_02093bb0(choice);
            } else {
                s32 rightHit = func_02092910(
                    FIELD(void *, FIELD(void *, state, 0x1f4), 0x9c), point);
                if (rightHit && FIELD(s32, state, 0x1f8)) {
                    func_02093b8c(choice);
                } else if (FIELD(u32, state, 0x20) & 0x20) {
                    if (leftHit) {
                        func_02093bb0(choice);
                        FIELD(s32, state, 0x1f8) = 1;
                    } else if (rightHit) {
                        func_02093b8c(choice);
                        FIELD(s32, state, 0x1f8) = 1;
                    } else if (func_02095860((u8 *)state + 0x144,
                                             point, 0, 4)) {
                        func_02092260(state, 3);
                        FIELD(s32, state, 4) = 10;
                        FIELD(s32, state, 8) = 0;
                    }
                }
            }
        }
        if (func_02093bdc(choice)) {
            void *child;
            if (func_02093bd4(choice)) {
                child = FIELD(void *, state, 0x1f4);
                func_020948d4((u8 *)child + 0xc, 0xf4000);
                func_020948e4((u8 *)child + 0xc, 1, 0xf0000);
            } else {
                child = FIELD(void *, state, 0x1f0);
                func_020948d4((u8 *)child + 0xc, 0xc000);
                func_020948e4((u8 *)child + 0xc, 1, 0x10000);
            }
            FIELD(s32, child, 0x7c) = 4;
            FIELD(s32, child, 0x80) = 0;
            func_02092260(state, 0);
            Overlay028_NextPhase(state);
        }
        if (func_02093c64(choice))
            FIELD(s32, state, 0x1f8) = 0;
        break;
    }
    case 5:
        if (func_02093c78(choice)) {
            FIELD(s32, state, 4)--;
            FIELD(s32, state, 8) = 0;
        } else if (FIELD(s32, state, 0x250) ==
                   FIELD(s32, state, 0x24c) / 2) {
            s32 index = FIELD(s32, state, 0x234);
            Overlay028Row *rows = FIELD(Overlay028Row *, list, 0x38);
            func_ov028_021fd8b8(FIELD(void *, state, 0x224),
                                 rows[index].descriptor, index);
            func_ov028_021fe558(state, index);
        }
        break;
    case 10:
        func_02092c8c(1, -0x10);
        Overlay028_NextPhase(state);
        /* fall through */
    case 11:
        if (func_02002d94() == 0)
            break;
        func_020954f4(FIELD(void *, state, 0x1f0));
        func_020954f4(FIELD(void *, state, 0x1f4));
        func_ov028_021fd86c(FIELD(void *, state, 0x224));
        {
            s32 selected = FIELD(s32, state, 0x234);
            func_02093d7c(listController, selected);
            func_02093d50(listController, selected);
        }
        func_02094574(listController);
        func_ov028_021fd2ec(list);
        func_ov028_021fd274(list);
        func_ov028_021fd468(list);
        func_ov028_021fe6bc(state);
        func_02095928((u8 *)state + 0x98);
        func_ov028_021fce28((u8 *)state + 0x280);
        FIELD(s32, state, 0x48) = 0x1e;
        func_02092c8c(1, 0);
        Overlay028_NextPhase(state);
        break;
    case 12:
        if (func_02002d94() != 0)
            func_ov028_021fdad8(state,
                                data_ov028_021ff218[0],
                                data_ov028_021ff218[1]);
        break;
    }
    func_ov028_021fe438(state);
    return 0;
}
