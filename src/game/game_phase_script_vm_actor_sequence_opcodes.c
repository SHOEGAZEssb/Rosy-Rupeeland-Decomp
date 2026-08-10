#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that configure and reset motion-probe movement. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorMotionProbe_ConfigureMotion(void *actor, s32 first,
                                             s32 second, s32 count,
                                             s32 fourth, s32 fifth);
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
    s32 fifth = (s32)func_02012704(&self->base);
    s32 fourth = (s32)func_02012704(&self->base);
    s32 count = (s32)func_02012704(&self->base);
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    if (first < 0)
        first = 0;
    if (second < 0)
        second = 0;
    if (count < 1)
        count = 1;
    ActorMotionProbe_ConfigureMotion(self->actor_84, first, second, count,
                                     fourth, fifth);
    return 0;
}

/*
 * Reset the bound motion-probe actor through ActorMotionProbe_ResetMotion and
 * return zero.
 */
s32 GamePhaseActorScriptVm_ResetMotionProbe(GamePhaseActorScriptVm *self)
{
    ActorMotionProbe_ResetMotion(self->actor_84);
    return 0;
}
