#include "tingle/game_phase_script_vm.h"

/* Dispatch actor-script opcodes and control whether an actor VM is active. */

typedef s32 (*ActorScriptOpcode)(GamePhaseActorScriptVm *self);

#ifdef __cplusplus
extern "C" {
#endif
extern ActorScriptOpcode gGamePhaseActorScriptVmOpcodeTable[];
#ifdef __cplusplus
}
#endif

/*
 * Invoke the actor-opcode table entry at index and return its result. Retail
 * performs no bounds check before the indirect call.
 */
s32 GamePhaseActorScriptVm_DispatchOpcode(GamePhaseActorScriptVm *self, s32 index)
{
    return gGamePhaseActorScriptVmOpcodeTable[index](self);
}

/* Mark the actor VM active by setting derived flag bit zero. */
void GamePhaseActorScriptVm_Activate(GamePhaseActorScriptVm *self)
{
    self->actorStateFlags |= GAME_PHASE_ACTOR_SCRIPT_VM_ACTIVE;
}

/* Return active flag bit zero in retail's Boolean representation, zero or -1. */
s32 GamePhaseActorScriptVm_IsActive(const GamePhaseActorScriptVm *self)
{
    return (s32)(self->actorStateFlags << 31) >> 31;
}
