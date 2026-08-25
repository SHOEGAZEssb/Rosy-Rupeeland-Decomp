#include "tingle/game_phase_state.h"

/* Initialize and tear down the large state embedded in GamePhaseRuntime. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorFeedback_DestroyPresentations(void);
#ifdef __cplusplus
}
#endif

typedef struct PhaseOwnedVTable {
    void (*destroy)(void *self);
    void (*destroyAndFree)(void *self);
} PhaseOwnedVTable;

typedef struct PhaseOwned {
    PhaseOwnedVTable *vtable;
} PhaseOwned;

/*
 * Initialize five embedded subsystems, clear the configuration/owned pointer,
 * set renderFlags bits 0/1, and initialize the halfword controls at 0x2f90 to
 * 1 and 0x2f92 to 0x0808. Returns self.
 */
GamePhaseState *GamePhaseState_Init(GamePhaseState *self)
{
    self->configuration = 0;
    ActorCollection_Init(&self->actorCollection);
    OverlaySlot_Init(&self->overlaySlot);
    self->phaseObject = 0;
    GamePhaseVisualEffect_Init(&self->visualEffect);
    RuntimePresentationManager_Init(&self->presentationManager);
    self->renderFlags = (self->renderFlags & ~1) | 3;
    GamePhaseRegionTable_Init(&self->regionTable);
    self->field_2f90 = 1;
    self->field_2f92 = (s16)((self->field_2f92 & ~0xff) | 8);
    self->field_2f92 = (s16)((self->field_2f92 & ~0xff00) | 0x800);
    return self;
}

/* Fully release the state's active content and embedded subsystems. */
GamePhaseState *GamePhaseState_Destroy(GamePhaseState *self)
{
    GamePhaseState_UnloadPhase(self);
    GamePhaseRegionTable_Destroy(&self->regionTable);
    RuntimePresentationManager_Destroy(&self->presentationManager);
    GamePhaseVisualEffect_Destroy(&self->visualEffect);
    OverlaySlot_Destroy(&self->overlaySlot);
    ActorCollection_Destructor(&self->actorCollection);
    return self;
}

/*
 * Tear down currently loaded phase content while retaining the outer state:
 * destroy the embedded visual effect, reset graphics/runtime helpers,
 * release phaseObject through its deleting destructor, and clear the pointer.
 */
void GamePhaseState_UnloadPhase(GamePhaseState *self)
{
    PhaseOwned *visualEffect = (PhaseOwned *)&self->visualEffect;
    visualEffect->vtable->destroy(visualEffect);
    GamePhaseRegionTable_Destroy(&self->regionTable);
    GamePhaseState_ResetRuntime(self);
    ActorCollection_Deinit(&self->actorCollection);
    if (self->phaseObject != 0)
        ((PhaseOwned *)self->phaseObject)->vtable->destroyAndFree(
            self->phaseObject);
    self->phaseObject = 0;
}

/* Reset render/world helpers and the large subsystem rooted at offset 0x0004. */
void GamePhaseState_ResetRuntime(GamePhaseState *self)
{
    RuntimePresentationManager_DestroyAllEffects(&self->presentationManager);
    Graphics3dPresentation_Clear(
        RuntimePresentationManager_GetGraphics3dPresentation(
            &self->presentationManager));
    ActorFeedback_DestroyPresentations();
    ActorCollection_UnregisterAndDestroyAllActors(&self->actorCollection);
}
