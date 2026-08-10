#include "tingle/vec_fx32.h"

/* In-place fixed-point vector scaling used for title actor separation. */

/* Multiply all three vector components by a 20.12 fixed-point scale. */
void func_ov090_0221b3d0(VecFx32Object *self, fx32 scale)
{
    self->value.x = (fx32)(((s64)self->value.x * scale + 0x800) >> 12);
    self->value.y = (fx32)(((s64)self->value.y * scale + 0x800) >> 12);
    self->value.z = (fx32)(((s64)self->value.z * scale + 0x800) >> 12);
}
