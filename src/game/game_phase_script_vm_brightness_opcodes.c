#include "tingle/display_controller.h"
#include "tingle/game_phase_script_vm.h"

/* Implement fixed-duration script opcodes for main/sub display brightness transitions. */

extern DisplayBrightnessPair data_020f4dc8;

/* Start a 16-step main-screen transition from its current brightness to zero. */
s32 GamePhaseActorScriptVm_StartMainBrightnessToZero(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 0);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), 0, 16);
    return 0;
}

/* Start a 16-step main-screen transition from its current brightness to -8. */
s32 GamePhaseActorScriptVm_StartMainBrightnessToMinus8(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 0);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), -8, 16);
    return 0;
}

/* Start a 16-step sub-screen transition from its current brightness to zero. */
s32 GamePhaseActorScriptVm_StartSubBrightnessToZero(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), 0, 16);
    return 0;
}

/* Start a 16-step sub-screen transition from its current brightness to -8. */
s32 GamePhaseActorScriptVm_StartSubBrightnessToMinus8(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *state;
    (void)self;
    state = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
    DisplayBrightness_StartTransition(state, DisplayBrightness_GetCurrent(state), -8, 16);
    return 0;
}
