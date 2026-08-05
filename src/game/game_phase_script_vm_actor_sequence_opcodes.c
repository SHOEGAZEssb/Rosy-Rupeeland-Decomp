#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that configure and stop the bound actor's recovered sequence subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203c418(void *actor, s32 first, s32 second, s32 count,
                          s32 fourth, s32 fifth);
extern void func_0203c438(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop fifth, fourth, count, second, and first parameters; clamp first and
 * second to at least zero and count to at least one; pass all five to
 * func_0203c418 for the bound actor; and return zero.
 */
s32 func_02016f78(GamePhaseActorScriptVm *self)
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
    func_0203c418(self->actor_84, first, second, count, fourth, fifth);
    return 0;
}

/* Stop or reset the bound actor's sequence through func_0203c438 and return zero. */
s32 func_02016ff4(GamePhaseActorScriptVm *self)
{
    func_0203c438(self->actor_84);
    return 0;
}
