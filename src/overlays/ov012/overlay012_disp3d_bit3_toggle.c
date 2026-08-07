#include "tingle/types.h"

/* Overlay 12 main-engine 3D-display bit-3 toggle. */

/* Clear bits selected by 0x3008 when disabled; otherwise clear bits 12..13 and set bit 3. Returns void after writing DISP3DCNT. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd080(s32 enabled)
{
    volatile u16 *disp3dcnt = (volatile u16 *)0x04000060;

    if (enabled == 0) {
        *disp3dcnt &= 0xcff7;
    } else {
        *disp3dcnt = (u16)((*disp3dcnt & ~0x3000) | 8);
    }
}
