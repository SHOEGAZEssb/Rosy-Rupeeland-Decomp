#include "tingle/types.h"

/* Overlay 10 3D-display toggle for selected main-engine DISP3DCNT fields. */

/* If disabled, clear bits excluded by 0xCFF7; otherwise clear bits 12..13 and set bit 3. Return void and write 0x04000060. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fce40(s32 enabled)
{
    volatile u16 *reg = (volatile u16 *)0x04000060;
    if (enabled == 0) *reg &= 0xcff7;
    else *reg = (u16)((*reg & ~0x3000) | 8);
}
