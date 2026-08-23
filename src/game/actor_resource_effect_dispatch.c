#include "tingle/types.h"
#include "tingle/game_phase_script_vm.h"

/* Assign a primary actor script to the runtime collection's script VM. */
extern void *gGameWork;
extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *);
extern void ActorRuntimeCollection_CopyPrimaryContainerState(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Store the borrowed script at actor slot +0x180. Build a temporary actor
 * script VM using GameWork context +0x3cc when the actor collection's mode
 * +0x2e84 equals one, otherwise context +0x5cc. Assign that VM into
 * gActorRuntimeCollection's primary container, then destroy the temporary.
 * Returns no value; the collection receives copied VM state and the actor does
 * not take ownership of the script bytes.
 */
void Actor_AssignPrimaryScriptToCollection(void *self, const s8 *script)
{
    u8 *actor = (u8 *)self;
    u8 scriptVmStorage[0x94];
    void *collection;
    void *gameData;

    *(const s8 **)(actor + 0x180) = script;
    collection = Actor_GetCollection(actor);
    gameData = (u8 *)gGameWork +
               (*(s32 *)((u8 *)collection + 0x2e84) == 1 ? 0x3cc : 0x5cc);
    GamePhaseActorScriptVm_InitWithScript(
        (GamePhaseActorScriptVm *)scriptVmStorage, actor, script, gameData);
    ActorRuntimeCollection_CopyPrimaryContainerState(gActorRuntimeCollection,
                                                       scriptVmStorage);
    GamePhaseActorScriptVm_Destroy((GamePhaseActorScriptVm *)scriptVmStorage);
}
