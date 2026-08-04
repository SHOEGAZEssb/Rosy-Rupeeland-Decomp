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

DisplayBrightnessPair *func_02002cdc(DisplayBrightnessPair *pair);
void func_02002d24(DisplayBrightnessPair *pair);
DisplayBrightness *func_02002d28(DisplayBrightnessPair *pair, u32 screen);
void func_02002d34(void);
void func_02002d54(s32 direction, fx32 transitionDivisor);
void func_02002d74(s32 direction, fx32 transitionDivisor);
s32 func_02002d94(void);
s32 func_02002db0(void);
s32 func_02002dcc(void);
s32 func_02002df0(void);
s32 func_02002e14(void);
u8 func_02002e38(void);
u32 func_02002e48(void);
void func_02002e5c(u8 value);

#ifdef __cplusplus
}
#endif

#endif
