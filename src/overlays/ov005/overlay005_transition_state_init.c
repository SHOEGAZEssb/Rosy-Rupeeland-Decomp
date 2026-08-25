#include "tingle/types.h"

/*
 * Overlay 5 transition-state initialization. This recovered helper retains
 * two caller values and clears the phase and timer fields.
 */

typedef struct Overlay005TransitionState {
    u8 field_000[0x04];
    s32 phase_004;
    s32 timer_008;
    u8 field_00c[0x18];
    s32 first_024;
    s32 second_028;
} Overlay005TransitionState;

/*
 * Store first and second at +0x24/+0x28, clear phase_004 and timer_008, and
 * return no value. The concrete meaning of the retained values is unknown.
 * The original's argument-register spill/reload is compiler-sensitive; this
 * portable equivalent has no allocation, SDK, or hardware effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay005_InitTransitionState(Overlay005TransitionState *state, s32 first,
                          s32 second)
{
    state->first_024 = first;
    state->second_028 = second;
    state->phase_004 = 0;
    state->timer_008 = 0;
}
