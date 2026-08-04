#include "tingle/actor_motion.h"
#include "tingle/heap.h"

/*
 * Lifecycle and elementary state controls for a polymorphic actor-motion
 * helper. The base object binds an actor, retains two fixed-point positions,
 * and tracks a compact two-triple movement state used by later update code.
 */

extern const void *data_020d43f4[];

/*
 * Construct an unbound motion helper, zero its embedded state, and initialize
 * the target position to (-0x80000, -0x74000, 0). Returns self; vector
 * construction/assignment has no hardware effects.
 */
ActorMotion *func_02008f90(ActorMotion *self)
{
    VecFx32Object temporary;

    self->vtable = data_020d43f4;
    self->actor = 0;
    func_02004fe0(&self->position);
    self->mode = 0;
    self->field_30 = 0;
    func_02004fe0(&self->target);
    func_0200901c(&self->state);
    self->field_1c = 0;
    self->field_20 = 0;
    self->field_24 = 0;
    self->field_28 = 0;
    self->field_2c = 0;
    func_0200500c(&temporary, -0x80000, -0x74000, 0);
    func_020050a4(&self->target, &temporary);
    func_02005058(&temporary);
    return self;
}

/* Zero both triples and both trailing words of the embedded movement state. */
ActorMotionState *func_0200901c(ActorMotionState *self)
{
    func_02009044(&self->first);
    func_02009044(&self->second);
    self->field_18 = 0;
    self->field_1c = 0;
    return self;
}

/* Zero the three signed components of a movement-state triple and return it. */
ActorMotionTriple *func_02009044(ActorMotionTriple *self)
{
    self->x = 0;
    self->y = 0;
    self->z = 0;
    return self;
}

/* Destroy both owned vector wrappers in reverse order and return self. */
ActorMotion *func_02009058(ActorMotion *self)
{
    func_02005058(&self->target);
    func_02005058(&self->position);
    return self;
}

/* Destroy both vector wrappers, free the object, and return its old address. */
ActorMotion *func_02009078(ActorMotion *self)
{
    func_02005058(&self->target);
    func_02005058(&self->position);
    Heap_Free(self);
    return self;
}

/* Alternate non-deleting destructor used by derived classes; returns self. */
ActorMotion *func_020090a0(ActorMotion *self)
{
    func_02005058(&self->target);
    func_02005058(&self->position);
    return self;
}

/*
 * Reset an existing helper without replacing its vtable. This unbinds the
 * actor, reconstructs a zero position, clears movement state and fields, and
 * restores the default target position. Returns no value.
 */
void func_020090c0(ActorMotion *self)
{
    VecFx32Object zero;
    VecFx32Object target;

    self->actor = 0;
    func_0200500c(&zero, 0, 0, 0);
    func_020050a4(&self->position, &zero);
    func_02005058(&zero);
    self->mode = 0;
    self->field_30 = 0;
    self->field_1c = 0;
    self->field_20 = 0;
    self->field_24 = 0;
    self->field_28 = 0;
    self->field_2c = 0;
    func_02009154(&self->state);
    func_0200500c(&target, -0x80000, -0x74000, 0);
    func_020050a4(&self->target, &target);
    func_02005058(&target);
}

/*
 * Clear the two movement triples through the class copy helper and zero the
 * trailing words. Returns no value; temporary triples contain no resources.
 */
void func_02009154(ActorMotionState *self)
{
    ActorMotionTriple first;
    ActorMotionTriple second;

    func_02009044(&first);
    func_0200919c(&self->first, &first);
    func_02009044(&second);
    func_0200919c(&self->second, &second);
    self->field_18 = 0;
    self->field_1c = 0;
}

/* Assign all three components unless source and destination are identical. */
ActorMotionTriple *func_0200919c(ActorMotionTriple *self,
                                 const ActorMotionTriple *source)
{
    if (self != source) {
        self->x = source->x;
        self->y = source->y;
        self->z = source->z;
    }
    return self;
}

/* Bind an actor and set motion mode 1; returns no value. */
void func_020091c0(ActorMotion *self, void *actor)
{
    self->actor = actor;
    self->mode = 1;
}

/* Return the currently bound actor without changing state. */
void *func_020091d0(const ActorMotion *self)
{
    return self->actor;
}

/* Copy a supplied vector payload into the current position and return it. */
VecFx32Object *func_020091d8(ActorMotion *self,
                             const VecFx32Object *position)
{
    return func_020050a4(&self->position, position);
}

/* Select motion mode 2 without modifying any other state. */
void func_020091e8(ActorMotion *self)
{
    self->mode = 2;
}

/* Select motion mode 1 and clear the two leading motion-result words. */
void func_020091f4(ActorMotion *self)
{
    self->mode = 1;
    self->field_1c = 0;
    self->field_20 = 0;
}
