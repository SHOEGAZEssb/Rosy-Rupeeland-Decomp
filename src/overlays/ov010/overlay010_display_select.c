#include "tingle/types.h"

/* Overlay 10 display selection; recovered POWCNT1 display-swap control. */

/* Replace POWCNT1 bit 15 with select. Returns void and writes 0x04000304. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fce00(u32 select)
{
    volatile u16 *reg = (volatile u16 *)0x04000304;
    *reg = (u16)((*reg & ~0x8000) | (select << 15));
}
