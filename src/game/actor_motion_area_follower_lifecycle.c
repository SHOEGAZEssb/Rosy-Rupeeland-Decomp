#include "tingle/actor_motion.h"

/*
 * Lifecycle for an area-aware actor-motion helper. It extends the jittered
 * motion object with an external area context, offset vector, and transition
 * bookkeeping used by the following large update routine.
 */

/*
 * Construct the jitter-motion base, retain areaContext without taking
 * ownership, construct a zero offset, clear transition state, set the previous
 * area sentinel to -1, and return self. No hardware or SDK service is called.
 */
ActorMotionAreaFollower *func_02009d14(ActorMotionAreaFollower *self,
                                       void *areaContext)
{
    func_02009790(&self->jitter);
    self->areaContext = areaContext;
    func_0200500c(&self->offset, 0, 0, 0);
    self->transitionActive = 0;
    self->transitionTimer = 0;
    self->previousArea = -1;
    return self;
}

/* Destroy the added vector and base motion wrappers, then return self. */
ActorMotionAreaFollower *func_02009d58(ActorMotionAreaFollower *self)
{
    func_02005058(&self->offset);
    func_020090a0(&self->jitter.base);
    return self;
}

/* Return the base motion's current-position wrapper; changes no state. */
VecFx32Object *func_02009d78(ActorMotionAreaFollower *self)
{
    return &self->jitter.base.position;
}
