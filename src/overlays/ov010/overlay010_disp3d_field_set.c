#include "tingle/types.h"

/* Overlay 10 3D-display field control for the main engine's DISP3DCNT register. */

/* Preserve all DISP3DCNT bits except the confirmed 0x3002 mask, insert value at bit 1, return void, and write 0x04000060. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fce1c(u32 value)
{
    volatile u16 *reg = (volatile u16 *)0x04000060;
    *reg = (u16)((*reg & 0xffffcffd) | (value << 1));
}
