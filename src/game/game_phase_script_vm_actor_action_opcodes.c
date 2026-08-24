#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that dispatch address-derived actor actions. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void ByteTileMapOwner_SetCell(void *object, u32 first, u32 second, u32 third);
extern u32 Actor_QueryTerrainHeight(void *actor, u32 first, u32 second);
extern void Actor_SavePrimaryAttachmentState(void *actor);
extern void Actor_RestorePrimaryAttachmentState(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop third, second, and first operands, dispatch them to ByteTileMapOwner_SetCell on the
 * global runtime object at offset 0x2ed4, and return zero.
 */
s32 GamePhaseActorScriptVm_SetTileMapCell(GamePhaseActorScriptVm *self)
{
    u32 third = GamePhaseScriptVm_Pop(&self->base);
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    ByteTileMapOwner_SetCell(object, first, second, third);
    return 0;
}

/* Pop X/Y, store Actor_QueryTerrainHeight for the bound actor as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_QueryTerrainHeight(GamePhaseActorScriptVm *self)
{
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, Actor_QueryTerrainHeight(self->actor, first, second));
    return 0;
}

/* Pop and discard one script operand, then return zero. */
s32 GamePhaseActorScriptVm_DiscardValue(GamePhaseActorScriptVm *self)
{
    (void)GamePhaseScriptVm_Pop(&self->base);
    return 0;
}

/* Save the bound actor's primary attachment state and return zero. */
s32 GamePhaseActorScriptVm_SavePrimaryAttachmentState(GamePhaseActorScriptVm *self)
{
    Actor_SavePrimaryAttachmentState(self->actor);
    return 0;
}

/* Restore the bound actor's primary attachment state and return zero. */
s32 GamePhaseActorScriptVm_RestorePrimaryAttachmentState(GamePhaseActorScriptVm *self)
{
    Actor_RestorePrimaryAttachmentState(self->actor);
    return 0;
}
