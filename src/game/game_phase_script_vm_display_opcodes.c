#include "tingle/display_controller.h"
#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that start and query display brightness transitions. */

/*
 * Pop a display mask and direction selector. Mask bit 0 starts the first
 * display controller and bit 1 starts the second, both with fx32 divisor 0x10.
 * A nonzero selector passes direction 1; zero passes direction 2. Returns zero.
 */
s32 func_020141d4(GamePhaseActorScriptVm *self)
{
    u32 mask = func_02012704(&self->base);
    u32 selector = func_02012704(&self->base);
    s32 direction = selector != 0 ? 1 : 2;
    if ((mask & 1) != 0)
        DisplayBrightness_StartMainTransition(direction, 0x10);
    if ((mask & 2) != 0)
        DisplayBrightness_StartSubTransition(direction, 0x10);
    return 0;
}

/*
 * Pop a display selector and push whether the selected transition is not yet
 * complete: selector 1 checks the first controller, selector 2 the second,
 * and other values report pending if either controller is incomplete. Returns
 * zero after pushing the result.
 */
s32 func_02014250(GamePhaseActorScriptVm *self)
{
    u32 selector = func_02012704(&self->base);
    u32 pending;
    if (selector == 1)
        pending = DisplayBrightness_IsMainTransitionComplete() == 0;
    else if (selector == 2)
        pending = DisplayBrightness_IsSubTransitionComplete() == 0;
    else
        pending = DisplayBrightness_IsMainTransitionComplete() == 0 || DisplayBrightness_IsSubTransitionComplete() == 0;
    func_020127f8(&self->base, pending);
    return 0;
}
