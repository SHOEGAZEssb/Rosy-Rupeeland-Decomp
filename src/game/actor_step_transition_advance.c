#include "tingle/actor.h"

/* Advance the active 24-frame actor step transition. */

/*
 * Return zero when no position transition is active. While its timer is
 * positive, decrement it, add the per-frame X/Y deltas, and set Z to the
 * target height plus the selected curve offset; return one. When the timer has
 * expired, call the end callback, commit the target position, and return two.
 * The retail body copies all eight 25-entry curves (0x320 bytes) to its stack
 * before indexing; matching assembly preserves that compiler-sensitive
 * schedule. No direct hardware access occurs.
 */
s32 Actor_UpdatePositionTransition(Actor *self)
{
    s16 state = self->positionTransitionState;
    s16 timer;

    if (state == ACTOR_POSITION_TRANSITION_INACTIVE_STATE)
        return 0;
    timer = self->positionTransitionTimer;
    if (timer > 0) {
        timer--;
        self->positionTransitionTimer = timer;
        self->position.value.x += self->positionTransitionDeltaX;
        self->position.value.y += self->positionTransitionDeltaY;
        self->position.value.z = self->positionTransitionTarget.value.z +
            gActorPositionTransitionHeightOffsets
                [state][ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES - timer];
        return 1;
    }
    self->vtable->endPositionTransition(self);
    VecFx32Object_Assign(&self->position, &self->positionTransitionTarget);
    return 2;
}
