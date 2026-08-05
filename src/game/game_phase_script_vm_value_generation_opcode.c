#include "tingle/game_phase_script_vm.h"

/* Generate a script value from a recovered triple-value helper or fx32 interpolation. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void func_0200964c(void *value, s32 first, s32 second, s32 third);
extern s32 func_020096f0(void *value, s32 source, s32 alternate);
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
 * Invalid modes halt.  Push the result and return zero otherwise.
 */
s32 func_0201a3e4(GamePhaseActorScriptVm *self)
{
    s32 parameter = (s32)func_02012704(&self->base);
    s32 third = (s32)func_02012704(&self->base);
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    s32 mode = (s32)func_02012704(&self->base);
    s32 result;
    if (mode >= 1 && mode <= 3) {
        u32 value[3];
        s32 source;
        func_0200964c(value, first, second, third);
        source = mode == 1 ? *(s32 *)(gSystemState + 0x64) : parameter;
        result = func_020096f0(value, source, mode == 3);
    } else if (mode == 4) {
        s32 fraction = func_020befec((second - first) << 12, third);
        result = (fraction * parameter + (first << 12)) >> 12;
    } else {
        OS_Halt();
    }
    func_020127f8(&self->base, (u32)result);
    return 0;
}
