#include "tingle/actor_runtime_scene.h"

/* Update the collection-created gameplay scene and its shared world contexts. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *gLupyContext;
extern void GamePhaseRuntime_PrepareActorCollections(void *context, u32 value, s32 mode);
extern void GamePhaseRuntime_FinalizeActorCollections(void *context, u32 value, s32 mode);
extern s32 GamePhaseRuntime_SynchronizeActorPlacement(void *context, s32 index);
extern s32 GamePhaseRuntime_DispatchActorQueryRequest(void *runtime);
extern void func_0200866c(void *context);
extern void GamePhaseRuntime_UpdateDualScreenUiPresentation(void *context);
extern void GamePhaseRuntime_ProcessPendingPresentationRefreshes(void *runtime);
extern void func_02010e68(void *context);
extern void func_0201dcec(void *context, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Tick the shared game context, then branch on Scene value08. State 0 performs
 * a one-time sequence using Scene value04 and mode 3; state 1 invokes the
 * scene's deleting destructor and returns 1. Other states, and state 0 after
 * setup, update shared context offset 0x2f7c plus the root and Lupy contexts,
 * then return 0. Indirect helpers may affect gameplay/rendering; no hardware
 * registers are written directly.
 */
s32 func_0200b6c4(ActorRuntimeScene *self)
{
    u8 *root = (u8 *)data_021052fc;

    GamePhaseRuntime_ProcessPendingPresentationRefreshes(root);
    if (self->base.value08 == 0) {
        GamePhaseRuntime_DispatchActorQueryRequest(root);
        GamePhaseRuntime_PrepareActorCollections(root, self->base.value04, 3);
        func_0200866c(root);
        GamePhaseRuntime_SynchronizeActorPlacement(root, 0);
        GamePhaseRuntime_SynchronizeActorPlacement(root, 1);
        GamePhaseRuntime_FinalizeActorCollections(root, self->base.value04, 3);
    } else if (self->base.value08 == 1) {
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    }

    func_0201dcec(root + 0x2f7c, 1);
    GamePhaseRuntime_UpdateDualScreenUiPresentation(root);
    func_02010e68(gLupyContext);
    return 0;
}
