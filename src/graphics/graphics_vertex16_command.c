/* Signed 16-bit vertex packing for the NDS geometry engine. */

#include "tingle/types.h"

#define REG_G3_VTX_16 (*(volatile u32 *)0x0400048c)

#ifndef MATCHING
extern void TingleNativeG3_Vertex16(u32 xy, u32 z);
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Pack and synchronously submit one signed XYZ vertex as two command words. */
void G3Command_SubmitVertex16(s32 x, s32 y, s32 z)
{
    u32 xy = (u16)x | ((u32)(u16)y << 16);
    u32 depth = (u16)z;

    REG_G3_VTX_16 = xy;
    REG_G3_VTX_16 = depth;
#ifndef MATCHING
    TingleNativeG3_Vertex16(xy, depth);
#endif
}

#ifdef __cplusplus
}
#endif
