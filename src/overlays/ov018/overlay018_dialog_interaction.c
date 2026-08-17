#include "tingle/types.h"

/* Overlay 18 dialog-prefaced path interaction and retry/reset state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov018_021ffc00[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_020922b0(void *, s32, s32);
extern void func_02092c8c(s32, s32);
extern void TitleDialog_ClearTextRect(void *);
extern void func_ov003_021fb7ec(void *);
extern void func_ov018_021fcf40(void *, s32, s32, s32);
extern void func_ov018_021fd788(void *);
extern void func_ov018_021fda10(void *, u16);
extern s32 func_ov018_021fda60(void *);
extern void func_ov018_021fdb7c(void *, s32);
extern void func_ov018_021fdbd4(void *);
extern void func_ov018_021fdce4(void *);
extern void func_ov018_021ff3cc(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the eight-phase dialog interaction callback selected by +4. Present
 * message 0x1EA, wait for dialog completion, set sub-display brightness 0x10,
 * then collect a path until point-buffer latch +0x24 becomes 2 or 3. A result
 * at +0x3C8 selects transition 0x021FFC00. Otherwise, latch 2 with +0x41C clear
 * presents message 0x1EB when classification +0x420 is 1 or 0x20B otherwise;
 * other cases skip that dialog. Finally fade through +0x1A8, write the composed
 * sub-display brightness, clear raster +0x190 and reset point buffer +0x58,
 * then return to phase 2. Phases 0, 2, and 6 deliberately fall through after
 * advancing. Always synchronize frame/UI state and return zero. Dialog, audio,
 * path, raster, transition, and fade state change; Nintendo DS master-brightness
 * register 0x04001052 is written directly.
 */
extern "C" s32 func_ov018_021fef2c(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        func_02092c8c(2, -8);
        func_ov018_021fda10(state, 0x1ea);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough into the dialog update. */
    case 1:
        if (func_ov018_021fda60(state)) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x418));
            func_02092c8c(2, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        *(volatile u16 *)0x04001052 = 0x10;
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough into path collection. */
    case 3: {
        func_ov018_021fdce4(state);
        u32 latch = FIELD(u32, FIELD(void *, state, 0x58), 0x24);
        if (latch >= 2 && latch <= 3) {
            func_ov018_021fdb7c(state, 0);
            func_020922b0(state, 0x4c, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    case 4:
        if (FIELD(s32, state, 0x3c8) != 0) {
            func_ov018_021fdbd4(state);
            func_ov018_021fcf40(state, data_ov018_021ffc00[0],
                                data_ov018_021ffc00[1], 0);
        } else if (FIELD(s32, FIELD(void *, state, 0x58), 0x24) == 2 &&
                   FIELD(s32, state, 0x41c) == 0) {
            func_02092c8c(2, -8);
            func_ov018_021fda10(state,
                FIELD(s32, state, 0x420) == 1 ? 0x1eb : 0x20b);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            FIELD(s32, state, 4) += 2;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 5:
        if (func_ov018_021fda60(state)) {
            TitleDialog_ClearTextRect(FIELD(void *, state, 0x418));
            func_02092c8c(2, 0);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 6:
        func_02091bac((u8 *)state + 0x1a8, 1, 0x10, 0, 0x14);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough into the fade update. */
    case 7:
        *(volatile u16 *)0x04001052 =
            func_02091c7c((u8 *)state + 0x1a8, 1) |
            ((0x10 - FIELD(s32, state, 0x1b8)) << 8);
        if (func_02091cf0((u8 *)state + 0x1a8)) {
            func_ov003_021fb7ec(FIELD(void *, state, 0x190));
            func_ov018_021ff3cc(FIELD(void *, state, 0x58));
            FIELD(s32, state, 4) = 2;
            FIELD(s32, state, 8) = 0;
        }
        break;
    }
    func_ov018_021fd788(state);
    return 0;
}
