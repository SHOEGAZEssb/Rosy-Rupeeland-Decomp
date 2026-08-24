#include "tingle/actor_motion.h"
#include "tingle/game_work.h"
#include "tingle/touch_region.h"

/*
 * Per-frame update for the ActorMotion subclass that exports display-relative
 * coordinates into two short GameWork fields.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorMotion_UpdateFromBoundActor(ActorMotion *self);
extern void ActorMotionState_BuildOscillationOffset(VecFx32Object *result,
                          const ActorMotionState *state);
#ifdef __cplusplus
}
#endif

/*
 * Advance mode-2 deltas while the signed count is positive, otherwise snap to
 * the destination, or refresh non-mode-2 position through ActorMotion_UpdateFromBoundActor. If at
 * least one boundary word is nonzero, clamp X to [left, right-256] and Y to
 * [top, bottom-192]. Configured oscillation is sampled, then position plus its
 * sampled offset minus the base target is converted from 20.12 fixed point and
 * written to GameWork offsets 0x232/0x234. Returns ActorMotion_UpdateFromBoundActor's result (zero
 * in the currently recovered implementation), or zero in mode 2. No hardware
 * is touched, but GameWork and this motion object change.
 */
s32 ActorMotionGameWork_Update(ActorMotion *self, const s16 *bounds)
{
    s32 result = 0;
    VecFx32Object offset;
    const RectS16 *viewport = (const RectS16 *)bounds;

    if (self->mode == 2) {
        if ((self->velocityX | self->velocityY) != 0) {
            if (self->remainingSteps > 0) {
                self->flags |= ACTOR_MOTION_FLAG_MOVING;
                --self->remainingSteps;
                self->position.value.x += self->velocityX;
                self->position.value.y += self->velocityY;
            } else {
                self->flags &= ~ACTOR_MOTION_FLAG_MOVING;
                self->position.value.x = self->destinationX;
                self->position.value.y = self->destinationY;
                self->velocityX = 0;
                self->velocityY = 0;
            }
        }
    } else {
        result = ActorMotion_UpdateFromBoundActor(self);
    }

    if (viewport->left != 0 || viewport->top != 0 ||
        viewport->right != 0 || viewport->bottom != 0) {
        if ((self->position.value.x >> 12) < viewport->left)
            self->position.value.x = viewport->left << 12;
        if ((self->position.value.x >> 12) + 0x100 >= viewport->right)
            self->position.value.x = (viewport->right - 0x100) << 12;
        if ((self->position.value.y >> 12) < viewport->top)
            self->position.value.y = viewport->top << 12;
        if ((self->position.value.y >> 12) + 0xc0 >= viewport->bottom)
            self->position.value.y = (viewport->bottom - 0xc0) << 12;
    }

    if (self->flags & ACTOR_MOTION_FLAG_OSCILLATION)
        ActorMotion_UpdateOscillation(self);

    ActorMotionState_BuildOscillationOffset(&offset, &self->state);
    *(s16 *)((u8 *)gGameWork + 0x232) =
        (s16)((self->position.value.x + offset.value.x -
               self->target.value.x) >> 12);
    VecFx32Object_Destroy(&offset);

    ActorMotionState_BuildOscillationOffset(&offset, &self->state);
    *(s16 *)((u8 *)gGameWork + 0x234) =
        (s16)((self->position.value.y + offset.value.y -
               self->target.value.y) >> 12);
    VecFx32Object_Destroy(&offset);
    return result;
}
