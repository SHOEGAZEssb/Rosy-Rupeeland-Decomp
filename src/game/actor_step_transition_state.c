#include "tingle/actor.h"

/* Select a step-transition height curve and provide its default query. */

/*
 * Configure a 24-frame step-up transition. Select state 2/0 when motion flag
 * 0x400 is set and the step is/is not 32 world units high; otherwise select
 * state 3/1. Returns no value and calls no hardware or SDK services.
 */
void Actor_ConfigureStepUpTransition(Actor *self, s32 stepHeight)
{
    self->positionTransitionTimer = ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES;
    if (self->motionFlags & 0x400)
        self->positionTransitionState = stepHeight == 0x20 ? 2 : 0;
    else
        self->positionTransitionState = stepHeight == 0x20 ? 3 : 1;
}

/* Ignore the implied actor input and return zero without changing state. */
s32 ActorStepTransition_DefaultQueryReturnZero(void)
{
    return 0;
}
