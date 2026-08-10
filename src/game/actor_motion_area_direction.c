#include "tingle/actor_motion.h"

/* Area-crossing direction query for the area-aware actor-motion helper. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02056f00(VecFx32Object *result, const void *source);
extern s32 func_02011794(void *context, s32 area, const s16 *rectangle);
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
    s16 rectangle[4];
    s32 result;
    s32 loweredY;
    s32 x;
    s32 left;
    s32 right;
    s32 y;
    s32 top;
    s32 bottom;

    func_02056f00(&position, (u8 *)actor + 0x18);
    loweredY = position.value.y - 0x10000;
    x = position.value.x >> 12;
    left = x - 0x10;
    right = x + 0x10;
    y = loweredY >> 12;
    top = y - 0x10;
    bottom = y + 0x10;
    rectangle[2] = (s16)right;
    rectangle[1] = (s16)top;
    position.value.y = loweredY;
    rectangle[0] = (s16)left;
    rectangle[3] = (s16)bottom;
    result = func_02011794(self->areaContext, area, rectangle);
    func_02005058(&position);
    return result;
}
