#include "tingle/types.h"

/*
 * Overlay 2 phase countdown. This recovered helper advances a small nonnegative
 * delay associated with the currently selected keypad icon.
 */

typedef struct Overlay002PhaseCountdownState {
    u8 field_000[0x94];
    s32 phase_094;
} Overlay002PhaseCountdownState;

/*
 * Decrement phase_094 only when it is positive, then return its resulting
 * value. No other state, SDK service, or hardware is touched.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov002_021fbd98(Overlay002PhaseCountdownState *state)
{
    if (state->phase_094 > 0) {
        state->phase_094--;
    }
    return state->phase_094;
}
