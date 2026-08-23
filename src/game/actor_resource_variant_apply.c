#include "tingle/types.h"
#include "tingle/game_phase_script_vm.h"

/* Select one of five actor scripts and rebuild the embedded script VM. */
extern void *gGameWork;
extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SavePrimaryAttachmentState(void *);
extern void ActorRuntimeCollection_AttachObject(void *, void *);
extern void *Actor_GetCollection(void *);
#ifdef __cplusplus
}
#endif

/*
 * Store variant in byte 0xe8. If actor flag 0x40 is set, first snapshot the
 * attachment through Actor_SavePrimaryAttachmentState. A nonzero variant sets
 * actor flag 0x100 and notifies gActorRuntimeCollection. Construct a temporary
 * actor script VM from borrowed script slot +0x180+variant*4 and GameWork
 * context +0x3cc when collection mode +0x2e84 is one, otherwise context
 * +0x5cc. Assign it to the embedded actor VM at +0xec, destroy the temporary,
 * then activate the embedded VM. Returns no value; VM helpers may update
 * actor, collection, and script execution state.
 */
void Actor_SelectScriptVariant(void *self, s32 variant)
{
    u8 *actor = (u8 *)self;
    u8 scriptVmStorage[0x94];
    void *collection;
    void *gameData;

    actor[0xe8] = (u8)variant;
    if (*(u32 *)(actor + 0x10) & 0x40)
        Actor_SavePrimaryAttachmentState(actor);
    if (variant) {
        *(u32 *)(actor + 0x10) |= 0x100;
        ActorRuntimeCollection_AttachObject(gActorRuntimeCollection, actor);
    }
    collection = Actor_GetCollection(actor);
    gameData = (u8 *)gGameWork +
               (*(s32 *)((u8 *)collection + 0x2e84) == 1 ? 0x3cc : 0x5cc);
    GamePhaseActorScriptVm_InitWithScript(
        (GamePhaseActorScriptVm *)scriptVmStorage, actor,
        *(const s8 **)(actor + 0x180 + variant * 4), gameData);
    GamePhaseActorScriptVm_Assign(
        (GamePhaseActorScriptVm *)(actor + 0xec),
        (const GamePhaseActorScriptVm *)scriptVmStorage);
    GamePhaseActorScriptVm_Destroy((GamePhaseActorScriptVm *)scriptVmStorage);
    GamePhaseActorScriptVm_Activate(
        (GamePhaseActorScriptVm *)(actor + 0xec));
}
