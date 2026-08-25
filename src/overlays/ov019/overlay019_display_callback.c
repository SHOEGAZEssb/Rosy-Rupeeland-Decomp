#include "tingle/types.h"

/* Overlay 19 main/sub display submission and scrolling callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseState_UpdateRenderHelpers(void *);
extern void GamePhaseAreaScene_Update(void *);
#ifdef __cplusplus
}
#endif

/*
 * When scene flag bit 10 is set, submit global scene data for the selected
 * engine, replace display-control bits 8..12 with main value +0x48 when mode
 * +0x58 is null or sub value +0x4C otherwise, and write signed offset +0x60
 * into the upper nine bits of the packed BG1 scroll word at engine offset
 * +0x14. Always return zero. Global graphics state changes and this directly
 * writes main/sub Nintendo DS display-control and BG offset MMIO.
 */
extern "C" s32 Overlay019_UpdateDisplay(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400) {
        volatile u32 *display;
        s32 layer;
        if (FIELD(void *, state, 0x58) == 0) {
            GamePhaseAreaScene_Update(FIELD(void *, (u8 *)gGamePhaseRuntime + 0x2000,
                               0xfb8));
            display = (volatile u32 *)0x04000000;
            layer = FIELD(s32, state, 0x48);
        } else {
            GamePhaseState_UpdateRenderHelpers((u8 *)gGamePhaseRuntime + 0x24);
            display = (volatile u32 *)0x04001000;
            layer = FIELD(s32, state, 0x4c);
        }
        display[0] = (display[0] & ~0x1f00U) | ((u32)layer << 8);
        display[5] = 0x01ff0000U &
                     ((u32)FIELD(s32, state, 0x60) << 16);
    }
    return 0;
}
