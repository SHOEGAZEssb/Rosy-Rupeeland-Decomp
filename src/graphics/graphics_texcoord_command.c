/* Fixed-point texture-coordinate packing for the NDS geometry engine. */

#include "tingle/types.h"

#define REG_G3_TEXCOORD (*(volatile u32 *)0x04000488)

#ifndef MATCHING
extern void TingleNativeG3_TexCoord(u32 coordinate);
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Convert two fx32 coordinates to packed signed 8.8 texture coordinates. */
void func_0209bcb0(s32 s, s32 t)
{
    u32 coordinate = (u16)(s >> 8) | ((u32)(u16)(t >> 8) << 16);

    REG_G3_TEXCOORD = coordinate;
#ifndef MATCHING
    TingleNativeG3_TexCoord(coordinate);
#endif
}

#ifdef __cplusplus
}
#endif
