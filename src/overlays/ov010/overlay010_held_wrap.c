#include "tingle/types.h"
/* Overlay 10 held-input scalar wrapping. */
/* Using input halfword +0x06 through state +0x50, add/subtract step and wrap across [minimum,maximum]; return the result without hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov010_021fd5a8(void *s,s32 v,s32 lo,s32 hi,s32 step){u16 k=*(u16 *)(*(u8 **)((u8 *)s+0x50)+6);if(k&0x10){v+=step;if(v>hi)v=lo;}else if(k&0x20){v-=step;if(v<lo)v=hi;}return v;}
