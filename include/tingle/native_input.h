#ifndef TINGLE_NATIVE_INPUT_H
#define TINGLE_NATIVE_INPUT_H

#include "tingle/native_platform.h"

enum {
    TINGLE_NATIVE_KEY_COUNT = 12,
    TINGLE_NATIVE_REPEAT_START_DELAY = 20,
    TINGLE_NATIVE_REPEAT_INTERVAL = 4
};

typedef struct TingleNativeButtonState {
    u8 repeat_timers[TINGLE_NATIVE_KEY_COUNT];
} TingleNativeButtonState;

/* Derives retail-compatible button edges and repeat events from a held mask. */
void TingleNativeInput_UpdateButtons(TingleNativeButtonState *state, u16 held,
                                     TingleNativeInput *input);

#endif
