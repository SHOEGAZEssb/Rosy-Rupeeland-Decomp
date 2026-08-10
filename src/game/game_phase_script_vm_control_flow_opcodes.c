#include "tingle/game_phase_script_vm.h"

/* Implement compact script-VM condition and control-flow primitives. */

/* Set stateFlags bit one exactly when registers[index] is zero. */
void GamePhaseScriptVm_UpdateZeroFlag(GamePhaseScriptVm *self, s32 index)
{
    if (self->registers[index] != 0)
        self->stateFlags &= (u8)~2;
    else
        self->stateFlags |= 2;
}

/* Set stateFlags bit zero and return one to the interpreter. */
s32 GamePhaseScriptVm_Halt(GamePhaseScriptVm *self)
{
    self->stateFlags |= 1;
    return 1;
}

/* Replace the cursor with the little-endian address stored at it and return one. */
s32 GamePhaseScriptVm_JumpAndYield(GamePhaseScriptVm *self)
{
    self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    return 1;
}

/* Replace the cursor with the little-endian address stored at it and return zero. */
s32 GamePhaseScriptVm_Jump(GamePhaseScriptVm *self)
{
    self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    return 0;
}
