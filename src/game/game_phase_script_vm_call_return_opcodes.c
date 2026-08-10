#include "tingle/game_phase_script_vm.h"

/* Implement absolute subroutine call and return for the compact script VM. */

/* Push cursor+4 as the return address, jump to the encoded absolute target, return zero. */
s32 GamePhaseScriptVm_Call(GamePhaseScriptVm *self)
{
    GamePhaseScriptVm_Push(self, (u32)(self->cursor + 4));
    self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    return 0;
}

/* Pop a return address into the instruction cursor and return zero. */
s32 GamePhaseScriptVm_Return(GamePhaseScriptVm *self)
{
    self->cursor = (const s8 *)GamePhaseScriptVm_Pop(self);
    return 0;
}
