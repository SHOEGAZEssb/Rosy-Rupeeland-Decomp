#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that configure and reset motion-probe movement. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorMotionProbe_ConfigureMotion(void *actor, s32 operandA,
                                             s32 operandB, s32 count,
                                             s32 operandD, s32 operandE);
extern void ActorMotionProbe_ResetMotion(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop fifth, fourth, count, second, and first parameters; clamp first and
 * second to at least zero and count to at least one; pass all five to
 * ActorMotionProbe_ConfigureMotion for the bound actor; and return zero.
 */
s32 GamePhaseActorScriptVm_ConfigureMotionProbe(GamePhaseActorScriptVm *self)
{
    s32 operandE = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 operandD = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 count = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 operandB = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 operandA = (s32)GamePhaseScriptVm_Pop(&self->base);
    if (operandA < 0)
        operandA = 0;
    if (operandB < 0)
        operandB = 0;
    if (count < 1)
        count = 1;
    ActorMotionProbe_ConfigureMotion(self->actor, operandA, operandB, count,
                                     operandD, operandE);
    return 0;
}

/*
 * Reset the bound motion-probe actor through ActorMotionProbe_ResetMotion and
 * return zero.
 */
s32 GamePhaseActorScriptVm_ResetMotionProbe(GamePhaseActorScriptVm *self)
{
    ActorMotionProbe_ResetMotion(self->actor);
    return 0;
}
