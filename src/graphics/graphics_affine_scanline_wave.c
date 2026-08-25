#include "tingle/types.h"

/* Apply the recovered scanline wave to main and sub affine BG2 references. */

typedef struct GraphicsAffineScanlineWave {
    u32 phase;
    s32 horizontalBase;
    s32 verticalBase;
    u32 padding0c;
    s32 horizontalReference;
    s32 verticalReference;
} GraphicsAffineScanlineWave;

#ifdef __cplusplus
extern "C" {
#endif
extern s16 data_020c92cc[];
#ifdef __cplusplus
}
#endif

/*
 * Sample the 32-entry retail sine table from the current VCOUNT and phase,
 * add the quadrature pair to the borrowed bases, and write packed 9-bit BG2X
 * and BG2Y values. Flag bit 0 suppresses main-engine writes and bit 1
 * suppresses sub-engine writes. Lines outside the 192-line LCD are ignored.
 */
void GraphicsAffineScanlineWave_Apply(const GraphicsAffineScanlineWave *wave, u32 flags)
{
    volatile u16 *vcount = (volatile u16 *)0x04000006;
    u32 index;
    s32 horizontal;
    s32 vertical;
    u32 packedHorizontal;
    u32 packedVertical;

    if (*vcount >= 192)
        return;
    index = (*vcount + (wave->phase >> 2)) & 31;
    horizontal = wave->horizontalBase + data_020c92cc[index];
    vertical = wave->verticalBase + data_020c92cc[(index + 16) & 31];
    packedHorizontal = ((u32)horizontal & 0x1ff) |
                       (((u32)wave->horizontalReference & 0x1ff) << 16);
    packedVertical = ((u32)vertical & 0x1ff) |
                     (((u32)wave->verticalReference & 0x1ff) << 16);
    if ((flags & 1) == 0) {
        *(volatile u32 *)0x04000018 = packedHorizontal;
        *(volatile u32 *)0x0400001c = packedVertical;
    }
    if ((flags & 2) == 0) {
        *(volatile u32 *)0x04001018 = packedHorizontal;
        *(volatile u32 *)0x0400101c = packedVertical;
    }
}
