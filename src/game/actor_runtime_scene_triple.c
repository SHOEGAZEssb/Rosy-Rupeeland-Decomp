#include "tingle/actor_runtime_scene.h"

/* Replace the three components of an initialized fixed-point vector object. */

/*
 * Preserve the VecFx32Object vtable, store x/y/z in its value payload, and
 * return that payload. A null object deliberately retains the retail unchecked
 * write-to-zero contract.
 */
VecFx32Value *VecFx32Object_SetComponents(VecFx32Object *object, fx32 x,
                                         fx32 y, fx32 z)
{
    VecFx32Value *destination = (VecFx32Value *)object;

    if (destination != 0)
        destination = &object->value;
    destination->x = x;
    destination->y = y;
    destination->z = z;
    return destination;
}
