#include "tingle/display_controller.h"
#include "tingle/game_phase_script_vm.h"

/* Implement fixed-duration script opcodes for main/sub display brightness transitions. */

extern DisplayBrightnessPair gDisplayBrightnessPair;

/* Start a 16-step main-screen transition from its current brightness to zero. */
s32 GamePhaseActorScriptVm_StartMainBrightnessToZero(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *brightness;
    (void)self;
    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0);
    DisplayBrightness_StartTransition(brightness, DisplayBrightness_GetCurrent(brightness), 0, 16);
    return 0;
}

/* Start a 16-step main-screen transition from its current brightness to -8. */
s32 GamePhaseActorScriptVm_StartMainBrightnessToMinus8(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *brightness;
    (void)self;
    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0);
    DisplayBrightness_StartTransition(brightness, DisplayBrightness_GetCurrent(brightness), -8, 16);
    return 0;
}

/* Start a 16-step sub-screen transition from its current brightness to zero. */
s32 GamePhaseActorScriptVm_StartSubBrightnessToZero(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *brightness;
    (void)self;
    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
    DisplayBrightness_StartTransition(brightness, DisplayBrightness_GetCurrent(brightness), 0, 16);
    return 0;
}

/* Start a 16-step sub-screen transition from its current brightness to -8. */
s32 GamePhaseActorScriptVm_StartSubBrightnessToMinus8(GamePhaseActorScriptVm *self)
{
    DisplayBrightness *brightness;
    (void)self;
    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
    DisplayBrightness_StartTransition(brightness, DisplayBrightness_GetCurrent(brightness), -8, 16);
    return 0;
}
