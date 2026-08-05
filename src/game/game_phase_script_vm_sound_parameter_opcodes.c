#include "tingle/game_phase_script_vm.h"

/* Apply adjacent two-operand controls to the script VM's global sound context. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void func_02059278(void *context, u16 first, u16 second);
extern void func_0205929c(void *context, u16 first, u16 second);
extern void func_020592c0(void *context, u16 first, s32 second);
extern void func_020595b0(void *context, s32 first, s32 second);
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
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    s32 command = (s32)func_02012704(&self->base);

    switch (command) {
    case 21: func_02059278(gSoundContext, (u16)first, (u16)second); break;
    case 22: func_0205929c(gSoundContext, (u16)first, (u16)second); break;
    case 23: func_020592c0(gSoundContext, (u16)first, second); break;
    case 24: func_020595b0(gSoundContext, first, second); break;
    case 25: func_020596e8(gSoundContext, first, second); break;
    }
    return 0;
}
