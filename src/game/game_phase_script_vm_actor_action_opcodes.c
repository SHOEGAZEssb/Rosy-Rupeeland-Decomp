#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that dispatch address-derived actor actions. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void ByteTileMapOwner_SetCell(void *tileMapOwner, s32 x, s32 y, s8 value);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 gridX, s32 gridY);
extern void Actor_SavePrimaryAttachmentState(void *actor);
extern void Actor_RestorePrimaryAttachmentState(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop a cell value and coordinates, then update the global runtime tile map at
 * offset 0x2ed4. Returns zero.
 */
s32 GamePhaseActorScriptVm_SetTileMapCell(GamePhaseActorScriptVm *self)
{
    s8 value = (s8)GamePhaseScriptVm_Pop(&self->base);
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *tileMapOwner = *(void **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    ByteTileMapOwner_SetCell(tileMapOwner, x, y, value);
    return 0;
}

/* Pop X/Y, store Actor_QueryTerrainHeight for the bound actor as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_QueryTerrainHeight(GamePhaseActorScriptVm *self)
{
    s32 gridY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 gridX = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, Actor_QueryTerrainHeight(self->actor, gridX, gridY));
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
