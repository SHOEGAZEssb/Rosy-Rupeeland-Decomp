#include "tingle/types.h"

/*
 * Overlay 9 display selection. This recovered hardware helper writes the
 * Nintendo DS POWCNT1 display-swap bit while preserving all other power bits.
 */

/*
 * Clear POWCNT1 bit 15 and replace it with select shifted into that position.
 * Return no value. This directly changes main/sub display routing hardware at
 * I/O address 0x04000304; callers are expected to supply a boolean value.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fce00(u32 select)
{
    volatile u16 *powcnt1 = (volatile u16 *)0x04000304;

    *powcnt1 = (u16)((*powcnt1 & ~0x8000) | (select << 15));
}
