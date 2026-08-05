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
 * Configure main background 0..3 with recovered character/screen bases, size,
 * and priority; clear BLDCNT and return zero.  Size zero additionally selects
 * graphics mode (1,0,0); size outside 0..3 halts.  charBase must be 0..3.
 */
s32 func_0201c798(s32 background, s32 charBase, s32 priority, s32 size)
{
    s32 mappedCharBase;
    s32 mappedSize;
    volatile u16 *control;

    switch (charBase) {
    case 0: mappedCharBase = 0; break;
    case 1: mappedCharBase = 1; break;
    case 2: mappedCharBase = 2; break;
    case 3: mappedCharBase = 3; break;
    }
    switch (size) {
    case 0:
        GX_SetGraphicsMode(1, 0, 0);
        mappedSize = 0;
        break;
    case 1: mappedSize = 1; break;
    case 2: mappedSize = 2; break;
    case 3: mappedSize = 3; break;
    default: OS_Halt(); break;
    }

    *(volatile u16 *)0x04000050 = 0;
    if ((u32)background <= 3) {
        control = (volatile u16 *)(0x04000008 + background * 2);
        *control = (u16)((*control & 0x43) | (mappedCharBase << 14)
                         | ((0x18 + background * 2) << 8)
                         | (mappedSize << 2));
        *control = (u16)((*control & ~3) | priority);
    }
    return 0;
}
