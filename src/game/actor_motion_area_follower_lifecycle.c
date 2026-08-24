#include "tingle/actor_motion.h"

/*
 * Lifecycle for an area-aware actor-motion helper. It extends the jittered
 * motion object with an external area context, smoothed position, and
 * smoothing bookkeeping used by the following large update routine.
 */

/*
 * Construct the jitter-motion base, retain areaContext without taking
 * ownership, construct a zero smoothed position, clear smoothing state, set
 * the current-area sentinel to -1, and return self. No hardware or SDK service
 * is called.
 */
ActorMotionAreaFollower *ActorMotionAreaFollower_Init(ActorMotionAreaFollower *self,
                                       void *areaContext)
{
    ActorMotionJitter_Init(&self->jitter);
    self->areaContext = (GamePhaseRegionTable *)areaContext;
    VecFx32Object_InitComponents(&self->smoothedPosition, 0, 0, 0);
    self->smoothingActive = 0;
    self->smoothingWeight = 0;
    self->currentAreaIndex = -1;
    return self;
}

/* Destroy the added vector and base motion wrappers, then return self. */
ActorMotionAreaFollower *ActorMotionAreaFollower_Destroy(ActorMotionAreaFollower *self)
{
    VecFx32Object_Destroy(&self->smoothedPosition);
    ActorMotion_DestroyBase(&self->jitter.base);
    return self;
}

/* Return the base motion's current-position wrapper; changes no state. */
VecFx32Object *ActorMotionAreaFollower_GetPosition(ActorMotionAreaFollower *self)
{
    return &self->jitter.base.position;
}
