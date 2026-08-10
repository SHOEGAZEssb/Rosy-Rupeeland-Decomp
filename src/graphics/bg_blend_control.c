#include "tingle/types.h"

/* Configure main- and sub-engine alpha blending for one selected background. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void func_020afd0c(volatile u16 *registerAddress, s32 firstMask,
                         s32 secondMask, s32 firstCoefficient,
                         s32 secondCoefficient);
#ifdef __cplusplus
}
#endif

/*
 * Select main-engine BG0..BG3 as the first blend target and all backgrounds
 * plus backdrop as second targets, using the two coefficients.  selector 4
 * clears BLDCNT; an out-of-range selector halts through the SDK.  Returns zero.
 */
s32 GraphicsMainBackground_ConfigureAlphaBlend(s32 selector,
                                               s32 firstCoefficient,
                                               s32 secondCoefficient)
{
    s32 firstMask = 0;
    s32 secondMask = 0x10;

    switch (selector) {
    case 0:
        secondMask |= 0x2f;
        firstMask = 1;
        break;
    case 1:
        secondMask |= 0x2f;
        firstMask = 2;
        break;
    case 2:
        secondMask |= 0x2f;
        firstMask = 4;
        break;
    case 3:
        secondMask |= 0x2f;
        firstMask = 8;
        break;
    case 4:
        *(volatile u16 *)0x04000050 = 0;
        return 0;
    default:
        OS_Halt();
        break;
    }
    func_020afd0c((volatile u16 *)0x04000050, firstMask, secondMask,
                  firstCoefficient, secondCoefficient);
    return 0;
}

/*
 * Select sub-engine BG0..BG3 as the first blend target and the other three
 * backgrounds plus backdrop as second targets.  selector 4 clears BLDCNT_SUB;
 * an out-of-range selector halts through the SDK.  Returns zero.
 */
s32 GraphicsSubBackground_ConfigureAlphaBlend(s32 selector,
                                              s32 firstCoefficient,
                                              s32 secondCoefficient)
{
    s32 firstMask = 0;
    s32 secondMask = 0x10;

    switch (selector) {
    case 0:
        secondMask |= 0x2e;
        firstMask = 1;
        break;
    case 1:
        secondMask |= 0x2d;
        firstMask = 2;
        break;
    case 2:
        secondMask |= 0x2b;
        firstMask = 4;
        break;
    case 3:
        secondMask |= 0x27;
        firstMask = 8;
        break;
    case 4:
        *(volatile u16 *)0x04001050 = 0;
        return 0;
    default:
        OS_Halt();
        break;
    }
    func_020afd0c((volatile u16 *)0x04001050, firstMask, secondMask,
                  firstCoefficient, secondCoefficient);
    return 0;
}
