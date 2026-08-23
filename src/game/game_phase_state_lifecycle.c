#include "tingle/game_phase_state.h"

/* Initialize and tear down the large state embedded in GamePhaseRuntime. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OverlaySlot_Init(void *object);
extern void OverlaySlot_Destroy(void *object);
extern void GamePhaseState_UnloadPhase(GamePhaseState *self);
extern void GamePhaseState_ResetRuntime(GamePhaseState *self);
extern void GamePhaseVisualEffect_Init(void *object);
extern void GamePhaseVisualEffect_Destroy(void *object);
extern void GamePhaseRegionTable_Init(void *object);
extern void GamePhaseRegionTable_Destroy(void *object);
extern void *RuntimePresentationManager_Init(void *object);
extern void *RuntimePresentationManager_Destroy(void *object);
extern void RuntimePresentationManager_DestroyAllEffects(void *object);
extern void RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void ActorCollection_Init(void *object);
extern void ActorCollection_Destructor(void *object);
extern void ActorCollection_Deinit(void *object);
extern void ActorCollection_UnregisterAndDestroyAllActors(void *object);
extern void ActorFeedback_DestroyPresentations(void);
extern void func_020a2324(void);
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
    ActorCollection_Init(self->actorCollectionStorage);
    OverlaySlot_Init(self->overlaySlotStorage);
    self->phaseObject = 0;
    GamePhaseVisualEffect_Init(self->helper_2eb4);
    RuntimePresentationManager_Init(self->renderHelperStorage);
    self->renderFlags = (self->renderFlags & ~1) | 3;
    GamePhaseRegionTable_Init(self->helper_2f80);
    self->field_2f90 = 1;
    self->field_2f92 = (s16)((self->field_2f92 & ~0xff) | 8);
    self->field_2f92 = (s16)((self->field_2f92 & ~0xff00) | 0x800);
    return self;
}

/* Fully release the state's active content and embedded subsystems. */
GamePhaseState *GamePhaseState_Destroy(GamePhaseState *self)
{
    GamePhaseState_UnloadPhase(self);
    GamePhaseRegionTable_Destroy(self->helper_2f80);
    RuntimePresentationManager_Destroy(self->renderHelperStorage);
    GamePhaseVisualEffect_Destroy(self->helper_2eb4);
    OverlaySlot_Destroy(self->overlaySlotStorage);
    ActorCollection_Destructor(self->actorCollectionStorage);
    return self;
}

/*
 * Tear down currently loaded phase content while retaining the outer state:
 * invoke helper_2eb4's first virtual method, reset graphics/runtime helpers,
 * release phaseObject through its deleting destructor, and clear the pointer.
 */
void GamePhaseState_UnloadPhase(GamePhaseState *self)
{
    PhaseOwned *helper = (PhaseOwned *)self->helper_2eb4;
    helper->vtable->destroy(helper);
    GamePhaseRegionTable_Destroy(self->helper_2f80);
    GamePhaseState_ResetRuntime(self);
    ActorCollection_Deinit(self->actorCollectionStorage);
    if (self->phaseObject != 0)
        ((PhaseOwned *)self->phaseObject)->vtable->destroyAndFree(
            self->phaseObject);
    self->phaseObject = 0;
}

/* Reset render/world helpers and the large subsystem rooted at offset 0x0004. */
void GamePhaseState_ResetRuntime(GamePhaseState *self)
{
    RuntimePresentationManager_DestroyAllEffects(self->renderHelperStorage);
    RuntimePresentationManager_GetGraphics3dPresentation(self->renderHelperStorage);
    func_020a2324();
    ActorFeedback_DestroyPresentations();
    ActorCollection_UnregisterAndDestroyAllActors(self->actorCollectionStorage);
}
