#include "tingle/types.h"
/* Overlay 10 GX texture-coordinate write. */
/* Apply the recovered signed fixed-point narrowing to s/t, pack them as two halfwords, and write TEXCOORD at 0x04000488; return void with direct GX hardware effect. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay010_WriteTextureCoordinates(s32 s,s32 t){u16 ps=(u16)((s<<8)>>16);u16 pt=(u16)((t<<8)>>16);*(volatile u32 *)0x04000488=ps|((u32)pt<<16);}
