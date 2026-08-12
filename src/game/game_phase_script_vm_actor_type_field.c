#include "tingle/game_phase_script_vm.h"

/* Implement the phase-225 actor-script write to the address-derived type byte. */

/*
 * Pop a value, store its low byte at actor offset 0xe6, and return zero. The
 * movement opcodes subsequently inspect this byte to select attachment-facing
 * behavior; its broader semantic meaning is not yet confirmed.
 */
s32 GamePhaseActorScriptVm_SetFieldE6(GamePhaseActorScriptVm *self)
{
    *((u8 *)self->actor + 0xe6) = (u8)GamePhaseScriptVm_Pop(&self->base);
    return 0;
}
