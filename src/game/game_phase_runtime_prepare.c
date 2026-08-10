#include "tingle/game_phase_runtime.h"

/* Pre-transition synchronization for the runtime's primary and optional actors. */

extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorInteractionRuntime_Update(GamePhaseRuntime *self);
extern void ActorCollection_RebuildCategories(void *actor);
extern void ActorCollection_UpdateFlag100Category0Actors(void *actor);
extern void ActorCollection_ProcessCategory1And2Pairs(void *actor);
extern void ActorCollection_UpdateCategory3TerrainActors(void *actor);
extern void ActorCollection_UpdateCategory0Actors(void *actor);
extern void ActorCollection_RebuildBaseCategories(void *actor);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *state);
extern s32 ActorRuntimeCollection_DispatchQueuedValue(void *state);
extern s32 ActorRuntimeCollection_GetBusyState(void *state);
extern void ActorRuntimeCollection_ReleaseSelectedObject(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Prepare actors for a phase operation. Modes 1/3 update the primary actor at
 * offset 0x28; modes 2/3 also update the optional actor at 0x2fb8. The value
 * selects one of two actor setup variants. When global transition state is
 * idle, value is not 2, and the gameplay context passes func_02007868, this
 * also starts the global transition. Returns no value.
 */
void GamePhaseRuntime_PrepareActorCollections(GamePhaseRuntime *self, s32 value, s32 mode)
{
    u8 *b = (u8 *)self;
    void *actor;

    ActorInteractionRuntime_Update(self);
    if (mode == 1 || mode == 3) {
        actor = b + 0x28;
        if (value == 2) {
            ActorCollection_RebuildCategories(actor);
            ActorCollection_UpdateFlag100Category0Actors(actor);
            ActorCollection_ProcessCategory1And2Pairs(actor);
            ActorCollection_UpdateCategory3TerrainActors(actor);
        } else {
            ActorCollection_RebuildCategories(actor);
            ActorCollection_UpdateCategory0Actors(actor);
            ActorCollection_ProcessCategory1And2Pairs(actor);
            ActorCollection_UpdateCategory3TerrainActors(actor);
        }
    }

    if ((u32)(mode - 2) <= 1) {
        actor = *(void **)(b + 0x2fb8);
        if (actor != 0) {
            actor = (u8 *)actor + 8;
            if (value == 2 || value == 6) {
                ActorCollection_RebuildBaseCategories(actor);
                ActorCollection_UpdateFlag100Category0Actors(
                    (u8 *)*(void **)(b + 0x2fb8) + 8);
            } else {
                ActorCollection_RebuildBaseCategories(actor);
                ActorCollection_UpdateCategory0Actors((u8 *)*(void **)(b + 0x2fb8) + 8);
            }
        }
    }

    if (!ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) && value != 2 &&
        func_02007868(*(void **)(b + 0x2ea4)) &&
        !ActorRuntimeCollection_DispatchQueuedValue(gActorRuntimeCollection) &&
        ActorRuntimeCollection_GetBusyState(gActorRuntimeCollection))
        ActorRuntimeCollection_ReleaseSelectedObject(gActorRuntimeCollection);
}
