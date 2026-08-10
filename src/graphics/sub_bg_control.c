#include "tingle/types.h"

/* Configure Nintendo DS sub-engine background control registers and graphics mode. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GXS_SetGraphicsMode(s32 mode);
extern void OS_Halt(void);
void GraphicsSubBackground_WriteBg0Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase,
                                           s32 bit13);
void GraphicsSubBackground_WriteBg1Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase,
                                           s32 bit13);
void GraphicsSubBackground_WriteBg2Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase);
void GraphicsSubBackground_WriteBg3Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase);
#ifdef __cplusplus
}
#endif

static volatile u16 *subBgControlRegister(s32 background)
{
    return (volatile u16 *)(0x04001008 + background * 2);
}

/*
 * Select sub background 0..3 in 256-color text mode, validate character base
 * 0..7 (halting otherwise), set screen size and priority, and return zero.
 * screenSize must be 0..3; retail leaves its mapped value undefined outside
 * that range.  The call also selects sub-engine graphics mode zero.
 */
s32 GraphicsSubBackground_Configure256ColorText(s32 background,
                                                s32 screenSize, s32 priority,
                                                s32 charBase)
{
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

    if ((u32)background <= 3) {
        GXS_SetGraphicsMode(0);
        if (background == 0)
            GraphicsSubBackground_WriteBg0Control(mappedScreenSize, 1, 0x1c,
                                                   mappedCharBase, 0);
        else if (background == 1)
            GraphicsSubBackground_WriteBg1Control(mappedScreenSize, 1, 0x1e,
                                                   mappedCharBase, 0);
        else if (background == 2)
            GraphicsSubBackground_WriteBg2Control(mappedScreenSize, 1, 0x1e,
                                                   mappedCharBase);
        else
            GraphicsSubBackground_WriteBg3Control(mappedScreenSize, 1, 0x1e,
                                                   mappedCharBase);
        control = subBgControlRegister(background);
        *control = (u16)((*control & ~3) | priority);
    }
    return 0;
}

/* Pack BG0_SUB size, color mode, screen/character bases, and bit 13. */
void GraphicsSubBackground_WriteBg0Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase,
                                           s32 bit13)
{
    volatile u16 *reg = (volatile u16 *)0x04001008;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7)
                 | (screenBase << 8) | (charBase << 2) | (bit13 << 13));
}

/* Pack BG1_SUB size, color mode, screen/character bases, and bit 13. */
void GraphicsSubBackground_WriteBg1Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase,
                                           s32 bit13)
{
    volatile u16 *reg = (volatile u16 *)0x0400100a;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7)
                 | (screenBase << 8) | (charBase << 2) | (bit13 << 13));
}

/* Pack BG2_SUB size, color mode, and screen/character bases. */
void GraphicsSubBackground_WriteBg2Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase)
{
    volatile u16 *reg = (volatile u16 *)0x0400100c;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7)
                 | (screenBase << 8) | (charBase << 2));
}

/* Pack BG3_SUB size, color mode, and screen/character bases. */
void GraphicsSubBackground_WriteBg3Control(s32 screenSize, s32 colorMode,
                                           s32 screenBase, s32 charBase)
{
    volatile u16 *reg = (volatile u16 *)0x0400100e;
    *reg = (u16)((*reg & 0x43) | (screenSize << 14) | (colorMode << 7)
                 | (screenBase << 8) | (charBase << 2));
}
