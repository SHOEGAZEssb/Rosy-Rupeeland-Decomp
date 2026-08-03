#include "tingle/bg_scroll.h"

/*
 * Deferred shadow state for the main and sub engines' eight BG scroll pairs.
 * Setters update selected coordinates and mark a layer dirty; BgScroll_Flush
 * masks each coordinate to the DS hardware's nine-bit field and writes only
 * dirty HOFS/VOFS register pairs.
 */

#define BG_SCROLL_MASK 0x1ff
#define REG_MAIN_BG0_SCROLL ((volatile u32 *)0x04000010)
#define REG_MAIN_BG1_SCROLL ((volatile u32 *)0x04000014)
#define REG_MAIN_BG2_SCROLL ((volatile u32 *)0x04000018)
#define REG_MAIN_BG3_SCROLL ((volatile u32 *)0x0400001c)
#define REG_SUB_BG0_SCROLL ((volatile u32 *)0x04001010)
#define REG_SUB_BG1_SCROLL ((volatile u32 *)0x04001014)
#define REG_SUB_BG2_SCROLL ((volatile u32 *)0x04001018)
#define REG_SUB_BG3_SCROLL ((volatile u32 *)0x0400101c)

#define BG_SCROLL_PACK(x, y)                                                     \
    (((u32)(x) & BG_SCROLL_MASK) |                                              \
     (((u32)(y) << 16) & (BG_SCROLL_MASK << 16)))

BgScrollState gBgScrollState;

/* Store main-engine BG1 coordinates and mark its register pair dirty. */
void BgScroll_SetMainBg1(s32 x, s32 y)
{
    gBgScrollState.mainBg1X = x;
    gBgScrollState.mainBg1Y = y;
    gBgScrollState.dirty |= 1 << 1;
}

/* Store main-engine BG2 coordinates and mark its register pair dirty. */
void BgScroll_SetMainBg2(s32 x, s32 y)
{
    gBgScrollState.mainBg2X = x;
    gBgScrollState.mainBg2Y = y;
    gBgScrollState.dirty |= 1 << 2;
}

/* Store sub-engine BG0 coordinates and mark its register pair dirty. */
void BgScroll_SetSubBg0(s32 x, s32 y)
{
    gBgScrollState.subBg0X = x;
    gBgScrollState.subBg0Y = y;
    gBgScrollState.dirty |= 1 << 4;
}

/* Store sub-engine BG1 coordinates and mark its register pair dirty. */
void BgScroll_SetSubBg1(s32 x, s32 y)
{
    gBgScrollState.subBg1X = x;
    gBgScrollState.subBg1Y = y;
    gBgScrollState.dirty |= 1 << 5;
}

/* Store sub-engine BG2 coordinates and mark its register pair dirty. */
void BgScroll_SetSubBg2(s32 x, s32 y)
{
    gBgScrollState.subBg2X = x;
    gBgScrollState.subBg2Y = y;
    gBgScrollState.dirty |= 1 << 6;
}

/* Store sub-engine BG3 coordinates and mark its register pair dirty. */
void BgScroll_SetSubBg3(s32 x, s32 y)
{
    gBgScrollState.subBg3X = x;
    gBgScrollState.subBg3Y = y;
    gBgScrollState.dirty |= 1 << 7;
}

/* Discard every pending scroll-register update without touching hardware. */
void BgScroll_ClearDirty(void)
{
    gBgScrollState.dirty = 0;
}

/*
 * Commit each dirty X/Y pair to the corresponding packed HOFS/VOFS register,
 * clearing that layer's bit before the volatile hardware write.
 */
void BgScroll_Flush(void)
{
    if (gBgScrollState.dirty & (1 << 0)) {
        gBgScrollState.dirty &= ~(1 << 0);
        *REG_MAIN_BG0_SCROLL = BG_SCROLL_PACK(gBgScrollState.mainBg0X,
                                              gBgScrollState.mainBg0Y);
    }
    if (gBgScrollState.dirty & (1 << 1)) {
        gBgScrollState.dirty &= ~(1 << 1);
        *REG_MAIN_BG1_SCROLL = BG_SCROLL_PACK(gBgScrollState.mainBg1X,
                                              gBgScrollState.mainBg1Y);
    }
    if (gBgScrollState.dirty & (1 << 2)) {
        gBgScrollState.dirty &= ~(1 << 2);
        *REG_MAIN_BG2_SCROLL = BG_SCROLL_PACK(gBgScrollState.mainBg2X,
                                              gBgScrollState.mainBg2Y);
    }
    if (gBgScrollState.dirty & (1 << 3)) {
        gBgScrollState.dirty &= ~(1 << 3);
        *REG_MAIN_BG3_SCROLL = BG_SCROLL_PACK(gBgScrollState.mainBg3X,
                                              gBgScrollState.mainBg3Y);
    }
    if (gBgScrollState.dirty & (1 << 4)) {
        gBgScrollState.dirty &= ~(1 << 4);
        *REG_SUB_BG0_SCROLL = BG_SCROLL_PACK(gBgScrollState.subBg0X,
                                             gBgScrollState.subBg0Y);
    }
    if (gBgScrollState.dirty & (1 << 5)) {
        gBgScrollState.dirty &= ~(1 << 5);
        *REG_SUB_BG1_SCROLL = BG_SCROLL_PACK(gBgScrollState.subBg1X,
                                             gBgScrollState.subBg1Y);
    }
    if (gBgScrollState.dirty & (1 << 6)) {
        gBgScrollState.dirty &= ~(1 << 6);
        *REG_SUB_BG2_SCROLL = BG_SCROLL_PACK(gBgScrollState.subBg2X,
                                             gBgScrollState.subBg2Y);
    }
    if (gBgScrollState.dirty & (1 << 7)) {
        gBgScrollState.dirty &= ~(1 << 7);
        *REG_SUB_BG3_SCROLL = BG_SCROLL_PACK(gBgScrollState.subBg3X,
                                             gBgScrollState.subBg3Y);
    }
}
