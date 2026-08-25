#include "tingle/types.h"

/* Overlay 12 main-engine 3D-display bit-4 toggle. */

/* Clear bits selected by 0x3010 when disabled; otherwise clear bits 12..13 and set bit 4. Returns void after writing DISP3DCNT. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay012_SetDisp3dBit4Enabled(s32 enabled)
{
    volatile u16 *disp3dcnt = (volatile u16 *)0x04000060;

    if (enabled == 0) {
        *disp3dcnt &= 0xcfef;
    } else {
        *disp3dcnt = (u16)((*disp3dcnt & ~0x3000) | 0x10);
    }
}
