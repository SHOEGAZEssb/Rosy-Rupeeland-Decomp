#include "tingle/types.h"

/*
 * Overlay 5 counter-state initialization. This recovered helper installs a
 * descriptor and clears the three adjacent state words.
 */

typedef struct Overlay005CounterState {
    const void *descriptor_000;
    s32 field_004;
    s32 field_008;
    s32 field_00c;
} Overlay005CounterState;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov005_021fcab0[];
#ifdef __cplusplus
}
#endif

/*
 * Set descriptor_000 to data_ov005_021fcab0 and clear +0x04, +0x08, and
 * +0x0C. Return state. The fields' semantics remain unidentified and this
 * initializer performs no allocation, SDK calls, or hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005CounterState *func_ov005_021fb82c(Overlay005CounterState *state)
{
    state->descriptor_000 = data_ov005_021fcab0;
    state->field_008 = 0;
    state->field_004 = 0;
    state->field_00c = 0;
    return state;
}
