#include "tingle/game_phase_script_vm.h"

/* Shared value and return-address stack operations for phase bytecode. */

/*
 * Decrements stack depth and returns the former top value. Retail performs no
 * bounds check and changes only the VM stack depth.
 */
u32 GamePhaseScriptVm_Pop(GamePhaseScriptVm *self)
{
    self->stackDepth--;
    return self->stack[self->stackDepth];
}

/*
 * Stores `value` at the current top and increments depth. Retail performs no
 * overflow check; the VM stack and depth change and no value is returned.
 */
void GamePhaseScriptVm_Push(GamePhaseScriptVm *self, u32 value)
{
    self->stack[self->stackDepth] = value;
    self->stackDepth++;
}
