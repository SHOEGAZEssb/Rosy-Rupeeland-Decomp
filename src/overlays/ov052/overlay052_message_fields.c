#include "tingle/types.h"

/* Overlay 52 message-entry field initialization for the Pinkle message menu. */

/*
 * Store four caller-supplied values at offsets 0xa4 through 0xb0 of `entry`.
 * Only caller-owned memory changes; nothing is returned and no SDK/MMIO occurs.
 */
extern "C" void func_ov052_0220d600(void *entry, u32 valueA4, u32 valueA8,
                                      u32 valueAC, u32 valueB0)
{
    u32 *fields = (u32 *)((u8 *)entry + 0xa4);
    fields[0] = valueA4;
    fields[1] = valueA8;
    fields[2] = valueAC;
    fields[3] = valueB0;
}
