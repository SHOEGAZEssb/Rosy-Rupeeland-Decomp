#include "tingle/types.h"
/* Overlay 11 sub-engine BG0CNT configuration. */
/* Preserve priority/mosaic bits0,1,6, then insert size<<14, colorDepth<<7, screenBase<<8, characterBase<<2, and fifth flag<<13. Return void and write 0x04001008. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fce1c(u32 size,u32 depth,u32 screen,u32 character,u32 flag){volatile u16 *r=(volatile u16 *)0x04001008;u32 v=*r&0x43;v|=size<<14;v|=depth<<7;v|=screen<<8;v|=character<<2;v|=flag<<13;*r=(u16)v;}
