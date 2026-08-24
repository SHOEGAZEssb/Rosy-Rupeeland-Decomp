#include "tingle/actor_motion.h"

/*
 * Four-corner collision response for a game actor. The actor type remains
 * offset-based; the routine queries a collision interface and accumulates
 * corrective X/Y impulses plus directional contact flags.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_GetCachedTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

static s32 collision_half_toward_zero(s32 value)
{
    return (value + (s32)((u32)value >> 31)) >> 1;
}

static s32 collision_to_integer_toward_zero(s32 value)
{
    return (value + (value < 0 ? 0xffff : 0)) >> 16;
}

/*
 * Build four query points around the actor from signed-byte collision bounds,
 * its fixed-point position, adjusted Z, and Actor_GetCachedTerrainHeight's height result.
 * Each failed corner query contributes +/-0x1333 to X and Y correction. A
 * correction is applied to actor offsets 0x9c/0xa0 only when it opposes (or is
 * neutral to) velocity fields 0x3c/0x40; the corresponding accumulator at
 * 0x8c/0x90 is cleared. Contact signs are always ORed into byte 0x4b as bits
 * 1/2 for X and 4/8 for Y. Returns no value. The collision interface may have
 * observable query effects; no hardware is accessed directly.
 */
void ActorCollision_ResolveCornerContacts(void *actorPointer, void *collisionContext)
{
    u8 *actor = (u8 *)actorPointer;
    const ActorCollisionBoundsS8 *box;
    s32 z = *(s32 *)(actor + 0x24);
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
    s32 halfWidth;
    s32 halfHeight;
    s32 actorX = *(s32 *)(actor + 0x1c);
    s32 actorY = *(s32 *)(actor + 0x20);
    s32 queryLeft;
    s32 queryRight;
    s32 queryTop;
    s32 queryBottom;
    s32 queryZ;
    s32 actorHeight;
    s32 pushX = 0;
    s32 pushY = 0;

    if (z < 0)
        z -= 0xf000;
    box = Actor_GetCollisionBounds(actorPointer);
    left = (s32)box->left << 12;
    box = Actor_GetCollisionBounds(actorPointer);
    top = (s32)box->top << 12;
    box = Actor_GetCollisionBounds(actorPointer);
    right = (s32)box->right << 12;
    box = Actor_GetCollisionBounds(actorPointer);
    bottom = (s32)box->bottom << 12;

    halfWidth = collision_half_toward_zero(right - left);
    halfHeight = collision_half_toward_zero(bottom - top);
    queryRight = (actorX + halfWidth + 0xfff) >> 16;
    queryBottom = (actorY + halfHeight - 0xfff) >> 16;
    actorHeight = Actor_GetCachedTerrainHeight(actorPointer) >> 16;
    queryLeft = (actorX - halfWidth - 0xfff) >> 16;
    queryTop = (actorY - halfHeight - 0x1fff) >> 16;
    queryZ = collision_to_integer_toward_zero(z);

    if (!ActorCollision_TestPoint(collisionContext, queryLeft, queryTop,
                       queryZ, actorHeight)) {
        pushX -= 0x1333;
        pushY -= 0x1333;
    }
    if (!ActorCollision_TestPoint(collisionContext, queryRight, queryTop,
                       queryZ, actorHeight)) {
        pushX += 0x1333;
        pushY -= 0x1333;
    }
    if (!ActorCollision_TestPoint(collisionContext, queryLeft, queryBottom,
                       queryZ, actorHeight)) {
        pushX -= 0x1333;
        pushY += 0x1333;
    }
    if (!ActorCollision_TestPoint(collisionContext, queryRight, queryBottom,
                       queryZ, actorHeight)) {
        pushX += 0x1333;
        pushY += 0x1333;
    }

    if ((pushX > 0 && *(s32 *)(actor + 0x3c) <= 0) ||
        (pushX < 0 && *(s32 *)(actor + 0x3c) >= 0)) {
        *(s32 *)(actor + 0x9c) += pushX;
        *(s32 *)(actor + 0x8c) = 0;
    }
    if ((pushY > 0 && *(s32 *)(actor + 0x40) <= 0) ||
        (pushY < 0 && *(s32 *)(actor + 0x40) >= 0)) {
        *(s32 *)(actor + 0xa0) += pushY;
        *(s32 *)(actor + 0x90) = 0;
    }

    if (pushX > 0)
        *(u8 *)(actor + 0x4b) |= ACTOR_COLLISION_DIRECTION_LEFT;
    else if (pushX < 0)
        *(u8 *)(actor + 0x4b) |= ACTOR_COLLISION_DIRECTION_RIGHT;
    if (pushY > 0)
        *(u8 *)(actor + 0x4b) |= ACTOR_COLLISION_DIRECTION_UP;
    else if (pushY < 0)
        *(u8 *)(actor + 0x4b) |= ACTOR_COLLISION_DIRECTION_DOWN;
}
