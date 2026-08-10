#include "tingle/vec_fx32.h"

/* Store phase-90 title-sequence vector coordinates without initializing a vtable. */

/*
 * Store x, y, and z into the value portion of a nullable vector object. The
 * retail ABI carries the coordinates in r1-r3.
 */
void func_ov090_0221a3cc(VecFx32Object *self, fx32 x, fx32 y, fx32 z)
{
    VecFx32Value *destination = (VecFx32Value *)self;
    if (destination != 0)
        destination = (VecFx32Value *)((u8 *)destination + 4);
    destination->x = x;
    destination->y = y;
    destination->z = z;
}
