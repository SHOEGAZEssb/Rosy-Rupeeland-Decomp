#include "tingle/types.h"

/* Overlay 50 paired-sprite alpha control for the recovered field effect. */

/*
 * Truncate `alpha` to eight bits and write it to byte +0x3A in both sprite
 * records referenced at pair +0/+4. Sprite/OAM-visible state changes in memory;
 * nothing is returned and no SDK or direct hardware call occurs.
 */
extern "C" void func_ov050_0220d7ac(void *pair, u32 alpha)
{
    u8 value = (u8)alpha;
    u8 *bytes = (u8 *)pair;
    *(u8 *)(*(u8 **)bytes + 0x3a) = value;
    *(u8 *)(*(u8 **)(bytes + 4) + 0x3a) = value;
}
