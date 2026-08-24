#include "tingle/actor_motion.h"

/* Resolve an actor overlap along movement axes and retain contacted edges. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 SignedAbsoluteValue(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * For each nonzero movement delta whose absolute magnitude reaches the
 * intersection width/height, push actor position fields 0x1c/0x20 out along
 * an edge indicated by bits 1/2/4/8. All edge bits are then ORed into actor
 * byte 0x4b, even when no positional correction was eligible. Returns no
 * value; SignedAbsoluteValue supplies absolute value and no hardware is touched.
 */
void ActorCollision_ApplyOverlapResponse(void *actorPointer, s32 deltaX, s32 deltaY, u8 edgeFlags,
                   const ActorCollisionRange *intersection)
{
    u8 *actor = (u8 *)actorPointer;
    s32 overlap = intersection->maxX - intersection->minX;

    if (deltaX != 0 && overlap <= SignedAbsoluteValue(deltaX)) {
        if (deltaX > 0 && (edgeFlags & ACTOR_COLLISION_DIRECTION_RIGHT))
            *(s32 *)(actor + 0x1c) -= overlap;
        if (deltaX < 0 && (edgeFlags & ACTOR_COLLISION_DIRECTION_LEFT))
            *(s32 *)(actor + 0x1c) += overlap;
    }

    overlap = intersection->maxY - intersection->minY;
    if (deltaY != 0 && overlap <= SignedAbsoluteValue(deltaY)) {
        if (deltaY > 0 && (edgeFlags & ACTOR_COLLISION_DIRECTION_DOWN))
            *(s32 *)(actor + 0x20) -= overlap;
        if (deltaY < 0 && (edgeFlags & ACTOR_COLLISION_DIRECTION_UP))
            *(s32 *)(actor + 0x20) += overlap;
    }
    *(u8 *)(actor + 0x4b) |= edgeFlags;
}
