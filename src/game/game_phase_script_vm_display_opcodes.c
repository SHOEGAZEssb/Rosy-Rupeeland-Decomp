#include "tingle/display_controller.h"
#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that start and query display brightness transitions. */

/*
 * Pop a display mask and direction selector. Mask bit 0 starts the first
 * display controller and bit 1 starts the second, both with fx32 divisor 0x10.
 * A nonzero selector passes direction 1; zero passes direction 2. Returns zero.
 */
s32 GamePhaseActorScriptVm_StartBrightnessTransition(GamePhaseActorScriptVm *self)
{
    u32 displayMask = GamePhaseScriptVm_Pop(&self->base);
    u32 targetUpperBound = GamePhaseScriptVm_Pop(&self->base);
    s32 direction = targetUpperBound != 0 ? 1 : 2;
    if ((displayMask & 1) != 0)
        DisplayBrightness_StartMainTransition(direction, 0x10);
    if ((displayMask & 2) != 0)
        DisplayBrightness_StartSubTransition(direction, 0x10);
    return 0;
}

/*
 * Pop a display selector and store whether the selected transition is not yet
 * complete: selector 1 checks the first controller, selector 2 the second,
 * and other values report pending if either controller is incomplete. Returns
 * zero after storing the VM result.
 */
s32 GamePhaseActorScriptVm_IsBrightnessTransitionPending(GamePhaseActorScriptVm *self)
{
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    u32 transitionPending;
    if (selector == 1)
        transitionPending = DisplayBrightness_IsMainTransitionComplete() == 0;
    else if (selector == 2)
        transitionPending = DisplayBrightness_IsSubTransitionComplete() == 0;
    else
        transitionPending = DisplayBrightness_IsMainTransitionComplete() == 0 ||
                            DisplayBrightness_IsSubTransitionComplete() == 0;
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, transitionPending);
    return 0;
}
