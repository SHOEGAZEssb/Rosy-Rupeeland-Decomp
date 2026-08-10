#include "tingle/types.h"

/* Overlay 19 numeric/icon selection input and confirmation state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov019_021fd600[2];
extern const s32 data_ov019_021fd608[2];
extern void *gGameWork;
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, u32);
extern u32 genrand_int32(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(void *);
extern void func_02092260(void *, s32);
extern s32 func_ov002_021fbb68(void *, const void *);
extern s32 func_ov002_021fbc54(void *);
extern void func_ov002_021fbd64(void *);
extern s32 func_ov002_021fbd98(void *);
extern s32 func_ov002_021fbdb0(void *);
extern void func_ov019_021fce00(void *, s32, s32, s32);
extern void func_ov019_021fd170(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the selection state machine in +4. State 0 advances and falls through;
 * state 1 waits for input bit 5 and a confirmed overlay-2 icon hit, then emits
 * randomized event 0x3C80/0x3C81. State 2 waits for the press animation. State
 * 3 applies digit/backspace/clear keys; index 12 selects transition 0x021FD600,
 * while index 13 validates the enabled numeric value. In mode +0x54==1 it must
 * not exceed the value queried from gLupyContext; failures emit event 9 and
 * restart. Success emits 0x3C82, stores the selected value at GameWork +0x7CC,
 * sets flag 0x390, and selects transition 0x021FD608. State 4 waits for the
 * control release, restores the selected icon, and restarts. State 10 delays
 * 21 frames before restarting; states 5..9 are intentionally idle. Always run
 * helper update 0x021FD170 and return zero. Input, PRNG, event, GameWork,
 * presentation, and transition state may change; no direct hardware access.
 */
extern "C" s32 func_ov019_021fd278(void *state)
{
    void *presentation = FIELD(void *, state, 0x5c);
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough into input polling. */
    case 1:
        if ((FIELD(u32, state, 0x20) & 0x20) &&
            func_ov002_021fbb68(presentation,
                                (u8 *)state + 0x30) >= 0) {
            func_02092260(state,
                          (genrand_int32() & 1) ? 0x3c80 : 0x3c81);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (func_ov002_021fbd98(presentation) == 0) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (func_ov002_021fbc54(presentation)) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
            break;
        }
        func_ov002_021fbd64(presentation);
        if (FIELD(s32, presentation, 0x8c) == 12) {
            func_ov019_021fce00(state, data_ov019_021fd600[0],
                                data_ov019_021fd600[1], 0);
        } else if (FIELD(s32, presentation, 0x8c) == 13) {
            s32 value = FIELD(s32, presentation, 0x88);
            if (FIELD(s32, presentation, 0x90) == 0 ||
                (FIELD(s32, state, 0x54) == 1 &&
                 value >= GamePhaseCurrencyHud_GetCurrency(gLupyContext))) {
                func_02092260(state, 9);
                FIELD(s32, state, 4) = 0;
                FIELD(s32, state, 8) = 0;
            } else {
                func_02092260(state, 0x3c82);
                FIELD(s32, gGameWork, 0x7cc) = value;
                GameWork_SetFlag(gGameWork, 0x390);
                func_ov019_021fce00(state, data_ov019_021fd608[0],
                                    data_ov019_021fd608[1], 0);
            }
        }
        break;
    case 4:
        if (func_ov002_021fbdb0(presentation)) {
            func_ov002_021fbd64(presentation);
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 10:
        FIELD(s32, state, 8)++;
        if (FIELD(s32, state, 8) > 0x14) {
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    func_ov019_021fd170(state);
    return 0;
}
