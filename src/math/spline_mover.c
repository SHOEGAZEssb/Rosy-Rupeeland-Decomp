#include "tingle/heap.h"
#include "tingle/spline_mover.h"

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

/* Recovered no-op base hook: preserve and return the supplied pointer. */
void *func_020068ac(void *self)
{
    return self;
}

/* Construct zero control points, clear parameter fields, and return self. */
SplineMover *func_020068b0(SplineMover *self)
{
    self->vtable = data_020d4218;
    func_02006328(&self->points);
    self->parameter = 0;
    self->parameterStep = 0;
    return self;
}

/* Destroy the three non-owning control vectors and return self. */
SplineMover *func_020068e0(SplineMover *self)
{
    func_0200637c(&self->points);
    return self;
}

/* Destroy control vectors, free the mover object, and return its old address. */
SplineMover *func_020068f8(SplineMover *self)
{
    func_0200637c(&self->points);
    Heap_Free(self);
    return self;
}

/* Construct and copy three supplied vectors into a triple, then return it. */
VecFx32Triple *func_02006918(VecFx32Triple *self,
                             const VecFx32Object *first,
                             const VecFx32Object *second,
                             const VecFx32Object *third)
{
    func_02004fe0(&self->first);
    func_02004fe0(&self->second);
    func_02004fe0(&self->third);
    func_020050a4(&self->first, first);
    func_020050a4(&self->second, second);
    func_020050a4(&self->third, third);
    return self;
}

/* Copy-construct all three vectors from source and return the new triple. */
VecFx32Triple *func_0200696c(VecFx32Triple *self,
                             const VecFx32Triple *source)
{
    func_02004fe0(&self->first);
    func_02004fe0(&self->second);
    func_02004fe0(&self->third);
    func_020050a4(&self->first, &source->first);
    func_020050a4(&self->second, &source->second);
    func_020050a4(&self->third, &source->third);
    return self;
}

/*
 * Install the spline vtable and store the points in recovered order: second,
 * first, control. Start at parameter zero and set the step to 1.0/duration
 * through the retail integer divider. Duration zero remains unchecked.
 */
SplineMover *func_020069b8(SplineMover *self,
                           const VecFx32Object *first,
                           const VecFx32Object *second,
                           const VecFx32Object *control, s32 duration)
{
    VecFx32Triple temporary;

    self->vtable = data_020d4218;
    func_02006918(&temporary, second, first, control);
    func_0200696c(&self->points, &temporary);
    func_02005058(&temporary.third);
    func_02005058(&temporary.second);
    func_02005058(&temporary.first);
    self->parameter = 0;
    self->parameterStep = func_020befec(0x1000, duration);
    return self;
}

/* Assign the three vector payloads and return the destination triple. */
VecFx32Triple *func_02006a2c(VecFx32Triple *self,
                             const VecFx32Triple *source)
{
    func_020050a4(&self->first, &source->first);
    func_020050a4(&self->second, &source->second);
    func_020050a4(&self->third, &source->third);
    return self;
}

/* Copy points and parameter state unless self-assigned, then return self. */
SplineMover *func_02006a5c(SplineMover *self,
                           const SplineMover *source)
{
    if (self != source) {
        func_02006a2c(&self->points, &source->points);
        self->parameter = source->parameter;
        self->parameterStep = source->parameterStep;
    }
    return self;
}

/*
 * Advance the normalized parameter and clamp it to 1.0. Return false only
 * when it was already at or above 1.0 on entry; otherwise return true.
 */
s32 func_02006a94(SplineMover *self)
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
void func_02006acc(VecFx32Object *result, const SplineMover *self)
{
    func_020063a4(result, &self->points, self->parameter);
}
