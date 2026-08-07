#include "tingle/types.h"

/* Overlay 12 main/sub display-mode application. */

/* Replace DISPCNT bits 8..12 with state +0x6C for main and +0x70 for sub; preserve other bits, return zero, and write both engines. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov012_021fe408(void *state)
{
    volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;

    *mainDispcnt = (*mainDispcnt & ~0x1f00) |
                   (*(u32 *)((u8 *)state + 0x6c) << 8);
    *subDispcnt = (*subDispcnt & ~0x1f00) |
                  (*(u32 *)((u8 *)state + 0x70) << 8);
    return 0;
}
