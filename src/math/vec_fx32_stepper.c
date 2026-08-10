#include "tingle/vec_fx32_stepper.h"

/*
 * Countdown-based fixed-point vector stepper. It retains a target, current
 * value, and per-frame step used by actor motion and visual-effect smoothing.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020adfbc(const VecFx32Value *left,
                          const VecFx32Value *right,
                          VecFx32Value *destination);
extern s32 func_020befec(s32 numerator, s32 denominator);

#ifdef __cplusplus
}
#endif

/* Copy all three vector payloads and the countdown; no value is returned. */
void VecFx32Stepper_CopyState(VecFx32Stepper *self, const VecFx32Stepper *source)
{
    func_020050a4(&self->target, &source->target);
    func_020050a4(&self->current, &source->current);
    func_020050a4(&self->step, &source->step);
    self->remainingFrames = source->remainingFrames;
}

/* Construct three zero vectors, clear the countdown, and return self. */
VecFx32Stepper *VecFx32Stepper_Init(VecFx32Stepper *self)
{
    func_02004fe0(&self->target);
    func_02004fe0(&self->current);
    func_02004fe0(&self->step);
    self->remainingFrames = 0;
    return self;
}

/*
 * Construct result and subtract right from left through the SDK vector helper.
 * Null inputs are forwarded as null payload pointers. No external state
 * changes and no value is returned.
 */
void VecFx32_Subtract(VecFx32Object *result, const VecFx32Object *left,
                      const VecFx32Object *right)
{
    func_02004fe0(result);
    func_020adfbc(left != 0 ? &left->value : (const VecFx32Value *)left,
                  right != 0 ? &right->value : (const VecFx32Value *)right,
                  &result->value);
}

/*
 * Copy target and current, derive their displacement, divide each component by
 * duration to obtain a per-frame step, record that countdown, and return self.
 * Retail leaves duration zero to the recovered fixed-point divider.
 */
VecFx32Stepper *VecFx32Stepper_InitTransition(VecFx32Stepper *self,
                                               const VecFx32Object *target,
                                               const VecFx32Object *current,
                                               s32 duration)
{
    VecFx32Object temporary;

    func_02005030(&self->target, target);
    func_02005030(&self->current, current);
    func_02004fe0(&self->step);
    self->remainingFrames = duration;
    VecFx32_Subtract(&temporary, &self->target, &self->current);
    func_020050a4(&self->step, &temporary);
    func_02005058(&temporary);
    self->step.value.x =
        func_020befec(self->step.value.x, self->remainingFrames);
    self->step.value.y =
        func_020befec(self->step.value.y, self->remainingFrames);
    self->step.value.z =
        func_020befec(self->step.value.z, self->remainingFrames);
    return self;
}

/* Assign another stepper unless it is self-assignment, then return self. */
VecFx32Stepper *VecFx32Stepper_Assign(VecFx32Stepper *self,
                                      const VecFx32Stepper *source)
{
    if (self == source)
        return self;

    VecFx32Stepper_CopyState(self, source);
    return self;
}

/* Destroy the three non-owning vectors in reverse order and return self. */
VecFx32Stepper *VecFx32Stepper_Destroy(VecFx32Stepper *self)
{
    func_02005058(&self->step);
    func_02005058(&self->current);
    func_02005058(&self->target);
    return self;
}

/*
 * Decrement the frame countdown. If it becomes negative, clamp it to zero,
 * snap current to target, and return false; otherwise add the per-frame step
 * to current and return true.
 */
s32 VecFx32Stepper_Update(VecFx32Stepper *self)
{
    self->remainingFrames--;
    if (self->remainingFrames < 0) {
        self->remainingFrames = 0;
        func_020050a4(&self->current, &self->target);
        return 0;
    }

    func_020050c8(&self->current, &self->step);
    return 1;
}

/* Return the address of the current interpolated vector without changing state. */
VecFx32Object *VecFx32Stepper_GetCurrent(VecFx32Stepper *self)
{
    return &self->current;
}

/* Return the address of the per-frame step vector without changing state. */
VecFx32Object *VecFx32Stepper_GetStep(VecFx32Stepper *self)
{
    return &self->step;
}

/* Return true when the countdown is nonpositive; state is unchanged. */
s32 VecFx32Stepper_IsComplete(const VecFx32Stepper *self)
{
    return self->remainingFrames <= 0;
}

/*
 * Assign a temporary explicit zero vector into each member and clear the
 * countdown. Temporary constructors/destructors have no hardware effects.
 */
void VecFx32Stepper_Reset(VecFx32Stepper *self)
{
    VecFx32Object targetTemporary;
    VecFx32Object currentTemporary;
    VecFx32Object stepTemporary;

    func_0200500c(&targetTemporary, 0, 0, 0);
    func_020050a4(&self->target, &targetTemporary);
    func_02005058(&targetTemporary);
    func_0200500c(&currentTemporary, 0, 0, 0);
    func_020050a4(&self->current, &currentTemporary);
    func_02005058(&currentTemporary);
    func_0200500c(&stepTemporary, 0, 0, 0);
    func_020050a4(&self->step, &stepTemporary);
    func_02005058(&stepTemporary);
    self->remainingFrames = 0;
}
