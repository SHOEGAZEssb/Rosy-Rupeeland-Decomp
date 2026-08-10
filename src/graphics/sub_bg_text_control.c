#include "tingle/graphics_resources.h"

/* Configure a sub-engine text background while preserving retail's temporary resource lifecycle. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void GraphicsSubBackground_WriteBg0Control(
    s32 screenSize, s32 colorMode, s32 screenBase, s32 charBase, s32 bit13);
extern void GraphicsSubBackground_WriteBg1Control(
    s32 screenSize, s32 colorMode, s32 screenBase, s32 charBase, s32 bit13);
extern void GraphicsSubBackground_WriteBg2Control(
    s32 screenSize, s32 colorMode, s32 screenBase, s32 charBase);
extern void GraphicsSubBackground_WriteBg3Control(
    s32 screenSize, s32 colorMode, s32 screenBase, s32 charBase);
#ifdef __cplusplus
}
#endif

/*
 * Configure sub background 0..3 in 16-color text mode, set its priority, and
 * return zero.  charBase outside 0..7 halts; screenSize must be 0..3.
 * Retail initializes and destroys an otherwise-unused resource set around the
 * register writes, a lifecycle side effect retained by the portable form.
 */
s32 GraphicsSubBackground_Configure16ColorText(s32 background, s32 screenSize,
                                               s32 priority, s32 charBase)
{
    GraphicsResourceSet resources;
    s32 mappedCharBase;
    s32 mappedScreenSize;
    volatile u16 *control;

    switch (screenSize) {
    case 0: mappedScreenSize = 0; break;
    case 1: mappedScreenSize = 1; break;
    case 2: mappedScreenSize = 2; break;
    case 3: mappedScreenSize = 3; break;
    }
    switch (charBase) {
    case 0: mappedCharBase = 0; break;
    case 1: mappedCharBase = 1; break;
    case 2: mappedCharBase = 2; break;
    case 3: mappedCharBase = 3; break;
    case 4: mappedCharBase = 4; break;
    case 5: mappedCharBase = 5; break;
    case 6: mappedCharBase = 6; break;
    case 7: mappedCharBase = 7; break;
    default: OS_Halt(); break;
    }

    GraphicsResourceSet_Init(&resources);
    if ((u32)background <= 3) {
        if (background == 0)
            GraphicsSubBackground_WriteBg0Control(mappedScreenSize, 0, 0x18,
                                                   mappedCharBase, 0);
        else if (background == 1)
            GraphicsSubBackground_WriteBg1Control(mappedScreenSize, 0, 0x1a,
                                                   mappedCharBase, 0);
        else if (background == 2)
            GraphicsSubBackground_WriteBg2Control(mappedScreenSize, 0, 0x1c,
                                                   mappedCharBase);
        else
            GraphicsSubBackground_WriteBg3Control(mappedScreenSize, 0, 0x1e,
                                                   mappedCharBase);
        control = (volatile u16 *)(0x04001008 + background * 2);
        *control = (u16)((*control & ~3) | priority);
    }
    GraphicsResourceSet_Destroy(&resources);
    return 0;
}
