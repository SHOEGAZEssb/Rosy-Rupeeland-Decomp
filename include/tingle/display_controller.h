#ifndef TINGLE_DISPLAY_CONTROLLER_H
#define TINGLE_DISPLAY_CONTROLLER_H

#include "tingle/display_brightness.h"

typedef struct DisplayBrightnessPair {
    DisplayBrightness screens[2];
} DisplayBrightnessPair;

typedef char DisplayBrightnessPairSizeCheck[
    sizeof(DisplayBrightnessPair) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

DisplayBrightnessPair *DisplayBrightnessPair_Init(DisplayBrightnessPair *pair);
void DisplayBrightnessPair_Destroy(DisplayBrightnessPair *pair);
DisplayBrightness *DisplayBrightnessPair_GetScreen(DisplayBrightnessPair *pair, u32 screen);
void DisplayBrightness_UpdateAll(void);
void DisplayBrightness_StartMainTransition(s32 direction, fx32 transitionDivisor);
void DisplayBrightness_StartSubTransition(s32 direction, fx32 transitionDivisor);
s32 DisplayBrightness_IsMainTransitionComplete(void);
s32 DisplayBrightness_IsSubTransitionComplete(void);
s32 DisplayBrightness_IsSubTransitionIncreasing(void);
s32 DisplayBrightness_IsMainTransitionDecreasing(void);
s32 DisplayBrightness_IsSubTransitionDecreasing(void);
u8 DisplayController_GetVerticalOffset(void);
u32 DisplayController_GetSubScreenVerticalOffset(void);
void DisplayController_SetVerticalOffset(u8 value);

#ifdef __cplusplus
}
#endif

#endif
