/*
 * Portable DS-compatible button-state derivation.
 *
 * This mirrors the recovered UpdateKeyState contract: initial presses repeat
 * immediately, then independently after 20 frames and every four frames.
 */
#include "tingle/native_input.h"

void TingleNativeInput_UpdateButtons(TingleNativeButtonState *state, u16 held,
                                     TingleNativeInput *input)
{
    u16 previous = input->held;
    u16 mask = 1;
    s32 index;

    input->pressed = (u16)(held & ~previous);
    input->released = (u16)(~held & previous);
    input->repeated = 0;

    for (index = 0; index < TINGLE_NATIVE_KEY_COUNT; ++index, mask <<= 1) {
        if ((held & mask) != 0) {
            if ((previous & mask) == 0) {
                input->repeated |= mask;
                state->repeat_timers[index] = TINGLE_NATIVE_REPEAT_START_DELAY;
            } else {
                state->repeat_timers[index]--;
                if (state->repeat_timers[index] == 0) {
                    input->repeated |= mask;
                    state->repeat_timers[index] = TINGLE_NATIVE_REPEAT_INTERVAL;
                }
            }
        } else {
            state->repeat_timers[index] = 0;
        }
    }
    input->held = held;
}
