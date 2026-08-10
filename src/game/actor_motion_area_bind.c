#include "tingle/actor_motion.h"

/* Actor-binding entry point used by the area-aware motion path. */

/* Bind actor at base offset four, select motion mode one, and return no value. */
void ActorMotionAreaFollower_BindActor(ActorMotion *self, void *actor)
{
    self->actor = actor;
    self->mode = 1;
}
