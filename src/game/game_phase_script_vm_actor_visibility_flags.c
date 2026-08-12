#include "tingle/game_phase_script_vm.h"

/* Implement the actor-script visibility-flag controls used by phase 225. */

/*
 * Pop a boolean and update actor word 0x14: a true value clears bit 1, while
 * false sets it. Returns zero and has no direct SDK or hardware effects.
 */
s32 GamePhaseActorScriptVm_SetActorFlag2Inverse(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (value != 0)
        *flags &= ~2u;
    else
        *flags |= 2;
    return 0;
}

/*
 * Pop a boolean and update actor word 0x14: a true value clears bit 2, while
 * false sets it. Returns zero and has no direct SDK or hardware effects.
 */
s32 GamePhaseActorScriptVm_SetActorFlag4Inverse(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (value != 0)
        *flags &= ~4u;
    else
        *flags |= 4;
    return 0;
}
