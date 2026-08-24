#include "tingle/types.h"

/* Overlay 19 opening footer animation and transition callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov019_021fd5e8[2];
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void func_02092260(void *, s32);
extern void func_ov002_021fbdc0(void *);
extern s32 func_ov002_021fbe08(void *);
extern s32 func_ov002_021fbe60(void *);
extern void func_ov019_021fce00(void *, s32, s32, s32);
extern void func_ov019_021fd170(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the two-phase opening callback selected by +4. Phase 0 enables currency-HUD
 * context mode 1, starts overlay-2 footer animation on presentation +0x5C,
 * sets scene flag bit 0, advances, and deliberately falls through. Phase 1
 * updates that animation; while incomplete, store the negated animation value
 * at +0x60. On completion, emit event 0x3C84, clear +0x60, and select transition
 * pair data_ov019_021FD5E8. Always run scene/helper update 0x021FD170 and return
 * zero. Presentation, event, transition, global SDK, and caller state may
 * change; no direct hardware access occurs.
 */
extern "C" s32 func_ov019_021fd1b8(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);
        func_ov002_021fbdc0(FIELD(void *, state, 0x5c));
        FIELD(u32, state, 0x20) |= 1;
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough into the first animation update. */
    case 1:
        if (func_ov002_021fbe08(FIELD(void *, state, 0x5c))) {
            func_02092260(state, 0x3c84);
            FIELD(s32, state, 0x60) = 0;
            func_ov019_021fce00(state, data_ov019_021fd5e8[0],
                                data_ov019_021fd5e8[1], 0);
        } else {
            FIELD(s32, state, 0x60) =
                -func_ov002_021fbe60(FIELD(void *, state, 0x5c));
        }
        break;
    }
    func_ov019_021fd170(state);
    return 0;
}
