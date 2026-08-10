#include "tingle/vec_fx32_triple.h"

/*
 * Three-vector aggregate used by the adjacent fixed-point curve routines.
 * Each member retains the existing polymorphic VecFx32Object representation.
 */

/* Construct three zero vectors in forward order and return the aggregate. */
VecFx32Triple *VecFx32Triple_Init(VecFx32Triple *self)
{
    func_02004fe0(&self->first);
    func_02004fe0(&self->second);
    func_02004fe0(&self->third);
    return self;
}

/*
 * Copy first, second, and third into the aggregate's corresponding vector
 * payloads. No allocation or SDK effect occurs and no value is returned.
 */
void VecFx32Triple_Set(VecFx32Triple *self, const VecFx32Object *first,
                   const VecFx32Object *second, const VecFx32Object *third)
{
    func_020050a4(&self->first, first);
    func_020050a4(&self->second, second);
    func_020050a4(&self->third, third);
}

/* Destroy the three non-owning vectors in reverse order and return self. */
VecFx32Triple *VecFx32Triple_Destroy(VecFx32Triple *self)
{
    func_02005058(&self->third);
    func_02005058(&self->second);
    func_02005058(&self->first);
    return self;
}
