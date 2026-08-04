#include "tingle/actor_motion.h"

/* Build swept actor bounds and resolve map collisions along each movement axis. */

#ifdef __cplusplus
extern "C" {
#endif
extern const s8 *func_02030e50(void *actor);
extern s32 func_02033f44(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Compare the actor's current fixed-point position at offsets 0x1c/0x20 with
 * its previous position at 0x2c/0x30. For each moved axis, construct the
 * actor-sized rectangle at that axis's destination, scan the collision context
 * in movement direction, and apply the returned overlap response. The actor's
 * position and contact state may change through func_0200a970; no value is
 * returned and no hardware is accessed directly. The bounds pointer returned
 * by func_02030e50 and the height from func_02033f44 retain address-derived
 * names because their wider actor contracts are not yet recovered.
 */
void func_0200ac14(void *actorPointer, void *collisionContext)
{
    u8 *actor = (u8 *)actorPointer;
    s32 z = *(s32 *)(actor + 0x24) >> 16;
    s32 deltaX = *(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x2c);
    s32 deltaY = *(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x30);
    s32 width = func_0200ab18(func_02030e50(actorPointer)) << 12;
    s32 height = func_0200ab30(func_02030e50(actorPointer)) << 12;
    s32 actorHeight = func_02033f44(actorPointer) >> 16;
    ActorCollisionRange sweep;
    ActorCollisionRange collision;

    if (deltaY != 0) {
        sweep.minX = *(s32 *)(actor + 0x2c) - width / 2;
        sweep.maxX = sweep.minX + width;
        sweep.minY = *(s32 *)(actor + 0x30) - height / 2 + deltaY;
        sweep.maxY = sweep.minY + height;

        if (deltaY < 0)
            func_0200a6ac(&collision, collisionContext, &sweep, 4, z,
                          actorHeight);
        else
            func_0200a6ac(&collision, collisionContext, &sweep, 8, z,
                          actorHeight);
        func_0200a970(actorPointer, 0, deltaY, &collision);
    }

    if (deltaX != 0) {
        sweep.minX = *(s32 *)(actor + 0x2c) - width / 2 + deltaX;
        sweep.maxX = sweep.minX + width;
        sweep.minY = *(s32 *)(actor + 0x30) - height / 2;
        sweep.maxY = sweep.minY + height;

        if (deltaX > 0)
            func_0200a6ac(&collision, collisionContext, &sweep, 2, z,
                          actorHeight);
        else
            func_0200a6ac(&collision, collisionContext, &sweep, 1, z,
                          actorHeight);
        func_0200a970(actorPointer, deltaX, 0, &collision);
    }
}
