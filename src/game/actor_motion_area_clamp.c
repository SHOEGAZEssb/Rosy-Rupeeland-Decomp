#include "tingle/actor_motion.h"

/*
 * Area-bound clamping and collision-rectangle preparation for actor motion.
 * Two translated rectangles are retained in retail control flow even though
 * this routine has no later observable read of their stack storage.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern const s8 *Actor_GetCollisionBounds(void *actor);
extern const s16 *func_02011788(void *context, s32 area);
#ifdef __cplusplus
}
#endif

/*
 * Copy the current position, construct and translate two rectangles from the
 * bound actor's signed-byte collision box and X/Y/Z coordinates, then clamp
 * the copied X/Y to area-specific bounds and assign it back. The supplied
 * fallbackBounds parameter is not observed by the retail body. Returns no
 * value; only current motion position changes, and no hardware is touched.
 */
void func_0200a1a0(ActorMotionAreaFollower *self, s32 area,
                   const s16 *fallbackBounds)
{
    ActorMotion *motion = &self->jitter.base;
    u8 *actor = (u8 *)motion->actor;
    VecFx32Object position;
    s16 lowerRectangle[4];
    s16 actorRectangle[4];
    const s8 *collision;
    const s16 *bounds;
    s32 actorX;
    s32 actorY;
    s32 actorZ;

    (void)fallbackBounds;
    func_02005030(&position, &motion->position);
    actorX = *(s32 *)(actor + 0x1c) >> 12;
    actorY = (*(s32 *)(actor + 0x20) >> 12) - 0x10;
    actorZ = *(s32 *)(actor + 0x24) >> 12;
    collision = Actor_GetCollisionBounds(actor);

    lowerRectangle[0] = collision[0];
    lowerRectangle[1] = (s16)(-42 - actorZ);
    lowerRectangle[2] = collision[2];
    lowerRectangle[3] = (s16)-actorZ;
    func_0200a2dc(lowerRectangle, actorX, actorY);

    actorRectangle[0] = collision[0];
    actorRectangle[1] = (s16)(collision[1] - 8);
    actorRectangle[2] = collision[2];
    actorRectangle[3] = collision[3];
    func_0200a2dc(actorRectangle, actorX, actorY);

    bounds = func_02011788(self->areaContext, area);
    if ((position.value.x >> 12) < bounds[0])
        position.value.x = bounds[0] << 12;
    else if ((position.value.x >> 12) + 0x100 >= bounds[2])
        position.value.x = (bounds[2] - 0x100) << 12;
    if ((position.value.y >> 12) < bounds[1])
        position.value.y = bounds[1] << 12;
    else if ((position.value.y >> 12) + 0xc0 >= bounds[3])
        position.value.y = (bounds[3] - 0xc0) << 12;
    func_020050a4(&motion->position, &position);
    func_02005058(&position);
}
