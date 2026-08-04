#include "tingle/vec_fx32_stepper.h"

/*
 * Countdown-based three-vector stepper used by the adjacent spline mover.
 * Confirmed behavior is documented with neutral member names where the exact
 * direction of the underlying SDK vector operation is not yet established.
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
void func_02006644(VecFx32Stepper *self, const VecFx32Stepper *source)
{
    func_020050a4(&self->first, &source->first);
    func_020050a4(&self->second, &source->second);
    func_020050a4(&self->delta, &source->delta);
    self->remaining = source->remaining;
}

/* Construct three zero vectors, clear the countdown, and return self. */
VecFx32Stepper *func_02006678(VecFx32Stepper *self)
{
    func_02004fe0(&self->first);
    func_02004fe0(&self->second);
    func_02004fe0(&self->delta);
    self->remaining = 0;
    return self;
}

/*
 * Construct result and apply the SDK vector operation at 0x020adfbc to left
 * and right. Null inputs are forwarded as null payload pointers. No external
 * state changes and no value is returned.
 */
void func_020066a4(VecFx32Object *result, const VecFx32Object *left,
                   const VecFx32Object *right)
{
    func_02004fe0(result);
    func_020adfbc(left != 0 ? &left->value : (const VecFx32Value *)left,
                  right != 0 ? &right->value : (const VecFx32Value *)right,
                  &result->value);
}

/*
 * Copy the two supplied vectors, derive delta through func_020066a4, divide
 * each delta component by duration, record that countdown, and return self.
 * Retail performs unchecked fixed-point integer division, including duration
 * zero behavior supplied by the recovered divider.
 */
VecFx32Stepper *func_020066dc(VecFx32Stepper *self,
                              const VecFx32Object *first,
                              const VecFx32Object *second, s32 duration)
{
    VecFx32Object temporary;

    func_02005030(&self->first, first);
    func_02005030(&self->second, second);
    func_02004fe0(&self->delta);
    self->remaining = duration;
    func_020066a4(&temporary, &self->first, &self->second);
    func_020050a4(&self->delta, &temporary);
    func_02005058(&temporary);
    self->delta.value.x = func_020befec(self->delta.value.x, self->remaining);
    self->delta.value.y = func_020befec(self->delta.value.y, self->remaining);
    self->delta.value.z = func_020befec(self->delta.value.z, self->remaining);
    return self;
}

/* Assign another stepper unless it is self-assignment, then return self. */
VecFx32Stepper *func_0200676c(VecFx32Stepper *self,
                              const VecFx32Stepper *source)
{
    if (self == source)
        return self;

    func_02006644(self, source);
    return self;
}

/* Destroy the three non-owning vectors in reverse order and return self. */
VecFx32Stepper *func_02006788(VecFx32Stepper *self)
{
    func_02005058(&self->delta);
    func_02005058(&self->second);
    func_02005058(&self->first);
    return self;
}

/*
 * Decrement remaining. If it becomes negative, clamp it to zero, copy first
 * into second, and return false; otherwise combine delta into second through
 * func_020050c8 and return true.
 */
s32 func_020067b0(VecFx32Stepper *self)
{
    self->remaining--;
    if (self->remaining < 0) {
        self->remaining = 0;
        func_020050a4(&self->second, &self->first);
        return 0;
    }

    func_020050c8(&self->second, &self->delta);
    return 1;
}

/* Return the address of the second embedded vector without changing state. */
VecFx32Object *func_020067f4(VecFx32Stepper *self)
{
    return &self->second;
}

/* Return the address of the delta vector without changing state. */
VecFx32Object *func_020067fc(VecFx32Stepper *self)
{
    return &self->delta;
}

/* Return true when the countdown is nonpositive; state is unchanged. */
s32 func_02006804(const VecFx32Stepper *self)
{
    return self->remaining <= 0;
}

/*
 * Assign a temporary explicit zero vector into each member and clear the
 * countdown. Temporary constructors/destructors have no hardware effects.
 */
void func_02006818(VecFx32Stepper *self)
{
    VecFx32Object firstTemporary;
    VecFx32Object secondTemporary;
    VecFx32Object thirdTemporary;

    func_0200500c(&firstTemporary, 0, 0, 0);
    func_020050a4(&self->first, &firstTemporary);
    func_02005058(&firstTemporary);
    func_0200500c(&secondTemporary, 0, 0, 0);
    func_020050a4(&self->second, &secondTemporary);
    func_02005058(&secondTemporary);
    func_0200500c(&thirdTemporary, 0, 0, 0);
    func_020050a4(&self->delta, &thirdTemporary);
    func_02005058(&thirdTemporary);
    self->remaining = 0;
}
