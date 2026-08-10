#include "tingle/game_phase_script_vm.h"

/*
 * Implement adjacent actor-script commands for recovered actor runtime state,
 * display-channel parameters, and two actor flag-controlled mode changes.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4dc8;
extern void *DisplayBrightnessPair_GetScreen(void *state, s32 screen);
extern void DisplayBrightness_StartTransition(void *state, s32 first, s32 second, s32 third);
extern void Actor_EnsureAuxiliaryCollisionResource(void *actor);
extern void Actor_DestroyAuxiliaryCollisionResource(void *actor);
extern void Actor_SetAuxiliaryCollisionPosition(void *actor, s32 first,
                                                s32 second);
extern void func_0204ea8c(void *actor, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop second and first operands, pass them to the bound actor's recovered
 * two-value state operation, and return zero.  The callee's field effects
 * remain unknown.
 */
s32 func_020184d4(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    Actor_SetAuxiliaryCollisionPosition(self->actor, first, second);
    return 0;
}

/* Return one without consuming operands or changing observable state. */
s32 func_02018504(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 1;
}

/*
 * Pop a signed-16-bit actor value followed by one unused operand, apply the
 * value through the recovered actor operation, and return zero.
 */
s32 func_0201850c(GamePhaseActorScriptVm *self)
{
    s16 value = (s16)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    func_0204ea8c(self->actor, value);
    return 0;
}

/*
 * Pop an enable operand and mirror its truth value to bit 0x10 of the bound
 * actor's confirmed word at offset 0x14.  Return zero.
 */
s32 func_0201853c(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (enabled)
        *flags |= 0x10;
    else
        *flags &= ~0x10;
    return 0;
}

/*
 * Pop third, second, first, and screen-mask operands.  For mask bit 0 update
 * display channel 0; for bit 1 update channel 1.  Each selected channel
 * receives the same three recovered parameters.  Return zero.
 */
s32 func_0201856c(GamePhaseActorScriptVm *self)
{
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 screenMask = (s32)GamePhaseScriptVm_Pop(&self->base);
    if (screenMask & 1)
        DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 0),
                      first, second, third);
    if (screenMask & 2)
        DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 1),
                      first, second, third);
    return 0;
}

/*
 * Pop an enable operand.  Select one of two recovered actor mode operations
 * and keep bit 0x08000000 at actor offset 0x14 synchronized with that mode.
 * Return zero.
 */
s32 func_020185f4(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (enabled) {
        Actor_EnsureAuxiliaryCollisionResource(self->actor);
        *flags |= 0x08000000;
    } else {
        Actor_DestroyAuxiliaryCollisionResource(self->actor);
        *flags &= ~0x08000000;
    }
    return 0;
}
