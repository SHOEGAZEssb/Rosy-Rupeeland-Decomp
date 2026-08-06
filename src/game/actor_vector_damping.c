#include "tingle/types.h"

/* Scale an actor motion vector by a 20.12 damping coefficient. */

/*
 * Multiply signed 20.12 components at vector offsets 0x04, 0x08, and 0x0c by
 * coefficient, round each product with 0x800, and store the shifted results.
 * Offset 0x00 is preserved. Returns no value and touches no hardware or SDK.
 */
void func_020328d0(void *vectorPointer, s32 coefficient)
{
    u8 *vector = (u8 *)vectorPointer;
    *(s32 *)(vector + 0x04) =
        (s32)(((s64)*(s32 *)(vector + 0x04) * coefficient + 0x800) >> 12);
    *(s32 *)(vector + 0x08) =
        (s32)(((s64)*(s32 *)(vector + 0x08) * coefficient + 0x800) >> 12);
    *(s32 *)(vector + 0x0c) =
        (s32)(((s64)*(s32 *)(vector + 0x0c) * coefficient + 0x800) >> 12);
}
