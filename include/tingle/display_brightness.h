#ifndef TINGLE_DISPLAY_BRIGHTNESS_H
#define TINGLE_DISPLAY_BRIGHTNESS_H

#include "tingle/types.h"

typedef s32 fx32;

typedef struct DisplayBrightness {
    u32 screen : 1;
    s32 mode : 2;
    s32 lowerBrightness : 6;
    s32 upperBrightness : 6;
    s32 startBrightness : 6;
    s32 targetBrightness : 6;
    u32 unused : 5;
    fx32 transitionDivisor;
    fx32 targetFx;
    fx32 currentFx;
    s32 direction;
} DisplayBrightness;

typedef char DisplayBrightnessSizeCheck[sizeof(DisplayBrightness) == 0x14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void DisplayBrightness_Init(DisplayBrightness *state, u32 screen);
void DisplayBrightness_Copy(DisplayBrightness *destination,
                   const DisplayBrightness *source);
void DisplayBrightness_StartBoundTransition(DisplayBrightness *state, s32 direction,
                   fx32 transitionDivisor);
void DisplayBrightness_StartTransition(DisplayBrightness *state, s32 startBrightness,
                   s32 targetBrightness, fx32 transitionDivisor);
void DisplayBrightness_Update(DisplayBrightness *state);
s32 DisplayBrightness_GetCurrent(const DisplayBrightness *state);

#ifdef __cplusplus
}
#endif

#endif
