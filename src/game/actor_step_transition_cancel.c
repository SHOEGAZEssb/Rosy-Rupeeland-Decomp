#include "tingle/actor.h"

/* End an active actor position transition. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RestoreSavedFlags(Actor *self);
#ifdef __cplusplus
}
#endif

/*
 * If a position transition is active, mark it inactive and restore the actor
 * flags saved when the transition began. An already-idle actor is unchanged.
 * Returns no value; the restoration helper owns any gameplay effects.
 */
void Actor_EndPositionTransition(Actor *self)
{
    if (self->positionTransitionState ==
        ACTOR_POSITION_TRANSITION_INACTIVE_STATE)
        return;
    self->positionTransitionState = ACTOR_POSITION_TRANSITION_INACTIVE_STATE;
    Actor_RestoreSavedFlags(self);
}
