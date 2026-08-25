#include "tingle/types.h"

/* Overlay 29 overlay-2 selection/result state machine and mode-specific routing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern void *gGamePhaseCurrencyHud;
extern const s32 data_ov029_021feca0[];
extern const s32 data_ov029_021fec08[];
extern const s32 data_ov029_021fecb8[];
extern const s32 data_ov029_021fecb0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern u32 genrand_int32(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GraphicsSpriteText_FormatDecimal(void *, s32, u32, s32);
extern void func_02092260(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern s32 func_ov002_021fbb68(void *, const void *);
extern s32 func_ov002_021fbc54(void *);
extern void func_ov002_021fbd64(void *);
extern s32 func_ov002_021fbd98(void *);
extern s32 func_ov002_021fbdb0(void *);
extern void func_ov029_021fce4c(void *, s32, s32);
extern void func_ov029_021fd6fc(void *);
extern void func_ov029_021fd7a8(void *, s32);
extern s32 func_ov029_021fd850(void *);
#ifdef __cplusplus
}
#endif

static void Overlay029_SetPair(void *state, const s32 *pair)
{
    func_ov029_021fce4c(state, pair[0], pair[1]);
}

static void Overlay029_ResetPhase(void *state, s32 phase)
{
    FIELD(s32, state, 4) = phase;
    FIELD(s32, state, 8) = 0;
}

/*
 * Runs the overlay-2 selection state machine after first updating controller
 * +0x9C. Phases 0/1 wait for a gated touch hit on child +0xA8 and play random
 * event 0x3C80/0x3C81; phases 2/3 wait for child animation/result delivery.
 * Child result kind 13 validates count +0xAC against global context for modes
 * 2..7, handles the mode-7 zero-count unlock through game flag 0x38A, formats
 * nonzero counts into buffer +0xB0 with color 0xFF676980, and routes callback
 * pairs 0x021FECA0 or 0x021FEC08. Result kind 12 routes by source mode +0x5C:
 * modes 0/1 cancel, mode 4 enters phase 10, modes 2/3/5/6 choose entry 1 or 2
 * and pair 0x021FECB8, while mode 7 sets the flag and pair 0x021FECB0. Phase 4
 * waits for child completion before resetting; phases 10/11 run controller
 * confirmation around a fade; phase 20 delays twenty ticks after an invalid
 * result. Fields +0x6C/+0xAC and game flags may change. The common runtime
 * update always runs, zero is returned, and input, audio, transition, child,
 * controller, UI, and game-work SDK state may change.
 */
extern "C" s32 func_ov029_021fdc5c(void *state)
{
    func_ov029_021fd850(state);
    void *child = FIELD(void *, state, 0xa8);
    switch (FIELD(s32, state, 4)) {
    case 0:
        Overlay029_ResetPhase(state, 1);
        /* fall through */
    case 1:
        if ((FIELD(u32, state, 0x20) & 0x20) &&
            func_ov002_021fbb68(child, (u8 *)state + 0x30) >= 0) {
            func_02092260(state,
                          (genrand_int32() & 1) ? 0x3c80 : 0x3c81);
            Overlay029_ResetPhase(state, 2);
        }
        break;
    case 2:
        if (func_ov002_021fbd98(child) == 0)
            Overlay029_ResetPhase(state, 3);
        break;
    case 3:
        if (func_ov002_021fbc54(child) != 0) {
            Overlay029_ResetPhase(state, 4);
            break;
        }
        func_ov002_021fbd64(child);
        if (FIELD(s32, child, 0x8c) == 13) {
            if (FIELD(s32, child, 0x90) == 0) {
                func_02092260(state, 9);
                Overlay029_ResetPhase(state, 20);
                break;
            }
            FIELD(s32, state, 0xac) = FIELD(s32, child, 0x88);
            s32 mode = FIELD(s32, state, 0x5c);
            if (mode >= 2 && GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud) <=
                             FIELD(s32, state, 0xac)) {
                func_02092260(state, 9);
                Overlay029_ResetPhase(state, 20);
                break;
            }
            if (mode == 7 && FIELD(s32, state, 0xac) == 0) {
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x9c));
                FIELD(s32, state, 0x6c) = 3;
                GameWork_SetFlag(gGameWork, 0x38a);
                Overlay029_SetPair(state, data_ov029_021feca0);
            } else if (FIELD(s32, state, 0xac) == 0) {
                func_02092260(state, 9);
                Overlay029_ResetPhase(state, 20);
            } else {
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x9c));
                GraphicsSpriteText_FormatDecimal((u8 *)state + 0xb0,
                              FIELD(s32, state, 0xac), 0xff676980, 0);
                Overlay029_SetPair(state, data_ov029_021fec08);
            }
        } else if (FIELD(s32, child, 0x8c) == 12) {
            s32 mode = FIELD(s32, state, 0x5c);
            if (mode == 4) {
                func_ov029_021fd7a8(state, 2);
                Overlay029_ResetPhase(state, 10);
                DisplayBrightness_StartMaskedTransitions(1, -8);
            } else if (mode <= 1) {
                func_02092260(state, 9);
                Overlay029_ResetPhase(state, 0);
            } else if (mode == 7) {
                TitleDialog_ClearTextRect(FIELD(void *, state, 0x9c));
                func_02092260(state, 3);
                FIELD(s32, state, 0xac) = 0;
                FIELD(s32, state, 0x6c) = 0;
                GameWork_SetFlag(gGameWork, 0x38a);
                Overlay029_SetPair(state, data_ov029_021fecb0);
            } else {
                func_ov029_021fd7a8(state,
                                    (mode == 5 || mode == 6) ? 1 : 2);
                func_02092260(state, 3);
                FIELD(s32, state, 0xac) = 0;
                FIELD(s32, state, 0x6c) = 0;
                DisplayBrightness_StartMaskedTransitions(1, -8);
                Overlay029_SetPair(state, data_ov029_021fecb8);
            }
        }
        break;
    case 4:
        if (func_ov002_021fbdb0(child) != 0) {
            func_ov002_021fbd64(child);
            Overlay029_ResetPhase(state, 0);
        }
        break;
    case 10:
        if (func_ov029_021fd850(state) != 0) {
            func_ov029_021fd7a8(state, 1);
            Overlay029_ResetPhase(state, 11);
        }
        break;
    case 11:
        if (func_ov029_021fd850(state) != 0) {
            DisplayBrightness_StartMaskedTransitions(1, 0);
            Overlay029_ResetPhase(state, 0);
        }
        break;
    case 20:
        if (++FIELD(s32, state, 8) > 20)
            Overlay029_ResetPhase(state, 0);
        break;
    }
    func_ov029_021fd6fc(state);
    return 0;
}
