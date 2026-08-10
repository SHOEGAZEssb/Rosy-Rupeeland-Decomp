/* Verifies native button edges and auto-repeat against UpdateKeyState. */
#include "tingle/native_input.h"

#include <stdlib.h>

int main(void)
{
    TingleNativeButtonState state = {{0}};
    TingleNativeInput input = {0};
    s32 frame;

    TingleNativeInput_UpdateButtons(&state, TINGLE_KEY_RIGHT, &input);
    if (input.held != TINGLE_KEY_RIGHT || input.pressed != TINGLE_KEY_RIGHT ||
        input.repeated != TINGLE_KEY_RIGHT || input.released != 0)
        return EXIT_FAILURE;

    for (frame = 1; frame < TINGLE_NATIVE_REPEAT_START_DELAY; ++frame) {
        TingleNativeInput_UpdateButtons(&state, TINGLE_KEY_RIGHT, &input);
        if (input.pressed != 0 || input.repeated != 0) return EXIT_FAILURE;
    }
    TingleNativeInput_UpdateButtons(&state, TINGLE_KEY_RIGHT, &input);
    if (input.repeated != TINGLE_KEY_RIGHT) return EXIT_FAILURE;

    for (frame = 1; frame < TINGLE_NATIVE_REPEAT_INTERVAL; ++frame) {
        TingleNativeInput_UpdateButtons(&state, TINGLE_KEY_RIGHT, &input);
        if (input.repeated != 0) return EXIT_FAILURE;
    }
    TingleNativeInput_UpdateButtons(&state, TINGLE_KEY_RIGHT, &input);
    if (input.repeated != TINGLE_KEY_RIGHT) return EXIT_FAILURE;

    TingleNativeInput_UpdateButtons(&state, TINGLE_KEY_RIGHT | TINGLE_KEY_A, &input);
    if (input.pressed != TINGLE_KEY_A || input.repeated != TINGLE_KEY_A)
        return EXIT_FAILURE;
    TingleNativeInput_UpdateButtons(&state, 0, &input);
    if (input.released != (TINGLE_KEY_RIGHT | TINGLE_KEY_A) || input.held != 0)
        return EXIT_FAILURE;
    return EXIT_SUCCESS;
}
