#include "tingle/actor_motion.h"
#include "tingle/game_phase_region_table.h"

/* Area-crossing direction query for the area-aware actor-motion helper. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitPlanarProjection(VecFx32Object *result,
                                               const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Transform the actor vector at offset 0x18, lower its Y coordinate by 16
 * pixels, and query areaContext with a 32x32 rectangle spanning X-16..X+16
 * and original Y-32..Y. Returns the helper's observed direction code; only
 * temporary state changes and no hardware or global state is touched.
 */
s32 ActorMotionAreaFollower_QueryCrossingDirection(ActorMotionAreaFollower *self, void *actor, s32 area)
{
    VecFx32Object position;
    GamePhaseRegion rectangle;
    s32 result;
    s32 loweredY;
    s32 x;
    s32 left;
    s32 right;
    s32 y;
    s32 top;
    s32 bottom;

    VecFx32Object_InitPlanarProjection(&position, (u8 *)actor + 0x18);
    loweredY = position.value.y - 0x10000;
    x = position.value.x >> 12;
    left = x - 0x10;
    right = x + 0x10;
    y = loweredY >> 12;
    top = y - 0x10;
    bottom = y + 0x10;
    rectangle.right = (s16)right;
    rectangle.top = (s16)top;
    position.value.y = loweredY;
    rectangle.left = (s16)left;
    rectangle.bottom = (s16)bottom;
    result = GamePhaseRegionTable_ClassifyContainedSide(self->areaContext, area, &rectangle);
    VecFx32Object_Destroy(&position);
    return result;
}
