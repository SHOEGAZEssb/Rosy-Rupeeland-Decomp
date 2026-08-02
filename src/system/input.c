#include "tingle/system.h"

/*
 * NON-MATCHING
 *
 * Address: 0x02001064
 * Size:    0xD8
 *
 * The behavior and PadState layout are confirmed. Compiler release, flags,
 * and expression ordering still need to be matched against the retail code.
 */
void UpdateKeyState(u16 keys, int stateIndex)
{
    PadState *state = &gSystemState.pads[stateIndex];
    u16 repeated = 0;
    u16 mask = 1;
    int i;

    state->pressed = keys & (u16)~state->held;
    state->released = (u16)~keys & state->held;

    for (i = 0; i < PAD_KEY_COUNT; i++, mask <<= 1) {
        if ((keys & mask) == 0) {
            state->repeatTimers[i] = 0;
        } else if ((state->held & mask) == 0) {
            repeated |= mask;
            state->repeatTimers[i] = state->repeatStartDelay;
        } else {
            state->repeatTimers[i]--;
            if (state->repeatTimers[i] == 0) {
                repeated |= mask;
                state->repeatTimers[i] = state->repeatInterval;
            }
        }
    }

    state->repeated = repeated;
    state->held = keys;
}
