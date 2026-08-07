#include "tingle/types.h"
/* Overlay 15 three-word parameter copy helper. */
/* Copy exactly 12 bytes from argument two to argument one and return void without hardware effects. */
extern "C" void func_ov015_021fd230(void *d,const void *s){*(u32 *)d=*(const u32 *)s;*(u32 *)((u8 *)d+4)=*(const u32 *)((const u8 *)s+4);*(u32 *)((u8 *)d+8)=*(const u32 *)((const u8 *)s+8);}
