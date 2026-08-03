#ifndef TINGLE_BG_SCROLL_H
#define TINGLE_BG_SCROLL_H

#include "tingle/types.h"

typedef struct BgScrollState {
    s32 subBg3Y;
    s32 subBg3X;
    s32 subBg2Y;
    s32 subBg2X;
    s32 subBg1Y;
    s32 subBg1X;
    s32 subBg0Y;
    s32 subBg0X;
    s32 mainBg3Y;
    s32 mainBg3X;
    s32 mainBg2Y;
    s32 mainBg2X;
    s32 mainBg1Y;
    s32 mainBg1X;
    s32 mainBg0Y;
    s32 mainBg0X;
    u32 dirty;
} BgScrollState;

typedef char BgScrollStateSizeCheck[sizeof(BgScrollState) == 0x44 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern BgScrollState gBgScrollState;

void BgScroll_SetMainBg1(s32 x, s32 y);
void BgScroll_SetMainBg2(s32 x, s32 y);
void BgScroll_SetSubBg0(s32 x, s32 y);
void BgScroll_SetSubBg1(s32 x, s32 y);
void BgScroll_SetSubBg2(s32 x, s32 y);
void BgScroll_SetSubBg3(s32 x, s32 y);
void BgScroll_ClearDirty(void);
void BgScroll_Flush(void);

#ifdef __cplusplus
}
#endif

#endif
