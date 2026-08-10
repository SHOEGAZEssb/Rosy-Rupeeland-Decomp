#include "tingle/heap.h"
#include "tingle/spline_mover.h"
#include "tingle/vec_fx32_stepper.h"

/*
 * Quadratic fixed-point spline mover identified by retail RTTI as
 * CUtilSplineMover. It owns three control vectors and advances a normalized
 * 20.12 parameter by a precomputed step.
 */

extern u32 data_020d4218[];

#ifdef __cplusplus
extern "C" {
#endif

extern s32 func_020befec(s32 numerator, s32 denominator);

#ifdef __cplusplus
}
#endif

/* Return the address of the stepper target vector without changing state. */
VecFx32Object *VecFx32Stepper_GetTarget(VecFx32Stepper *self)
{
    return &self->target;
}

/* Construct zero control points, clear parameter fields, and return self. */
SplineMover *SplineMover_Init(SplineMover *self)
{
    self->vtable = data_020d4218;
    VecFx32Triple_Init(&self->points);
    self->parameter = 0;
    self->parameterStep = 0;
    return self;
}

/* Destroy the three non-owning control vectors and return self. */
SplineMover *SplineMover_Destroy(SplineMover *self)
{
    VecFx32Triple_Destroy(&self->points);
    return self;
}

/* Destroy control vectors, free the mover object, and return its old address. */
SplineMover *SplineMover_DestroyAndFree(SplineMover *self)
{
    VecFx32Triple_Destroy(&self->points);
    Heap_Free(self);
    return self;
}

/* Construct and copy three supplied vectors into a triple, then return it. */
VecFx32Triple *VecFx32Triple_InitWithValues(VecFx32Triple *self,
                                            const VecFx32Object *first,
                                            const VecFx32Object *second,
                                            const VecFx32Object *third)
{
    VecFx32Object_Init(&self->first);
    VecFx32Object_Init(&self->second);
    VecFx32Object_Init(&self->third);
    VecFx32Object_Assign(&self->first, first);
    VecFx32Object_Assign(&self->second, second);
    VecFx32Object_Assign(&self->third, third);
    return self;
}

/* Copy-construct all three vectors from source and return the new triple. */
VecFx32Triple *VecFx32Triple_InitCopy(VecFx32Triple *self,
                                     const VecFx32Triple *source)
{
    VecFx32Object_Init(&self->first);
    VecFx32Object_Init(&self->second);
    VecFx32Object_Init(&self->third);
    VecFx32Object_Assign(&self->first, &source->first);
    VecFx32Object_Assign(&self->second, &source->second);
    VecFx32Object_Assign(&self->third, &source->third);
    return self;
}

/*
 * Install the spline vtable and store the points as current, target, control.
 * Start at parameter zero and set the step to 1.0/duration through the retail
 * integer divider. Duration zero remains unchecked.
 */
SplineMover *SplineMover_InitTransition(SplineMover *self,
                                        const VecFx32Object *target,
                                        const VecFx32Object *current,
                                        const VecFx32Object *control,
                                        s32 duration)
{
    VecFx32Triple temporary;

    self->vtable = data_020d4218;
    VecFx32Triple_InitWithValues(&temporary, current, target, control);
    VecFx32Triple_InitCopy(&self->points, &temporary);
    VecFx32Object_Destroy(&temporary.third);
    VecFx32Object_Destroy(&temporary.second);
    VecFx32Object_Destroy(&temporary.first);
    self->parameter = 0;
    self->parameterStep = func_020befec(0x1000, duration);
    return self;
}

/* Assign the three vector payloads and return the destination triple. */
VecFx32Triple *VecFx32Triple_Assign(VecFx32Triple *self,
                                   const VecFx32Triple *source)
{
    VecFx32Object_Assign(&self->first, &source->first);
    VecFx32Object_Assign(&self->second, &source->second);
    VecFx32Object_Assign(&self->third, &source->third);
    return self;
}

/* Copy points and parameter state unless self-assigned, then return self. */
SplineMover *SplineMover_Assign(SplineMover *self,
                                const SplineMover *source)
{
    if (self != source) {
        VecFx32Triple_Assign(&self->points, &source->points);
        self->parameter = source->parameter;
        self->parameterStep = source->parameterStep;
    }
    return self;
}

/*
 * Advance the normalized parameter and clamp it to 1.0. Return false only
 * when it was already at or above 1.0 on entry; otherwise return true.
 */
s32 SplineMover_Update(SplineMover *self)
{
    if (self->parameter >= 0x1000) {
        self->parameter = 0x1000;
        return 0;
    }

    self->parameter += self->parameterStep;
    if (self->parameter > 0x1000)
        self->parameter = 0x1000;
    return 1;
}

/* Evaluate the mover's x/y spline position into result; no state changes. */
void SplineMover_Evaluate2D(VecFx32Object *result, const SplineMover *self)
{
    VecFx32Bezier_Evaluate2D(result, &self->points, self->parameter);
}
