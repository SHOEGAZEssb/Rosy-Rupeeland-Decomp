#include "tingle/types.h"
/* Overlay 10 GX texture-parameter register packing. */
/* Pack eight inputs at the recovered shifts (including input7>>3 and input8<<29), write 0x040004A8, and return void. Field meanings beyond the GX texture-parameter boundary remain unnamed. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay010_WriteTextureParameters(u32 a,u32 b,u32 c,u32 d,u32 e,u32 f,u32 g,u32 h){*(volatile u32 *)0x040004a8=(a<<26)|(h>>3)|(b<<30)|(c<<20)|(d<<23)|(e<<16)|(f<<18)|(g<<29);}
