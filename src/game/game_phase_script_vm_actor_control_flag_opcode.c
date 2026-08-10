#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that toggles a recovered bound-actor control flag. */

/*
 * Pop an enable value, set or clear actor flag 0x40 at offset 0x14, clear the
 * actor word at offset 0x44, and return zero. The flag's semantic name remains
 * unconfirmed.
 */
s32 func_020170f0(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (enabled)
        *flags |= 0x40;
    else
        *flags &= ~0x40u;
    *(u32 *)((u8 *)self->actor + 0x44) = 0;
    return 0;
}
