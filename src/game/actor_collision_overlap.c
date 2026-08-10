#include "tingle/actor_motion.h"

/* Actor rectangle overlap detection and collision-response dispatch. */

#ifdef __cplusplus
extern "C" {
#endif
extern const s8 *Actor_GetCollisionBounds(void *actor);
#ifdef __cplusplus
}
#endif

static s32 overlap_half_toward_zero(s32 value)
{
    return (value + (s32)((u32)value >> 31)) >> 1;
}

/*
 * Build an actor-centered fixed-point rectangle from collision-box width and
 * height, actor center fields 0x2c/0x30, and supplied X/Y deltas. Intersect it
 * with `other`; when the intersection has positive width and height, encode
 * coincident actor edges as bits 1/2/4/8 and dispatch func_0200ab48. Return one
 * when dispatched, otherwise zero. Actor state changes only through that
 * response helper; collision-box lookup may have external effects.
 */
s32 func_0200a970(void *actorPointer, s32 deltaX, s32 deltaY,
                  const ActorCollisionRange *other)
{
    u8 *actor = (u8 *)actorPointer;
    s32 width = func_0200ab18(Actor_GetCollisionBounds(actorPointer)) << 12;
    s32 height = func_0200ab30(Actor_GetCollisionBounds(actorPointer)) << 12;
    ActorCollisionRange actorRange;
    ActorCollisionRange intersection;
    u8 edges = 0;

    actorRange.minX = deltaX + *(s32 *)(actor + 0x2c) -
                      overlap_half_toward_zero(width);
    actorRange.maxX = actorRange.minX + width;
    actorRange.minY = deltaY + *(s32 *)(actor + 0x30) -
                      overlap_half_toward_zero(height);
    actorRange.maxY = actorRange.minY + height;

    if (actorRange.minX >= other->maxX || actorRange.maxX <= other->minX ||
        actorRange.minY >= other->maxY || actorRange.maxY <= other->minY)
        return 0;

    intersection.minX = actorRange.minX > other->minX
                            ? actorRange.minX : other->minX;
    intersection.minY = actorRange.minY > other->minY
                            ? actorRange.minY : other->minY;
    intersection.maxX = actorRange.maxX < other->maxX
                            ? actorRange.maxX : other->maxX;
    intersection.maxY = actorRange.maxY < other->maxY
                            ? actorRange.maxY : other->maxY;
    if (intersection.minX == intersection.maxX ||
        intersection.minY == intersection.maxY)
        return 0;

    if (actorRange.minX == intersection.minX)
        edges |= 1;
    if (actorRange.maxX == intersection.maxX)
        edges |= 2;
    if (actorRange.minY == intersection.minY)
        edges |= 4;
    if (actorRange.maxY == intersection.maxY)
        edges |= 8;
    func_0200ab48(actorPointer, deltaX, deltaY, edges, &intersection);
    return 1;
}
