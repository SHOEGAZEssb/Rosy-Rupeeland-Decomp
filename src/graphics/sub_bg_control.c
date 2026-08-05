#include "tingle/types.h"

/* Configure Nintendo DS sub-engine background control registers and graphics mode. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GXS_SetGraphicsMode(s32 mode);
extern void OS_Halt(void);
void func_0201c338(s32 charBase, s32 colorMode, s32 screenBase, s32 size,
                   s32 bit13);
void func_0201c36c(s32 charBase, s32 colorMode, s32 screenBase, s32 size,
                   s32 bit13);
void func_0201c3a0(s32 charBase, s32 colorMode, s32 screenBase, s32 size);
void func_0201c3cc(s32 charBase, s32 colorMode, s32 screenBase, s32 size);
#ifdef __cplusplus
}
#endif

static volatile u16 *subBgControlRegister(s32 background)
{
    return (volatile u16 *)(0x04001008 + background * 2);
}

/*
 * Select sub background 0..3, validate size 0..7 (halting otherwise), apply
 * the recovered character/screen base configuration, set priority from the
 * low two bits of priority, and return zero.  charBase must be 0..3; retail
 * leaves its mapped value undefined outside that range.
 */
s32 func_0201c174(s32 background, s32 charBase, s32 priority, s32 size)
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
    case 0: mappedSize = 0; break;
    case 1: mappedSize = 1; break;
    case 2: mappedSize = 2; break;
    case 3: mappedSize = 3; break;
    case 4: mappedSize = 4; break;
    case 5: mappedSize = 5; break;
    case 6: mappedSize = 6; break;
    case 7: mappedSize = 7; break;
    default: OS_Halt(); break;
    }

    if ((u32)background <= 3) {
        GXS_SetGraphicsMode(0);
        if (background == 0)
            func_0201c338(mappedCharBase, 1, 0x1c, mappedSize, 0);
        else if (background == 1)
            func_0201c36c(mappedCharBase, 1, 0x1e, mappedSize, 0);
        else if (background == 2)
            func_0201c3a0(mappedCharBase, 1, 0x1e, mappedSize);
        else
            func_0201c3cc(mappedCharBase, 1, 0x1e, mappedSize);
        control = subBgControlRegister(background);
        *control = (u16)((*control & ~3) | priority);
    }
    return 0;
}

/* Pack BG0_SUB character base, color mode, screen base, size, and bit 13 into hardware. */
void func_0201c338(s32 charBase, s32 colorMode, s32 screenBase, s32 size,
                   s32 bit13)
{
    volatile u16 *reg = (volatile u16 *)0x04001008;
    *reg = (u16)((*reg & 0x43) | (charBase << 14) | (colorMode << 7)
                 | (screenBase << 8) | (size << 2) | (bit13 << 13));
}

/* Pack BG1_SUB character base, color mode, screen base, size, and bit 13 into hardware. */
void func_0201c36c(s32 charBase, s32 colorMode, s32 screenBase, s32 size,
                   s32 bit13)
{
    volatile u16 *reg = (volatile u16 *)0x0400100a;
    *reg = (u16)((*reg & 0x43) | (charBase << 14) | (colorMode << 7)
                 | (screenBase << 8) | (size << 2) | (bit13 << 13));
}

/* Pack BG2_SUB character base, color mode, screen base, and size into hardware. */
void func_0201c3a0(s32 charBase, s32 colorMode, s32 screenBase, s32 size)
{
    volatile u16 *reg = (volatile u16 *)0x0400100c;
    *reg = (u16)((*reg & 0x43) | (charBase << 14) | (colorMode << 7)
                 | (screenBase << 8) | (size << 2));
}

/* Pack BG3_SUB character base, color mode, screen base, and size into hardware. */
void func_0201c3cc(s32 charBase, s32 colorMode, s32 screenBase, s32 size)
{
    volatile u16 *reg = (volatile u16 *)0x0400100e;
    *reg = (u16)((*reg & 0x43) | (charBase << 14) | (colorMode << 7)
                 | (screenBase << 8) | (size << 2));
}
