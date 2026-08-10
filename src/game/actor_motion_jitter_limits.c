#include "tingle/actor_motion.h"

/* Monotonic parameter update for the jittered actor-motion subclass. */

/*
 * Raise the signed frame countdown and radius to the supplied minima. Values
 * that are already greater or equal are preserved. Returns no value, truncates
 * stored inputs to s16 like retail, and changes no external or hardware state.
 */
void ActorMotionJitter_EnsureMinimum(ActorMotionJitter *self, s32 minimumFrames,
                   s32 minimumRadius)
{
    if (self->remainingFrames < minimumFrames)
        self->remainingFrames = (s16)minimumFrames;
    if (self->radius < minimumRadius)
        self->radius = (s16)minimumRadius;
}
