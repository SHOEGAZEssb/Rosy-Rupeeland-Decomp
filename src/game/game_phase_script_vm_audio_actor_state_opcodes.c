#include "tingle/game_phase_script_vm.h"
#include "tingle/packed_timer_array.h"

/*
 * Implement adjacent script operations for a recovered global audio-like
 * subsystem and bound-actor presentation/state transitions.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedType1_ResetToBaseState(void *actor);
extern void Actor_CreateSecondaryRenderAttachment(
    void *actor, void *unusedAnimationResources, s32 attachPolicy);
extern void GraphicsSpriteGroup_ReleaseState(void *owner, void *state);
#ifdef __cplusplus
}
#endif

/*
 * Pop four u16 parameters and one signed-16-bit timer identifier, configure
 * the selected packed timer, start its initial delay, and return zero.
 */
s32 GamePhaseActorScriptVm_ConfigureAndStartPackedTimer(GamePhaseActorScriptVm *self)
{
    u16 repeatCount = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    u16 repeatLimit = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 repeatSeconds = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    u16 initialSeconds = (u16)(s16)GamePhaseScriptVm_Pop(&self->base);
    s16 timerId = (s16)GamePhaseScriptVm_Pop(&self->base);
    PackedTimerArray_ConfigureEntry(PackedTimerArray_GetGlobal(), timerId,
                                    initialSeconds, repeatSeconds, repeatLimit,
                                    repeatCount);
    PackedTimer_Start(
        PackedTimerArray_Get(PackedTimerArray_GetGlobal(), timerId));
    return 0;
}

/* Pop a timer id, mark that packed timer complete, and return zero. */
s32 GamePhaseActorScriptVm_MarkPackedTimerComplete(GamePhaseActorScriptVm *self)
{
    s32 timerId = (s32)GamePhaseScriptVm_Pop(&self->base);
    PackedTimer_MarkComplete(
        PackedTimerArray_Get(PackedTimerArray_GetGlobal(), timerId));
    return 0;
}

/* Pop a timer id, store its repeat count as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_GetPackedTimerRepeatCount(GamePhaseActorScriptVm *self)
{
    s32 timerId = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base,
        PackedTimerArray_Get(PackedTimerArray_GetGlobal(), timerId)->repeatCount);
    return 0;
}

/*
 * Pop a timer id and store whether its packed state is the initial or repeating
 * countdown state (one or two) as the VM result. Return zero.
 */
s32 GamePhaseActorScriptVm_IsPackedTimerActive(GamePhaseActorScriptVm *self)
{
    s32 timerId = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 state = PackedTimerArray_Get(PackedTimerArray_GetGlobal(), timerId)->state;
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, state == 1 || state == 2);
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

/*
 * Set actor flag mask 0x1 and request secondary attachment +0x58 with attach
 * policy two. The ABI's +0x1ec animation-resource argument is ignored. Return
 * zero.
 */
s32 GamePhaseActorScriptVm_CreateSecondaryRenderAttachmentAndSetFlag1(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    *(u32 *)(actor + 0x14) |= 1;
    Actor_CreateSecondaryRenderAttachment(actor, actor + 0x1ec, 2);
    return 0;
}

/*
 * Destroy the actor's secondary presentation object at offset 0x58, clear its
 * pointer and actor flag bit 0, and return zero.
 */
s32 GamePhaseActorScriptVm_ReleaseSecondaryRenderAttachmentAndClearFlag1(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    void *secondaryAttachment = *(void **)(actor + 0x58);
    GraphicsSpriteGroup_ReleaseState(*(void **)secondaryAttachment,
                                     secondaryAttachment);
    *(void **)(actor + 0x58) = 0;
    *(u32 *)(actor + 0x14) &= ~1;
    return 0;
}
