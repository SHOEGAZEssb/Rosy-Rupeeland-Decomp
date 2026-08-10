#include "tingle/game_phase_script_vm.h"

/* Dispatch the script VM's two five-operand packed-sound commands. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void func_020593ac(void *context, s32 soundId, s32 variant,
                         s32 first, s32 second, s32 third);
extern void func_0205943c(void *context, s32 soundId, s32 variant,
                         s32 first, s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/*
 * Pop four operands and selector 30 or 31, split the low halfword of the first
 * operand into a nine-bit sound ID and seven-bit variant, invoke the selected
 * sound operation, and return zero.  Other selectors do nothing.
 */
s32 func_0201ab60(GamePhaseActorScriptVm *self)
{
    s32 fourth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u16 packed = (u16)first;

    if (command == 30) {
        func_020593ac(gSoundContext, packed >> 7, packed & 0x7f,
                      second, third, fourth);
    } else if (command == 31) {
        func_0205943c(gSoundContext, packed >> 7, packed & 0x7f,
                      second, third, fourth);
    }
    return 0;
}
