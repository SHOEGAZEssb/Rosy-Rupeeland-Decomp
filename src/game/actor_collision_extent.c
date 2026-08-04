#include "tingle/actor_motion.h"

/* Signed-byte width and height extraction for actor collision boxes. */

/* Return bounds[2]-bounds[0], truncated through s8 exactly like retail. */
s32 func_0200ab18(const s8 *bounds)
{
    return (s8)(bounds[2] - bounds[0]);
}

/* Return bounds[3]-bounds[1], truncated through s8 exactly like retail. */
s32 func_0200ab30(const s8 *bounds)
{
    return (s8)(bounds[3] - bounds[1]);
}
