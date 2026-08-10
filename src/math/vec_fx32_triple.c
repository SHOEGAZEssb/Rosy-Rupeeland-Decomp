#include "tingle/vec_fx32_triple.h"

/*
 * Three-vector aggregate used by the adjacent fixed-point curve routines.
 * Each member retains the existing polymorphic VecFx32Object representation.
 */

/* Construct three zero vectors in forward order and return the aggregate. */
VecFx32Triple *VecFx32Triple_Init(VecFx32Triple *self)
{
    VecFx32Object_Init(&self->first);
    VecFx32Object_Init(&self->second);
    VecFx32Object_Init(&self->third);
    return self;
}

/*
 * Copy first, second, and third into the aggregate's corresponding vector
 * payloads. No allocation or SDK effect occurs and no value is returned.
 */
void VecFx32Triple_Set(VecFx32Triple *self, const VecFx32Object *first,
                   const VecFx32Object *second, const VecFx32Object *third)
{
    VecFx32Object_Assign(&self->first, first);
    VecFx32Object_Assign(&self->second, second);
    VecFx32Object_Assign(&self->third, third);
}

/* Destroy the three non-owning vectors in reverse order and return self. */
VecFx32Triple *VecFx32Triple_Destroy(VecFx32Triple *self)
{
    VecFx32Object_Destroy(&self->third);
    VecFx32Object_Destroy(&self->second);
    VecFx32Object_Destroy(&self->first);
    return self;
}
