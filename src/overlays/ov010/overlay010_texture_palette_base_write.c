#include "tingle/types.h"
/* Overlay 10 GX texture-palette base write. */
/* Write base shifted right by 3 when format equals 2, otherwise by 4, to 0x040004AC; return void with direct GX hardware effect. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay010_WriteTexturePaletteBase(u32 base,s32 format){*(volatile u32 *)0x040004ac=base>>(format==2?3:4);}
