#include "tingle/display_controller.h"
#include "tingle/game_phase_script_vm.h"

/* Implement fixed-duration script opcodes for main/sub display brightness transitions. */

extern DisplayBrightnessPair data_020f4dc8;

/* Start a 16-step main-screen transition from its current brightness to zero. */
s32 func_02017334(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 0);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), 0, 16);
    return 0;
}

/* Start a 16-step main-screen transition from its current brightness to -8. */
s32 func_0201736c(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 0);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), -8, 16);
    return 0;
}

/* Start a 16-step sub-screen transition from its current brightness to zero. */
s32 func_020173a4(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), 0, 16);
    return 0;
}

/* Start a 16-step sub-screen transition from its current brightness to -8. */
s32 func_020173dc(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), -8, 16);
    return 0;
}
