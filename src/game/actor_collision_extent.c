#include "tingle/actor_motion.h"

/* Signed-byte width and height extraction for actor collision boxes. */

/* Return bounds[2]-bounds[0], truncated through s8 exactly like retail. */
s32 ActorBounds_GetWidth(const ActorCollisionBoundsS8 *bounds)
{
    return (s8)(bounds->right - bounds->left);
}

/* Return bounds[3]-bounds[1], truncated through s8 exactly like retail. */
s32 ActorBounds_GetHeight(const ActorCollisionBoundsS8 *bounds)
{
    return (s8)(bounds->bottom - bounds->top);
}
