#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that dispatch address-derived actor actions. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_0202bb60(void *object, u32 first, u32 second, u32 third);
extern u32 Actor_QueryTerrainHeight(void *actor, u32 first, u32 second);
extern void Actor_SavePrimaryAttachmentState(void *actor);
extern void Actor_RestorePrimaryAttachmentState(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop third, second, and first operands, dispatch them to func_0202bb60 on the
 * global runtime object at offset 0x2ed4, and return zero.
 */
s32 func_02013e14(GamePhaseActorScriptVm *self)
{
    u32 third = GamePhaseScriptVm_Pop(&self->base);
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)data_021052fc + 0x2ed4);
    func_0202bb60(object, first, second, third);
    return 0;
}

/* Pop X/Y, push Actor_QueryTerrainHeight for the bound actor, and return zero. */
s32 func_02013e64(GamePhaseActorScriptVm *self)
{
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, Actor_QueryTerrainHeight(self->actor_84, first, second));
    return 0;
}

/* Pop and discard one script operand, then return zero. */
s32 func_02013ea0(GamePhaseActorScriptVm *self)
{
    (void)GamePhaseScriptVm_Pop(&self->base);
    return 0;
}

/* Save the bound actor's primary attachment state and return zero. */
s32 func_02013eb0(GamePhaseActorScriptVm *self)
{
    Actor_SavePrimaryAttachmentState(self->actor_84);
    return 0;
}

/* Restore the bound actor's primary attachment state and return zero. */
s32 func_02013ec4(GamePhaseActorScriptVm *self)
{
    Actor_RestorePrimaryAttachmentState(self->actor_84);
    return 0;
}
