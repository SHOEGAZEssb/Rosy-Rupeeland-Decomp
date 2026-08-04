#include "tingle/actor_motion.h"

/* Actor-binding entry point used by the area-aware motion path. */

/* Bind actor at base offset four, select motion mode one, and return no value. */
void func_0200a114(ActorMotion *self, void *actor)
{
    self->actor = actor;
    self->mode = 1;
}
