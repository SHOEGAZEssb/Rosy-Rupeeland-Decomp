#include "tingle/types.h"

/* Overlay 18 primary path-interaction, transition, and sub-display fade callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define INPUT_BIT(state, bit) ((FIELD(u32, state, 0x20) & (1U << (bit))) != 0)

extern const s32 data_ov018_021ffbc8[2];
extern const s32 data_ov018_021ffc18[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_02092260(void *, s32);
extern void func_020922b0(void *, s32, s32);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_ov003_021fb7ec(void *);
extern void func_ov018_021fcf40(void *, s32, s32, s32);
extern void func_ov018_021fd788(void *);
extern void func_ov018_021fdb7c(void *, s32);
extern void func_ov018_021fdbd4(void *);
extern void func_ov018_021fdce4(void *);
extern void func_ov018_021fe184(void *, const void *);
extern void func_ov018_021ff3cc(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the four-phase main interaction callback selected by +4. Phase 0 sets
 * sub-display brightness to 0x10, advances, and falls through. Phase 1 either
 * handles a bit-4 coordinate hit (bit 5 emits event 3 and selects transition
 * 0x021FFBC8) or runs path processing until point-buffer latch +0x24 becomes 2
 * or 3, then advances. Phase 2 selects transition 0x021FFC18 when result latch
 * +0x3C8 is set; otherwise it initializes fade object +0x1A8 with 1/0x10/0/20
 * and advances. Phase 3 writes the fade-composed value to sub-display master
 * brightness, then clears raster +0x190 and resets point buffer +0x58 when the
 * fade completes, returning to phase zero. Always synchronize frame/UI state
 * and return zero. Scene, event, animation, raster, and fade state change; this
 * function directly writes Nintendo DS register 0x04001052.
 */
extern "C" s32 func_ov018_021fe854(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        *(volatile u16 *)0x04001052 = 0x10;
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough into the active interaction phase. */
    case 1:
        if (INPUT_BIT(state, 4) &&
            func_02095860((u8 *)state + 0xd8, (u8 *)state + 0x30,
                          0, 4)) {
            if (INPUT_BIT(state, 5)) {
                func_02092260(state, 3);
                func_ov018_021fcf40(state, data_ov018_021ffbc8[0],
                                    data_ov018_021ffbc8[1], 0);
            }
            func_ov018_021fe184((u8 *)state + 0x64,
                                (u8 *)state + 0x30);
        } else {
            func_ov018_021fdce4(state);
            u32 latch = FIELD(u32, FIELD(void *, state, 0x58), 0x24);
            if (latch >= 2 && latch <= 3) {
                func_ov018_021fdb7c(state, 0);
                func_020922b0(state, 0x4c, 0);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            }
        }
        break;
    case 2:
        if (FIELD(s32, state, 0x3c8) != 0) {
            func_ov018_021fdbd4(state);
            func_ov018_021fcf40(state, data_ov018_021ffc18[0],
                                data_ov018_021ffc18[1], 0);
        } else {
            func_02091bac((u8 *)state + 0x1a8, 1, 0x10, 0, 0x14);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3: {
        FIELD(s32, state, 0x414) = 0;
        s32 brightness = func_02091c7c((u8 *)state + 0x1a8, 1) |
                         ((0x10 - FIELD(s32, state, 0x1b8)) << 8);
        *(volatile u16 *)0x04001052 = brightness;
        if (func_02091cf0((u8 *)state + 0x1a8)) {
            func_ov003_021fb7ec(FIELD(void *, state, 0x190));
            func_ov018_021ff3cc(FIELD(void *, state, 0x58));
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    }
    func_ov018_021fd788(state);
    return 0;
}
