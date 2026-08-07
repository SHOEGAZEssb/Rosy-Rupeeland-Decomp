#include "tingle/types.h"
/* Overlay 10 main/sub display-mode application. */
/* Replace DISPCNT bits8..12 with state +0x6C for main and +0x70 for sub, preserve all other bits, and return zero. Direct I/O targets are 0x04000000 and 0x04001000. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov010_021fe970(void *s){volatile u32 *m=(volatile u32 *)0x04000000,*u=(volatile u32 *)0x04001000;*m=(*m&~0x1f00)|(*(u32 *)((u8 *)s+0x6c)<<8);*u=(*u&~0x1f00)|(*(u32 *)((u8 *)s+0x70)<<8);return 0;}
