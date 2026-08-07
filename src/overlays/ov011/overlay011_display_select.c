#include "tingle/types.h"
/* Overlay 11 POWCNT1 display selection. */
/* Replace bit15 of 0x04000304 with select, preserve other power bits, and return void with direct display-routing effect. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fce00(u32 s){volatile u16 *r=(volatile u16 *)0x04000304;*r=(u16)((*r&~0x8000)|(s<<15));}
