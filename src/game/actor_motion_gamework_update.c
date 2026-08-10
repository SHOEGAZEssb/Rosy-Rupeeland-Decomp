#include "tingle/actor_motion.h"
#include "tingle/game_work.h"

/*
 * Per-frame update for the ActorMotion subclass that exports display-relative
 * coordinates into two short GameWork fields.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorMotion_UpdateFromBoundActor(ActorMotion *self);
extern void func_02008740(VecFx32Object *result,
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

    if (self->mode == 2) {
        if ((self->field_1c | self->field_20) != 0) {
            if (self->field_2c > 0) {
                self->field_30 |= 1;
                --self->field_2c;
                self->position.value.x += self->field_1c;
                self->position.value.y += self->field_20;
            } else {
                self->field_30 &= ~1;
                self->position.value.x = self->field_24;
                self->position.value.y = self->field_28;
                self->field_1c = 0;
                self->field_20 = 0;
            }
        }
    } else {
        result = ActorMotion_UpdateFromBoundActor(self);
    }

    if (bounds[0] != 0 || bounds[1] != 0 ||
        bounds[2] != 0 || bounds[3] != 0) {
        if ((self->position.value.x >> 12) < bounds[0])
            self->position.value.x = bounds[0] << 12;
        if ((self->position.value.x >> 12) + 0x100 >= bounds[2])
            self->position.value.x = (bounds[2] - 0x100) << 12;
        if ((self->position.value.y >> 12) < bounds[1])
            self->position.value.y = bounds[1] << 12;
        if ((self->position.value.y >> 12) + 0xc0 >= bounds[3])
            self->position.value.y = (bounds[3] - 0xc0) << 12;
    }

    if (self->field_30 & 2)
        ActorMotion_UpdateOscillation(self);

    func_02008740(&offset, &self->state);
    *(s16 *)((u8 *)gGameWork + 0x232) =
        (s16)((self->position.value.x + offset.value.x -
               self->target.value.x) >> 12);
    func_02005058(&offset);

    func_02008740(&offset, &self->state);
    *(s16 *)((u8 *)gGameWork + 0x234) =
        (s16)((self->position.value.y + offset.value.y -
               self->target.value.y) >> 12);
    func_02005058(&offset);
    return result;
}
