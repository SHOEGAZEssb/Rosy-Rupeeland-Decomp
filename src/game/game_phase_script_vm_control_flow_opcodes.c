#include "tingle/game_phase_script_vm.h"

/* Implement compact script-VM condition and control-flow primitives. */

/* Set the condition bit exactly when the selected register value is zero. */
void GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(GamePhaseScriptVm *self, s32 registerIndex)
{
    if (self->registers[registerIndex] != 0)
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
