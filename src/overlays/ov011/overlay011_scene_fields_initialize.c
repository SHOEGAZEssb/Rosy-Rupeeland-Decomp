#include "tingle/types.h"
/* Overlay 11 embedded scene-field initialization. */
/* Store second/third arguments at +0x24/+0x28, clear +0x04/+0x08, ignore the fourth argument, return void, and perform no hardware access. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fce50(void *s,s32 a,s32 b,s32 unused){(void)unused;*(s32 *)((u8 *)s+0x24)=a;*(s32 *)((u8 *)s+0x28)=b;*(s32 *)((u8 *)s+4)=0;*(s32 *)((u8 *)s+8)=0;}
