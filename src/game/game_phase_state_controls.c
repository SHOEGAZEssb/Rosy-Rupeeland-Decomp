#include "tingle/game_phase_state.h"

/* Propagate active-phase control values to the owned object and helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseVisualEffect_UpdatePosition(void *object, const void *state);
extern void GamePhaseVisualEffect_SetEnabled(void *object, s32 value);
extern void func_0201e054(void *object, s32 value);
extern void ActorCollection_SetEnabled(void *object, s32 value);
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
    ActorCollection_SetEnabled(self->actorCollectionStorage, enabled);
    GamePhaseVisualEffect_SetEnabled(self->helper_2eb4, enabled);
    func_0201e054(self->renderHelperStorage, enabled);
}

/*
 * Send the placement state through owned virtual method 0x18 and synchronize
 * helper_2eb4. No value is returned.
 */
void GamePhaseState_ApplyPlacementState(GamePhaseState *self,
                                        const void *placementState)
{
    void **vtable = *(void ***)self->phaseObject;
    ((PhasePlacementMethod)vtable[6])(self->phaseObject, placementState);
    GamePhaseVisualEffect_UpdatePosition(self->helper_2eb4, placementState);
}
