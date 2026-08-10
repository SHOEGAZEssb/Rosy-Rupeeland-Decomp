#include "tingle/game_phase_script_vm.h"

/*
 * Implement adjacent script operations for a recovered global audio-like
 * subsystem and bound-actor presentation/state transitions.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020021c4(void);
extern void func_020020f8(void *manager, s16 id, u16 first, u16 second,
                          u16 third, u16 fourth);
extern u8 *func_020020ec(void *manager, s32 id);
extern void func_02001f14(void *state);
extern void func_02001f40(void *state);
extern void ActorDerivedType1_ResetToBaseState(void *actor);
extern void func_020313b4(void *actor, void *state, s32 mode);
extern void func_02074038(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Pop four u16 parameters and one signed-16-bit identifier, configure the
 * recovered manager entry, resolve it again, trigger its first operation, and
 * return zero.
 */
s32 GamePhaseActorScriptVm_ConfigureAndStartManagerEntry(GamePhaseActorScriptVm *self)
{
    u16 fourth = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    u16 third = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 second = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    u16 first = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    s16 id = (s16)GamePhaseScriptVm_Pop(&self->base);
    func_020020f8(func_020021c4(), id, first, second, third, fourth);
    func_02001f14(func_020020ec(func_020021c4(), id));
    return 0;
}

/* Pop an entry id, trigger its second recovered operation, and return zero. */
s32 GamePhaseActorScriptVm_TriggerManagerEntrySecondOperation(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    func_02001f40(func_020020ec(func_020021c4(), id));
    return 0;
}

/* Pop an entry id, push its u16 field at offset 0x06, and return zero. */
s32 GamePhaseActorScriptVm_GetManagerEntryField06(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base,
                  *(u16 *)(func_020020ec(func_020021c4(), id) + 6));
    return 0;
}

/*
 * Pop an entry id and push whether bits 29..31 of its word at offset 0x08
 * encode recovered state 1 or 2.  Return zero.
 */
s32 GamePhaseActorScriptVm_IsManagerEntryState1Or2(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 state = *(u32 *)(func_020020ec(func_020021c4(), id) + 8) >> 29;
    GamePhaseScriptVm_SetResult(&self->base, state == 1 || state == 2);
    return 0;
}

/*
 * If signed actor field 0xe4 is zero, invoke the recovered actor reset and
 * clear halfword 0x36 of its primary presentation object.  Return zero.
 */
s32 GamePhaseActorScriptVm_ResetType1ActorWhenFieldE4Zero(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    if (*(s16 *)(actor + 0xe4) == 0) {
        ActorDerivedType1_ResetToBaseState(actor);
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x36) = 0;
    }
    return 0;
}

/* Set actor flag bit 0 and apply mode 2 to state at offset 0x1ec; return zero. */
s32 GamePhaseActorScriptVm_SetActorFlag1AndApplyStateMode2(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    *(u32 *)(actor + 0x14) |= 1;
    func_020313b4(actor, actor + 0x1ec, 2);
    return 0;
}

/*
 * Destroy the actor's secondary presentation object at offset 0x58, clear its
 * pointer and actor flag bit 0, and return zero.
 */
s32 GamePhaseActorScriptVm_DestroySecondaryPresentationAndClearFlag1(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    func_02074038(*(void **)(actor + 0x58));
    *(void **)(actor + 0x58) = 0;
    *(u32 *)(actor + 0x14) &= ~1;
    return 0;
}
