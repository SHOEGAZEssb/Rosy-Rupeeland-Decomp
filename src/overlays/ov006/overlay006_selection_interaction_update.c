#include "tingle/types.h"

/*
 * Overlay 6 selection-interaction update. This recovered three-phase loop
 * starts and polls an embedded controller, handles directional input, updates
 * geometry, and advances the auxiliary animation.
 */

typedef struct Overlay006SelectionState {
    u8 bytes[0xb8];
} Overlay006SelectionState;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02093b20(void *controller);
extern s32 func_02093c78(void *controller);
extern void func_ov006_021fb9b4(void *state);
extern void func_02093b30(void *controller);
extern void func_02093b3c(void *controller);
extern void func_02093b64(void *controller);
extern s32 func_02093bdc(void *controller);
extern void func_02092260(void *state, s32 value);
extern s32 func_ov006_021fb950(void *state);
#ifdef __cplusplus
}
#endif

/* Advance phase +0x04 and reset timer +0x08. */
static void overlay006_advance_selection(Overlay006SelectionState *state)
{
    FIELD(s32, state, 0x004)++;
    FIELD(s32, state, 0x008) = 0;
}

/*
 * In phase zero, call func_02093b20 on controller +0x58, advance, and fall
 * through. Phase one polls func_02093c78. While false, update geometry through
 * func_ov006_021fb9b4 and finish the frame. When true, update geometry only if
 * +0x64 differs from +0x68, advance to phase two, and process it immediately.
 * Phase two calls func_02093b30, reads the input halfword through pointer +0x2C,
 * calls func_02093b3c for bit 0x40 or func_02093b64 for bit 0x80, then polls
 * func_02093bdc. When that poll succeeds, call func_02092260(state,0), decrement
 * phase back to one, and clear the timer. Always call func_ov006_021fb950 and
 * return zero. Controller/input meanings beyond these confirmed branches remain
 * unidentified; effects are delegated and there is no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov006_021fbafc(Overlay006SelectionState *state)
{
    void *controller = (u8 *)state + 0x58;

    switch (FIELD(s32, state, 0x004)) {
    case 0:
        func_02093b20(controller);
        overlay006_advance_selection(state);
        /* Intentional same-frame fallthrough. */
    case 1:
        if (func_02093c78(controller)) {
            if (FIELD(s32, state, 0x064) != FIELD(s32, state, 0x068)) {
                func_ov006_021fb9b4(state);
            }
            overlay006_advance_selection(state);
        } else {
            func_ov006_021fb9b4(state);
            break;
        }
        /* Successful phase one intentionally enters phase two immediately. */
    case 2:
        {
            u16 input;

            func_02093b30(controller);
            input = *FIELD(u16 *, state, 0x02c);
            if (input & 0x40) {
                func_02093b3c(controller);
            } else if (input & 0x80) {
                func_02093b64(controller);
            }
            if (func_02093bdc(controller)) {
                func_02092260(state, 0);
                FIELD(s32, state, 0x004)--;
                FIELD(s32, state, 0x008) = 0;
            }
        }
        break;
    }

    func_ov006_021fb950(state);
    return 0;
}

#undef FIELD
