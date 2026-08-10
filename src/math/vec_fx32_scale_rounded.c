#include "tingle/vec_fx32.h"

/*
 * Scale the three recovered components of a 16-byte fixed-point value using
 * signed 20.12 multiplication with half-up rounding.
 */
/*
 * Initialize destination, multiply source X/Y/Z by scale with +0x800 before
 * shifting right 12, and return no value.
 */
void VecFx32Object_ScaleRounded(VecFx32Object *destination,
                                const VecFx32Object *source, fx32 scale)
{
    VecFx32Object_Init(destination);
    destination->value.x = (s32)(((s64)source->value.x * scale + 0x800) >> 12);
    destination->value.y = (s32)(((s64)source->value.y * scale + 0x800) >> 12);
    destination->value.z = (s32)(((s64)source->value.z * scale + 0x800) >> 12);
}
