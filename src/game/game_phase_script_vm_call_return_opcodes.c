#include "tingle/game_phase_script_vm.h"

/* Implement absolute subroutine call and return for the compact script VM. */

/* Push cursor+4 as the return address, jump to the encoded absolute target, return zero. */
s32 func_0201be48(GamePhaseScriptVm *self)
{
    GamePhaseScriptVm_Push(self, (u32)(self->cursor + 4));
    self->cursor = (const s8 *)func_0201b278(self->cursor);
    return 0;
}

/* Pop a return address into the instruction cursor and return zero. */
s32 func_0201be70(GamePhaseScriptVm *self)
{
    self->cursor = (const s8 *)GamePhaseScriptVm_Pop(self);
    return 0;
}
