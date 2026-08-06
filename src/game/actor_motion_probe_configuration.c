#include "tingle/types.h"

/* Configure the recovered motion-probe actor's scale and randomized motion parameters. */

/* Store scale at actor word +0x20c; return no value and affect no external state. */
void func_0203c410(void *self, s32 scale)
{
    *(s32 *)((u8 *)self + 0x20c) = scale;
}

/*
 * Store X/Y random ranges at +0x244/+0x248, duration at +0x24c, and the two
 * stack-supplied oscillation values at +0x250/+0x254. Return no value; only the
 * supplied actor's recovered configuration fields change.
 */
void func_0203c418(void *self, s32 xRange, s32 yRange, s32 duration,
                   s32 amplitude, s32 phaseStep)
{
    u8 *actor = (u8 *)self;
    *(s32 *)(actor + 0x244) = xRange;
    *(s32 *)(actor + 0x248) = yRange;
    *(s32 *)(actor + 0x24c) = duration;
    *(s32 *)(actor + 0x250) = amplitude;
    *(s32 *)(actor + 0x254) = phaseStep;
}
