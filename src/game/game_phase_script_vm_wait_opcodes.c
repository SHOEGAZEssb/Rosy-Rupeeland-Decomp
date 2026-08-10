#include "tingle/game_phase_script_vm.h"

/* Actor-script wait-countdown setup and yielding opcodes. */

/* Pops a signed countdown into actor VM offset +0x88 and returns zero. */
s32 GamePhaseActorScriptVm_SetWaitCountdown(GamePhaseActorScriptVm *self)
{
    self->waitCounter = (s32)GamePhaseScriptVm_Pop(&self->base);
    return 0;
}

/*
 * Decrements wait counter +0x88. Once negative it returns zero; otherwise it
 * rewinds the cursor by the two-byte invoke instruction and returns one so the
 * interpreter yields until a later update.
 */
s32 GamePhaseActorScriptVm_WaitForCountdown(GamePhaseActorScriptVm *self)
{
    if (--self->waitCounter < 0)
        return 0;
    self->base.cursor -= 2;
    return 1;
}
