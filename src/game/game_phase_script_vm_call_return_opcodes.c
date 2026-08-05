#include "tingle/game_phase_script_vm.h"

/* Implement absolute subroutine call and return for the compact script VM. */

/* Push cursor+4 as the return address, jump to the encoded absolute target, return zero. */
s32 func_0201be48(GamePhaseScriptVm *self)
{
    func_02012720(self, (u32)(self->cursor_04 + 4));
    self->cursor_04 = (const s8 *)func_0201b278(self->cursor_04);
    return 0;
}

/* Pop a return address into the instruction cursor and return zero. */
s32 func_0201be70(GamePhaseScriptVm *self)
{
    self->cursor_04 = (const s8 *)func_02012704(self);
    return 0;
}
