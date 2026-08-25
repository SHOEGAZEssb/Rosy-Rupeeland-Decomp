#include "tingle/types.h"

/*
 * Overlay 6 transition preparation. This recovered two-phase callback updates
 * geometry, binds the auxiliary, sets a state flag, and installs a transition.
 */

typedef struct Overlay006TransitionPrepareState {
    u8 field_000[0x04];
    s32 phase_004;
    s32 timer_008;
    u8 field_00c[0x14];
    u32 flags_020;
    u8 field_024[0x40];
    void *controllerMember_064;
    u8 field_068[0x2c];
    void *auxiliary_094;
} Overlay006TransitionPrepareState;

#ifdef __cplusplus
extern "C" {
#endif
extern const s32 data_ov006_021fbc48[2];
extern void Overlay006_InterpolateGeometry(void *state);
extern void AreaInfoPanelPresentation_ShowIndex(void *auxiliary, void *controllerMember);
extern void Overlay006_InitTransitionState(void *state, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * In phase zero, call Overlay006_InterpolateGeometry, bind auxiliary_094 to
 * controllerMember_064 through AreaInfoPanelPresentation_ShowIndex, advance phase, clear timer_008,
 * and intentionally fall through. In phase one, force flags_020 bit 0 to one
 * and initialize the transition from data_ov006_021fbc48. Other phases do
 * nothing. Return zero. Geometry and auxiliary effects are delegated; the
 * phase fallthrough and flag update are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay006_PrepareTransition(Overlay006TransitionPrepareState *state)
{
    switch (state->phase_004) {
    case 0:
        Overlay006_InterpolateGeometry(state);
        AreaInfoPanelPresentation_ShowIndex(state->auxiliary_094, state->controllerMember_064);
        state->phase_004++;
        state->timer_008 = 0;
        /* Intentional same-frame fallthrough into phase one. */
    case 1:
        state->flags_020 = (state->flags_020 & ~1) | 1;
        Overlay006_InitTransitionState(state, data_ov006_021fbc48[0],
                            data_ov006_021fbc48[1]);
        break;
    }
    return 0;
}
