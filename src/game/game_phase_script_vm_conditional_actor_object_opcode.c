#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Implement a conditional script opcode that creates and registers an actor-associated object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern const char data_020d5b34[];
extern void *ActorCollection_FindActorByRuntimeId(void *collection, s32 index);
extern void *ActorMotionAreaFollower_GetPosition(void *motion);
extern void *RisingSpriteSwarmPresentation_Init(void *object,
                                                 void *referencePosition,
                                                 void *actorConfig,
                                                 s32 trackZ);
extern void RuntimePresentationManager_AppendFirstListEffect(void *list, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Pop actor index, track Z, and enable. When enabled, resolve the actor from
 * runtime collection 1, allocate a 0x4c-byte swarm presentation, initialize it
 * using the motion reference at runtime offset 0x2fbc, and append even a null
 * allocation result to the list at offset 0x2f7c. When disabled, set GameWork
 * flag 0x408, which the active swarm observes as its retraction request. Return
 * zero.
 */
s32 GamePhaseActorScriptVm_SetRisingSpriteSwarmEnabled(GamePhaseActorScriptVm *self)
{
    s32 actorRuntimeId = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 trackZ = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    if (enabled) {
        void *actor = ActorCollection_FindActorByRuntimeId(
            GamePhaseRuntime_GetActorCollection((GamePhaseRuntime *)runtime, 1), actorRuntimeId);
        void *presentation = Heap_Alloc(0x4c, data_020d5b34, 4, &gHeapContext);
        if (presentation)
            presentation = RisingSpriteSwarmPresentation_Init(
                presentation,
                ActorMotionAreaFollower_GetPosition(runtime + 0x2fbc), actor,
                trackZ);
        RuntimePresentationManager_AppendFirstListEffect(runtime + 0x2f7c, presentation);
    } else {
        GameWork_SetFlag(gGameWork, 0x408);
    }
    return 0;
}
