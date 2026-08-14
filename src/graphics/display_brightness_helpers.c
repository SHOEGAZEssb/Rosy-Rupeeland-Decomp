/*
 * Screen-mask brightness transition helpers. They select one or both global
 * display controllers and use distance to the target as transition duration.
 */
#include "tingle/display_controller.h"

extern DisplayBrightnessPair gDisplayBrightnessPair;

/* Start a linear transition for one screen. No transition is started when the
 * current brightness already equals target; otherwise duration is abs(delta). */
void func_02092c38(u32 screen, s32 target)
{
    DisplayBrightness *brightness;
    s32 current;
    s32 duration;

    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair,
                                                  screen);
    current = DisplayBrightness_GetCurrent(brightness);
    duration = target - current;
    if (duration == 0)
        return;
    if (duration < 0)
        duration = -duration;
    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair,
                                                  screen);
    DisplayBrightness_StartTransition(brightness, current, target, duration);
}

/* Apply target to the main controller for mask bit 0 and the sub controller
 * for mask bit 1. Other bits are ignored and the function returns nothing. */
void func_02092c8c(s32 screenMask, s32 target)
{
    if ((screenMask & 1) != 0)
        func_02092c38(0, target);
    if ((screenMask & 2) != 0)
        func_02092c38(1, target);
}
