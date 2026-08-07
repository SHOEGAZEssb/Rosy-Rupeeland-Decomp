#include "tingle/types.h"
/* Overlay 10 held-input scalar clamp. */
/* Using input halfword +0x06 through state +0x50, add step on bit0x10 or subtract on bit0x20 and clamp to [minimum,maximum]; return the result without hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov010_021fd564(void *s,s32 v,s32 lo,s32 hi,s32 step){u16 k=*(u16 *)(*(u8 **)((u8 *)s+0x50)+6);if(k&0x10){v+=step;if(v>hi)v=hi;}else if(k&0x20){v-=step;if(v<lo)v=lo;}return v;}
