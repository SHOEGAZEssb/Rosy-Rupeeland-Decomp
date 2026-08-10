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
ActorMotionAreaFollower *ActorMotionAreaFollower_Init(ActorMotionAreaFollower *self,
                                       void *areaContext)
{
    ActorMotionJitter_Init(&self->jitter);
    self->areaContext = areaContext;
    VecFx32Object_InitComponents(&self->offset, 0, 0, 0);
    self->transitionActive = 0;
    self->transitionTimer = 0;
    self->previousArea = -1;
    return self;
}

/* Destroy the added vector and base motion wrappers, then return self. */
ActorMotionAreaFollower *ActorMotionAreaFollower_Destroy(ActorMotionAreaFollower *self)
{
    VecFx32Object_Destroy(&self->offset);
    ActorMotion_DestroyBase(&self->jitter.base);
    return self;
}

/* Return the base motion's current-position wrapper; changes no state. */
VecFx32Object *ActorMotionAreaFollower_GetPosition(ActorMotionAreaFollower *self)
{
    return &self->jitter.base.position;
}
