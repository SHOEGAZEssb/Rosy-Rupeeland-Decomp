#include "tingle/vec_fx32.h"

/* Scale a fixed-point vector in place by a Q20.12 coefficient. */

/*
 * Multiply the signed Q20.12 X/Y/Z components by scale, add 0x800 before each
 * arithmetic right shift by 12, and store the results in place. The vtable is
 * preserved. Returns no value and touches no hardware or SDK.
 */
void VecFx32Object_ScaleInPlaceRounded(VecFx32Object *vector, fx32 scale)
{
    vector->value.x =
        (s32)(((s64)vector->value.x * scale + 0x800) >> 12);
    vector->value.y =
        (s32)(((s64)vector->value.y * scale + 0x800) >> 12);
    vector->value.z =
        (s32)(((s64)vector->value.z * scale + 0x800) >> 12);
}
