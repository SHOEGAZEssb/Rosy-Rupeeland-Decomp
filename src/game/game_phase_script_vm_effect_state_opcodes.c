#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that arm and clear an effect-state request. */

/*
 * Pop a value into VM byte 0x90, set VM flag 0x2 at offset 0x8c, and return
 * zero. The consumer and precise meaning of this queued value are unconfirmed.
 */
s32 func_02013ed8(GamePhaseActorScriptVm *self)
{
    self->value_90 = (u8)func_02012704(&self->base);
    self->flags_8c |= 2;
    return 0;
}

/* Clear VM flag 0x2 at offset 0x8c and return zero. */
s32 func_02013efc(GamePhaseActorScriptVm *self)
{
    self->flags_8c &= ~2u;
    return 0;
}
