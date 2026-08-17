#include "tingle/game_phase_script_vm.h"
#include "tingle/sound_stream.h"

/* Apply adjacent two-operand controls to the script VM's global sound context. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void Sound_PlayDirectSequence(void *context, u16 first, u16 second);
extern void Sound_StopDirectSequence(void *context, u16 first, u16 second);
extern void func_020592c0(void *context, u16 first, s32 second);
extern void func_020596e8(void *context, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Pop two operands and selector 21..25, invoke the corresponding sound
 * control, and return zero.  The first two controls narrow both operands to
 * halfwords; selector 23 narrows only the first.  Other selectors do nothing.
 */
s32 func_0201a938(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);

    switch (command) {
    case 21: Sound_PlayDirectSequence(gSoundContext, (u16)first, (u16)second); break;
    case 22: Sound_StopDirectSequence(gSoundContext, (u16)first, (u16)second); break;
    case 23: func_020592c0(gSoundContext, (u16)first, second); break;
    case 24: func_020595b0(gSoundContext, first, second); break;
    case 25: func_020596e8(gSoundContext, first, second); break;
    }
    return 0;
}
