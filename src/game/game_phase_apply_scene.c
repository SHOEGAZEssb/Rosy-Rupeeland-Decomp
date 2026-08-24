#include "tingle/game_phase_apply_scene.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/* Apply a queued area/configuration change through a short-lived Scene. */

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseRuntime *gGamePhaseRuntime;
extern void GamePhaseAreaScene_SetEnabled(void *object, s32 enabled);
extern void ActorDescriptorBatch_ApplyCategoryCallback(s32 value);
#ifdef __cplusplus
}
#endif

/* Initialize the Scene, retain its area and two request values, and return self. */
GamePhaseApplyScene *GamePhaseApplyScene_Init(
    GamePhaseApplyScene *self, void *pendingArea, u32 requestValue0,
    u32 requestValue1, u32 unusedRequestValue3)
{
    Scene_Init(&self->base);
    self->base.vtable = &gGamePhaseApplySceneVTable;
    self->pendingArea = pendingArea;
    self->requestValue0 = requestValue0;
    self->requestValue1 = requestValue1;
    (void)unusedRequestValue3;
    return self;
}

/* Destroy the Scene base and return self without freeing its storage. */
GamePhaseApplyScene *GamePhaseApplyScene_Destroy(GamePhaseApplyScene *self)
{
    Scene_Destroy(&self->base);
    return self;
}

/* Destroy the Scene, free its storage through the game heap, and return it. */
GamePhaseApplyScene *GamePhaseApplyScene_DestroyAndFree(GamePhaseApplyScene *self)
{
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Advance the three-state application sequence. The first update initializes
 * runtime transition state; the second applies area to two runtime subsystems,
 * enables the object at runtime offset 0x2fb8, destroys this Scene, clears the
 * pending bit at offset 0x30cc, and notifies the phase controller. Returns one
 * only when that final state completes.
 */
s32 GamePhaseApplyScene_Update(GamePhaseApplyScene *self)
{
    GamePhaseRuntime *runtime = gGamePhaseRuntime;

    switch (self->base.value08) {
    case 0:
        self->base.value08++;
        /* fall through */
    case 1:
        GamePhaseRuntime_DestroySecondaryActorSubsystem(runtime);
        self->base.value08++;
        break;
    case 2:
        GamePhaseRuntime_CreateSecondaryActorSubsystem(runtime, self->pendingArea, 1);
        GamePhaseRuntime_RefreshAreaAuxiliaryObject(runtime, self->pendingArea, 1);
        GamePhaseAreaScene_SetEnabled(*(void **)((u8 *)runtime + 0x2fb8), 1);
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        *((u8 *)runtime + 0x30cc) &= (u8)~8;
        ActorDescriptorBatch_ApplyCategoryCallback(1);
        return 1;
    default:
        break;
    }
    return 0;
}
