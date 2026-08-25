#include "tingle/types.h"

/*
 * Overlay 0 grid transition handling. This recovered helper accepts a
 * controller transition at its midpoint, updates row-dependent placement, and
 * runs the associated overlay refresh stages.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridTransitionState {
    u8 field_000[0x264];
    s32 scrollY_264;
    s32 originY_268;
    void *controller_26c;
} Overlay000GridTransitionState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay000_DestroyRowResources(Overlay000GridTransitionState *state,
                                s32 value);
extern void Overlay000_CreateRowResources(Overlay000GridTransitionState *state,
                                s32 value);
extern void Overlay000_SyncSelection(Overlay000GridTransitionState *state);
extern void Overlay000_Grid_Render(Overlay000GridTransitionState *state);
#ifdef __cplusplus
}
#endif

/*
 * Return 0 unless controller field 0x30 equals half of signed field 0x2C,
 * rounded toward zero. At that midpoint, a change between controller fields
 * 0x0C and 0x10 recomputes originY_268, updates the linked object's Y field,
 * and dispatches values from controller offsets 0x74 and 0x70. The two final
 * refresh stages always run for an accepted midpoint, after which 1 is
 * returned. Callee side effects are not yet fully identified.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay000_Grid_UpdateTransition(Overlay000GridTransitionState *state)
{
    void *controller = state->controller_26c;
    s32 row = FIELD(s32, controller, 0x0c);
    s32 rowTarget = FIELD(s32, controller, 0x10);

    if (FIELD(s32, controller, 0x30) != FIELD(s32, controller, 0x2c) / 2) {
        return 0;
    }
    if ((row != rowTarget) != 0) {
        state->originY_268 = 0x34 - row * 0x24 - state->scrollY_264;
        FIELD(s32, FIELD(void *, state, 0x08), 0x1c) = state->originY_268;
        Overlay000_DestroyRowResources(state, FIELD(s32, controller, 0x74));
        Overlay000_CreateRowResources(state, FIELD(s32, controller, 0x70));
    }
    Overlay000_SyncSelection(state);
    Overlay000_Grid_Render(state);
    return 1;
}
