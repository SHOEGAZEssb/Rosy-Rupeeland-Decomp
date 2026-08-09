#include "tingle/types.h"

/*
 * Overlay 50 small effect-base construction and virtual no-op hook. The base
 * stores a vtable and three offset-derived state fields.
 */

extern "C" u8 data_ov050_0220e384[];

/*
 * Install the effect vtable, clear +4/+8/+0xC, and return no value. Only the
 * caller-owned record changes; no allocation, SDK call, or hardware effect occurs.
 */
extern "C" void func_ov050_0220d874(void *effect)
{
    u8 *bytes = (u8 *)effect;
    *(void **)bytes = data_ov050_0220e384;
    *(s32 *)(bytes + 4) = 0;
    *(s32 *)(bytes + 8) = 0;
    *(s32 *)(bytes + 0x0c) = 0;
}
