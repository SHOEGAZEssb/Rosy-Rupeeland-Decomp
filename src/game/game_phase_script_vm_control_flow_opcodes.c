#include "tingle/game_phase_script_vm.h"

/* Implement compact script-VM condition and control-flow primitives. */

/* Set flags_7d bit one exactly when values_2c[index] is zero. */
void func_0201b2b4(GamePhaseScriptVm *self, s32 index)
{
    if (self->values_2c[index] != 0)
        self->flags_7d &= (u8)~2;
    else
        self->flags_7d |= 2;
}

/* Set flags_7d bit zero and return one to the interpreter. */
s32 func_0201b2d4(GamePhaseScriptVm *self)
{
    self->flags_7d |= 1;
    return 1;
}

/* Replace the cursor with the little-endian address stored at it and return one. */
s32 func_0201b2e8(GamePhaseScriptVm *self)
{
    self->cursor_04 = (const s8 *)func_0201b278(self->cursor_04);
    return 1;
}

/* Replace the cursor with the little-endian address stored at it and return zero. */
s32 func_0201b304(GamePhaseScriptVm *self)
{
    self->cursor_04 = (const s8 *)func_0201b278(self->cursor_04);
    return 0;
}
