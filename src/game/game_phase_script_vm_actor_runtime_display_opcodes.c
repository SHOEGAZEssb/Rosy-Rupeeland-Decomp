#include "tingle/game_phase_script_vm.h"
#include "tingle/display_controller.h"

/*
 * Implement adjacent actor-script commands for recovered actor runtime state,
 * display-channel parameters, and two actor flag-controlled mode changes.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern DisplayBrightnessPair gDisplayBrightnessPair;
extern void Actor_EnsureInteractionIcon(void *actor);
extern void Actor_DestroyInteractionIcon(void *actor);
extern void Actor_SetInteractionIconOffset(void *actor, s32 offsetX,
                                           s32 offsetY);
extern void func_0204ea8c(void *actor, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop signed Y then X offsets in projected pixels, convert them to FX32 through
 * the bound actor's interaction-icon setter, and return zero. A missing icon
 * is accepted as a no-op.
 */
s32 GamePhaseActorScriptVm_SetInteractionIconOffset(GamePhaseActorScriptVm *self)
{
    s32 offsetY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 offsetX = (s32)GamePhaseScriptVm_Pop(&self->base);
    Actor_SetInteractionIconOffset(self->actor, offsetX, offsetY);
    return 0;
}

/* Return one without consuming operands or changing observable state. */
s32 GamePhaseActorScriptVm_ReturnOne(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 1;
}

/*
 * Pop a signed-16-bit actor value followed by one unused operand, apply the
 * value through the recovered actor operation, and return zero.
 */
s32 GamePhaseActorScriptVm_DispatchActorSigned16Command(GamePhaseActorScriptVm *self)
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
s32 GamePhaseActorScriptVm_SetActorFlag10(GamePhaseActorScriptVm *self)
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
s32 GamePhaseActorScriptVm_StartSelectedDisplayBrightnessTransitions(GamePhaseActorScriptVm *self)
{
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 screenMask = (s32)GamePhaseScriptVm_Pop(&self->base);
    if (screenMask & 1)
        DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0),
                      first, second, third);
    if (screenMask & 2)
        DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1),
                      first, second, third);
    return 0;
}

/*
 * Pop an enable operand. Ensure and reset the bound actor's interaction icon
 * when true or destroy it when false, and mirror that requested mode to actor
 * +0x14 bit 0x08000000. Return zero. The actor flag is script-owned mode state,
 * not a universal icon-existence invariant.
 */
s32 GamePhaseActorScriptVm_SetInteractionIconEnabled(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (enabled) {
        Actor_EnsureInteractionIcon(self->actor);
        *flags |= 0x08000000;
    } else {
        Actor_DestroyInteractionIcon(self->actor);
        *flags &= ~0x08000000;
    }
    return 0;
}
