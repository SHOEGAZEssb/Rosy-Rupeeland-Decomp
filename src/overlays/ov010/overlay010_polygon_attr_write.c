#include "tingle/types.h"
/* Overlay 10 GX polygon-attribute register packing. */
/* Pack the first four register arguments and two stack arguments at confirmed shifts 0,4,6,24,16 and unshifted, write 0x040004A4, and return void. Semantics are GX polygon attributes; direct hardware access occurs. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay010_WritePolygonAttributes(u32 a,u32 b,u32 c,u32 d,u32 e,u32 f){*(volatile u32 *)0x040004a4=a|(b<<4)|(c<<6)|(d<<24)|(e<<16)|f;}
