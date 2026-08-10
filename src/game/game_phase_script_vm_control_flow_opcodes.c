#include "tingle/game_phase_script_vm.h"

/* Implement compact script-VM condition and control-flow primitives. */

/* Set stateFlags bit one exactly when registers[index] is zero. */
void func_0201b2b4(GamePhaseScriptVm *self, s32 index)
{
    if (self->registers[index] != 0)
        self->stateFlags &= (u8)~2;
    else
        self->stateFlags |= 2;
}

/* Set stateFlags bit zero and return one to the interpreter. */
s32 func_0201b2d4(GamePhaseScriptVm *self)
{
    self->stateFlags |= 1;
    return 1;
}

/* Replace the cursor with the little-endian address stored at it and return one. */
s32 func_0201b2e8(GamePhaseScriptVm *self)
{
    self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    return 1;
}

/* Replace the cursor with the little-endian address stored at it and return zero. */
s32 func_0201b304(GamePhaseScriptVm *self)
{
    self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    return 0;
}
