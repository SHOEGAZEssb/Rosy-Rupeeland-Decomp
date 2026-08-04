#include "tingle/actor_motion.h"
#include "tingle/vec_fx32_stepper.h"

/*
 * Motion setup toward a position recovered from the currently bound actor.
 * The companion target-extraction routine remains address-named until its
 * actor layout and alternate-coordinate rules are fully recovered.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern s32 func_020adcac(const VecFx32Value *left,
                         const VecFx32Value *right);
extern const s16 data_020c9670[];
#ifdef __cplusplus
}
#endif

static s32 actor_motion_actor_target_multiply(s16 value, s32 scale)
{
    return (s32)(((s64)value * scale + 0x800) >> 12);
}

/*
 * Select mode 2 and obtain a destination from the bound actor. With a zero
 * table-mode flag, store its displacement from the current position divided
 * by divisor, or unscaled when divisor is zero. With table mode enabled,
 * derive a distance-based count and direction-table velocity. Destination X/Y
 * and the count are retained, and the count is returned. Fixed-point SDK math
 * helpers are called; no graphics or other hardware state changes.
 */
s32 func_020093cc(ActorMotion *self, s32 divisor, s32 useDirectionTable)
{
    VecFx32Object destination;

    self->mode = 2;
    func_02009514(&destination, self);

    if (!useDirectionTable) {
        VecFx32Object displacement;

        func_020066a4(&displacement, &destination, &self->position);
        self->field_2c = divisor;
        if (divisor == 0) {
            self->field_1c = displacement.value.y;
            self->field_20 = displacement.value.z;
        } else {
            self->field_1c = func_020befec(displacement.value.y, divisor);
            self->field_20 = func_020befec(displacement.value.z, divisor);
        }
        self->field_24 = destination.value.x;
        self->field_28 = destination.value.y;
        func_02005058(&displacement);
    } else {
        u32 direction;

        self->field_2c =
            func_020adc90(func_020adcac(&destination.value,
                                        &self->position.value),
                          divisor) >> 12;
        direction = func_020093ac(&self->position, &destination) >> 4;
        self->field_1c = actor_motion_actor_target_multiply(
            data_020c9670[direction * 2 + 1], divisor);
        self->field_20 = actor_motion_actor_target_multiply(
            data_020c9670[direction * 2], divisor);
        self->field_24 = destination.value.x;
        self->field_28 = destination.value.y;
    }

    func_02005058(&destination);
    return self->field_2c;
}
