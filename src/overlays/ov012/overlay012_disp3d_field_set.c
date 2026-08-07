#include "tingle/types.h"

/* Overlay 12 main-engine 3D-display field control. */

/* Preserve DISP3DCNT bits outside mask 0x3002, insert value beginning at bit 1, and return void after writing 0x04000060. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd020(u32 value)
{
    volatile u16 *disp3dcnt = (volatile u16 *)0x04000060;

    *disp3dcnt = (u16)((*disp3dcnt & 0xffffcffd) | (value << 1));
}
