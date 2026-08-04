#include "tingle/actor_motion.h"

/*
 * Per-frame update for the bounded/jittered ActorMotion subclass. It advances
 * scripted motion, clamps it to a viewport, or follows the bound actor with an
 * optional random displacement before sampling configured oscillation.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_020bf1f8(u32 value, s32 modulus);
#ifdef __cplusplus
}
#endif

/*
 * Update one motion frame. Mode 2 advances stored X/Y deltas until the signed
 * count becomes negative, then snaps to the retained destination and clamps X
 * to [bounds[0], bounds[2]-256] and Y to [bounds[1], bounds[3]-192]. Other
 * modes follow the bound actor; while the derived countdown is positive, two
 * global PRNG draws add independent offsets in [-radius, radius). Oscillation
 * flag 0x2 then refreshes the trailing sampled offsets. Returns no value;
 * global MT state advances only when jitter is active, and no hardware changes.
 */
void func_020097ec(ActorMotionJitter *self, const s16 *bounds)
{
    ActorMotion *motion = &self->base;

    if (motion->mode == 2) {
        if ((motion->field_1c | motion->field_20) != 0) {
            if (motion->field_2c >= 0) {
                motion->field_30 |= 1;
                --motion->field_2c;
                motion->position.value.x += motion->field_1c;
                motion->position.value.y += motion->field_20;
            } else {
                motion->field_30 &= ~1;
                motion->position.value.x = motion->field_24;
                motion->position.value.y = motion->field_28;
                motion->field_1c = 0;
                motion->field_20 = 0;
            }
        }

        if ((motion->position.value.x >> 12) < bounds[0])
            motion->position.value.x = bounds[0] << 12;
        if ((motion->position.value.x >> 12) + 0x100 >= bounds[2])
            motion->position.value.x = (bounds[2] - 0x100) << 12;
        if ((motion->position.value.y >> 12) < bounds[1])
            motion->position.value.y = bounds[1] << 12;
        if ((motion->position.value.y >> 12) + 0xc0 >= bounds[3])
            motion->position.value.y = (bounds[3] - 0xc0) << 12;
    } else {
        VecFx32Object position;

        func_02004fe0(&position);
        if (motion->actor != 0) {
            VecFx32Object actorPosition;

            if (motion->mode == 0)
                motion->mode = 1;
            func_02009514(&actorPosition, motion);
            func_020050a4(&position, &actorPosition);
            func_02005058(&actorPosition);

            if (self->remainingFrames > 0) {
                s32 span;
                s32 random;

                --self->remainingFrames;
                span = self->radius * 2;
                random = func_020bf1f8(genrand_int32(), span);
                position.value.x += (self->radius - random) << 12;
                random = func_020bf1f8(genrand_int32(), span);
                position.value.y += (self->radius - random) << 12;
            }
            func_020050a4(&motion->position, &position);
        }
        func_02005058(&position);
    }

    if (motion->field_30 & 2)
        func_020096b0(motion);
}
