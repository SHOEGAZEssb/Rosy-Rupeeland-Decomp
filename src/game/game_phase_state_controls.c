#include "tingle/game_phase_state.h"

/* Propagate active-phase control values to the owned object and helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_SetEnabled(ActorCollection *self, s32 enabled);
#ifdef __cplusplus
}
#endif

typedef void (*PhaseControlMethod)(void *self, s32 value);
typedef void (*PhasePlacementMethod)(void *self, const void *state);

/*
 * Send enabled through owned virtual method 0x24 and synchronize the helpers
 * at offsets 0x0004, 0x2eb4, and 0x2f58. No value is returned.
 */
void GamePhaseState_SetEnabled(GamePhaseState *self, s32 enabled)
{
    void **vtable = *(void ***)self->phaseObject;
    ((PhaseControlMethod)vtable[9])(self->phaseObject, enabled);
    ActorCollection_SetEnabled(&self->actorCollection, enabled);
    GamePhaseVisualEffect_SetEnabled(&self->visualEffect, enabled);
    RuntimePresentationManager_SetEnabled(&self->presentationManager, enabled);
}

/*
 * Send the placement state through owned virtual method 0x18 and synchronize
 * the embedded visual effect. No value is returned.
 */
void GamePhaseState_ApplyPlacementState(GamePhaseState *self,
                                        const void *placementState)
{
    void **vtable = *(void ***)self->phaseObject;
    ((PhasePlacementMethod)vtable[6])(self->phaseObject, placementState);
    GamePhaseVisualEffect_UpdatePosition(
        &self->visualEffect, (const VecFx32Object *)placementState);
}
