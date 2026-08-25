#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that arm and clear an effect-state request. */

/*
 * Pop an effect-state value, mark it pending, and return zero. The consumer
 * and precise meaning of this queued value are unconfirmed.
 */
s32 GamePhaseActorScriptVm_QueueEffectStateValue(GamePhaseActorScriptVm *self)
{
    self->effectStateValue = (u8)GamePhaseScriptVm_Pop(&self->base);
    self->actorStateFlags |= GAME_PHASE_ACTOR_SCRIPT_VM_EFFECT_STATE_PENDING;
    return 0;
}

/* Clear the pending effect-state flag and return zero. */
s32 GamePhaseActorScriptVm_ClearPendingEffectState(GamePhaseActorScriptVm *self)
{
    self->actorStateFlags &= ~GAME_PHASE_ACTOR_SCRIPT_VM_EFFECT_STATE_PENDING;
    return 0;
}
