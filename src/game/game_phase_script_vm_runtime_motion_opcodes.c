#include "tingle/actor_motion.h"
#include "tingle/game_phase_script_vm.h"

/*
 * Implement script opcodes that configure or clear either of the two recovered
 * ActorMotion objects embedded in the global game-phase runtime.
 */

extern void *data_021052fc;

/*
 * Pop duration, Y amplitude, and X amplitude, configure the ActorMotion at
 * runtime offset 0x3044 through ActorMotion_SetOscillation, and return zero.
 */
s32 GamePhaseActorScriptVm_SetRuntimeMotion3044Oscillation(GamePhaseActorScriptVm *self)
{
    s32 duration = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 yAmplitude = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 xAmplitude = (s32)GamePhaseScriptVm_Pop(&self->base);
    ActorMotion_SetOscillation((ActorMotion *)((u8 *)data_021052fc + 0x3044),
                  xAmplitude, yAmplitude, duration);
    return 0;
}

/* Clear the ActorMotion at runtime offset 0x3044 and return zero. */
s32 GamePhaseActorScriptVm_ClearRuntimeMotion3044Oscillation(GamePhaseActorScriptVm *self)
{
    (void)self;
    ActorMotion_ClearOscillation((ActorMotion *)((u8 *)data_021052fc + 0x3044));
    return 0;
}

/*
 * Pop duration, Y amplitude, and X amplitude, configure the ActorMotion at
 * runtime offset 0x2fbc through ActorMotion_SetOscillation, and return zero.
 */
s32 GamePhaseActorScriptVm_SetRuntimeMotion2fbcOscillation(GamePhaseActorScriptVm *self)
{
    s32 duration = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 yAmplitude = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 xAmplitude = (s32)GamePhaseScriptVm_Pop(&self->base);
    ActorMotion_SetOscillation((ActorMotion *)((u8 *)data_021052fc + 0x2fbc),
                  xAmplitude, yAmplitude, duration);
    return 0;
}

/* Clear the ActorMotion at runtime offset 0x2fbc and return zero. */
s32 GamePhaseActorScriptVm_ClearRuntimeMotion2fbcOscillation(GamePhaseActorScriptVm *self)
{
    (void)self;
    ActorMotion_ClearOscillation((ActorMotion *)((u8 *)data_021052fc + 0x2fbc));
    return 0;
}
