#include "tingle/actor_motion.h"
#include "tingle/game_phase_region_table.h"
#include "tingle/touch_region.h"

/*
 * Area-bound clamping and collision-rectangle preparation for actor motion.
 * Two translated rectangles are retained in retail control flow even though
 * this routine has no later observable read of their stack storage.
 */

/*
 * Copy the current position, construct and translate two rectangles from the
 * bound actor's signed-byte collision box and X/Y/Z coordinates, then clamp
 * the copied X/Y to area-specific bounds and assign it back. The supplied
 * fallbackBounds parameter is not observed by the retail body. Returns no
 * value; only current motion position changes, and no hardware is touched.
 */
void ActorMotionAreaFollower_ClampToAreaBounds(ActorMotionAreaFollower *self, s32 area,
                   const s16 *fallbackBounds)
{
    ActorMotion *motion = &self->jitter.base;
    u8 *actor = (u8 *)motion->actor;
    VecFx32Object position;
    RectS16 lowerRectangle;
    RectS16 actorRectangle;
    const ActorCollisionBoundsS8 *collision;
    const GamePhaseRegion *bounds;
    s32 actorX;
    s32 actorY;
    s32 actorZ;

    (void)fallbackBounds;
    VecFx32Object_InitCopy(&position, &motion->position);
    actorX = *(s32 *)(actor + 0x1c) >> 12;
    actorY = (*(s32 *)(actor + 0x20) >> 12) - 0x10;
    actorZ = *(s32 *)(actor + 0x24) >> 12;
    collision = Actor_GetCollisionBounds(actor);

    lowerRectangle.left = collision->left;
    lowerRectangle.top = (s16)(-42 - actorZ);
    lowerRectangle.right = collision->right;
    lowerRectangle.bottom = (s16)-actorZ;
    RectS16_Translate(&lowerRectangle, actorX, actorY);

    actorRectangle.left = collision->left;
    actorRectangle.top = (s16)(collision->top - 8);
    actorRectangle.right = collision->right;
    actorRectangle.bottom = collision->bottom;
    RectS16_Translate(&actorRectangle, actorX, actorY);

    bounds = GamePhaseRegionTable_GetRegion(self->areaContext, area);
    if ((position.value.x >> 12) < bounds->left)
        position.value.x = bounds->left << 12;
    else if ((position.value.x >> 12) + 0x100 >= bounds->right)
        position.value.x = (bounds->right - 0x100) << 12;
    if ((position.value.y >> 12) < bounds->top)
        position.value.y = bounds->top << 12;
    else if ((position.value.y >> 12) + 0xc0 >= bounds->bottom)
        position.value.y = (bounds->bottom - 0xc0) << 12;
    VecFx32Object_Assign(&motion->position, &position);
    VecFx32Object_Destroy(&position);
}
