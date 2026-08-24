#ifndef TINGLE_RECT_S32_H
#define TINGLE_RECT_S32_H

#include "tingle/types.h"

typedef struct RectS32 {
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
} RectS32;

typedef char RectS32SizeCheck[sizeof(RectS32) == 0x10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void RectS32_Translate(RectS32 *rectangle, s32 deltaX, s32 deltaY);

#ifdef __cplusplus
}
#endif

#endif
