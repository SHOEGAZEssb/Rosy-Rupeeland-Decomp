#include "tingle/types.h"

/* Overlay 12 display-routing helper for the LWO object-viewer scene. */

/* Replace POWCNT1 bit 15 with select, preserving every other power-control bit; returns void after writing 0x04000304. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd004(u32 select)
{
    volatile u16 *powcnt1 = (volatile u16 *)0x04000304;

    *powcnt1 = (u16)((*powcnt1 & ~0x8000) | (select << 15));
}
