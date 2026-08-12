#include "tingle/vec_fx32_triple.h"

/* Vector and virtual-dispatch helpers used by the overlay-90 boss-stage sequence. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020adff0(const VecFx32Value *left,
                          const VecFx32Value *right,
                          VecFx32Value *output);
void func_ov090_0221a460(VecFx32Object *result,
                         const VecFx32Object *left,
                         const VecFx32Object *right);
#ifdef __cplusplus
}
#endif

/* Initialize a three-vector Bezier record from the supplied control points. */
extern "C" VecFx32Triple *func_ov090_0221a3dc(
    VecFx32Triple *self, const VecFx32Object *first,
    const VecFx32Object *second, const VecFx32Object *third)
{
    VecFx32Object_Init(&self->first);
    VecFx32Object_Init(&self->second);
    VecFx32Object_Init(&self->third);
    VecFx32Triple_Set(self, first, second, third);
    return self;
}

/*
 * Recover an actor's world-space boss-stage-sequence point by adding its base
 * position to the two embedded offsets at +0x2a4 and +0x2b4.
 */
extern "C" void func_ov090_0221a420(VecFx32Object *result, const void *actor)
{
    VecFx32Object temporary;
    func_ov090_0221a460(&temporary,
                        (const VecFx32Object *)((const u8 *)actor + 0x18),
                        (const VecFx32Object *)((const u8 *)actor + 0x2a4));
    func_ov090_0221a460(result, &temporary,
                        (const VecFx32Object *)((const u8 *)actor + 0x2b4));
    VecFx32Object_Destroy(&temporary);
}

/* Initialize `result` and add the value portions of two nullable vectors. */
extern "C" void func_ov090_0221a460(VecFx32Object *result,
                                     const VecFx32Object *left,
                                     const VecFx32Object *right)
{
    VecFx32Object_Init(result);
    if (right != 0)
        right = (const VecFx32Object *)((const u8 *)right + 4);
    if (left != 0)
        left = (const VecFx32Object *)((const u8 *)left + 4);
    func_020adff0((const VecFx32Value *)left, (const VecFx32Value *)right,
                  &result->value);
}

/* Initialize `result` and scale `source` by a 20.12 fixed-point factor. */
extern "C" void func_ov090_0221a498(VecFx32Object *result,
                                     const VecFx32Object *source, fx32 scale)
{
    VecFx32Object_Init(result);
    result->value.x = (fx32)(((s64)source->value.x * scale + 0x800) >> 12);
    result->value.y = (fx32)(((s64)source->value.y * scale + 0x800) >> 12);
    result->value.z = (fx32)(((s64)source->value.z * scale + 0x800) >> 12);
}
