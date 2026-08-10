#include "tingle/game_phase_script_vm.h"

/*
 * Implement adjacent script operations for a recovered global audio-like
 * subsystem and bound-actor presentation/state transitions.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *PackedTimerArray_GetGlobal(void);
extern void PackedTimerArray_ConfigureEntry(void *array, s16 id, u16 first,
                                            u16 second, u16 third, u16 fourth);
extern u8 *PackedTimerArray_Get(void *array, s32 id);
extern void PackedTimer_Start(void *state);
extern void PackedTimer_MarkComplete(void *state);
extern void ActorDerivedType1_ResetToBaseState(void *actor);
extern void func_020313b4(void *actor, void *state, s32 mode);
extern void GraphicsSpriteGroup_ReleaseState(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Pop four u16 parameters and one signed-16-bit timer identifier, configure
 * the selected packed timer, start its initial delay, and return zero.
 */
s32 GamePhaseActorScriptVm_ConfigureAndStartPackedTimer(GamePhaseActorScriptVm *self)
{
    u16 fourth = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    u16 third = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 second = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    u16 first = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    s16 id = (s16)GamePhaseScriptVm_Pop(&self->base);
    PackedTimerArray_ConfigureEntry(PackedTimerArray_GetGlobal(), id, first,
                                    second, third, fourth);
    PackedTimer_Start(
        PackedTimerArray_Get(PackedTimerArray_GetGlobal(), id));
    return 0;
}

/* Pop a timer id, mark that packed timer complete, and return zero. */
s32 GamePhaseActorScriptVm_MarkPackedTimerComplete(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    PackedTimer_MarkComplete(
        PackedTimerArray_Get(PackedTimerArray_GetGlobal(), id));
    return 0;
}

/* Pop a timer id, push its repeat count, and return zero. */
s32 GamePhaseActorScriptVm_GetPackedTimerRepeatCount(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(
        &self->base,
        *(u16 *)(PackedTimerArray_Get(PackedTimerArray_GetGlobal(), id) + 6));
    return 0;
}

/*
 * Pop a timer id and push whether its packed state is the initial or repeating
 * countdown state (one or two). Return zero.
 */
s32 GamePhaseActorScriptVm_IsPackedTimerActive(GamePhaseActorScriptVm *self)
{
    s32 id = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 state = *(u32 *)(
        PackedTimerArray_Get(PackedTimerArray_GetGlobal(), id) + 8) >> 29;
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
    GraphicsSpriteGroup_ReleaseState(*(void **)(actor + 0x58));
    *(void **)(actor + 0x58) = 0;
    *(u32 *)(actor + 0x14) &= ~1;
    return 0;
}
