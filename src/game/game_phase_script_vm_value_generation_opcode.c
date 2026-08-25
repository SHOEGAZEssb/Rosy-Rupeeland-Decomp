#include "tingle/game_phase_script_vm.h"

/* Generate a script value from a recovered triple-value helper or fx32 interpolation. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void ActorMotionOscillation_InitInterval(void *value, s32 first, s32 second, s32 third);
extern s32 ActorMotionOscillation_Sample(void *value, s32 source, s32 alternate);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop parameter, third, second, first, and mode.  Modes 1..3 initialize a
 * recovered 12-byte triple and evaluate it with the system source or the
 * popped parameter, selecting normal/alternate evaluation as encoded.  Mode
 * 4 computes first + ((second-first)/third)*parameter using fx32 arithmetic.
 * Invalid modes halt.  Store the value as the VM result and return zero otherwise.
 */
s32 GamePhaseActorScriptVm_GenerateModeBasedValue(GamePhaseActorScriptVm *self)
{
    s32 parameter = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 generationMode = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 result;
    if (generationMode >= 1 && generationMode <= 3) {
        u32 value[3];
        s32 source;
        ActorMotionOscillation_InitInterval(value, first, second, third);
        source = generationMode == 1 ? *(s32 *)(gSystemState + 0x64) : parameter;
        result = ActorMotionOscillation_Sample(value, source, generationMode == 3);
    } else if (generationMode == 4) {
        s32 fraction = func_020befec((second - first) << 12, third);
        result = (fraction * parameter + (first << 12)) >> 12;
    } else {
        OS_Halt();
    }
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)result);
    return 0;
}
