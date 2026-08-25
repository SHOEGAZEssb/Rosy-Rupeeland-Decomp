#include "tingle/types.h"

/* Configure Nintendo DS main-engine text backgrounds and reset blending. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0Mode);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Configure main background 0..3 in 16-color text mode with fixed screen
 * bases, caller-selected size, character base, and priority.  Clear BLDCNT
 * and return zero.  Character base zero additionally selects graphics mode
 * (1,0,0); a base outside 0..3 halts.  screenSize must be 0..3.
 */
s32 GraphicsMainBackground_Configure16ColorText(s32 background, s32 screenSize,
                                                s32 priority, s32 charBase)
{
    s32 mappedCharBase;
    s32 mappedScreenSize;
    volatile u16 *backgroundControl;

    switch (screenSize) {
    case 0: mappedScreenSize = 0; break;
    case 1: mappedScreenSize = 1; break;
    case 2: mappedScreenSize = 2; break;
    case 3: mappedScreenSize = 3; break;
    }
    switch (charBase) {
    case 0:
        GX_SetGraphicsMode(1, 0, 0);
        mappedCharBase = 0;
        break;
    case 1: mappedCharBase = 1; break;
    case 2: mappedCharBase = 2; break;
    case 3: mappedCharBase = 3; break;
    default: OS_Halt(); break;
    }

    *(volatile u16 *)0x04000050 = 0;
    if ((u32)background <= 3) {
        backgroundControl = (volatile u16 *)(0x04000008 + background * 2);
        *backgroundControl =
            (u16)((*backgroundControl & 0x43) | (mappedScreenSize << 14)
                  | ((0x18 + background * 2) << 8)
                  | (mappedCharBase << 2));
        *backgroundControl =
            (u16)((*backgroundControl & ~3) | priority);
    }
    return 0;
}
