#include "tingle/actor_motion.h"
#include "tingle/vec_fx32_stepper.h"

/*
 * Grid-target setup for actor motion. This converts script-supplied tile
 * coordinates into fixed-point destinations and derives either per-step
 * deltas or a table-directed velocity for the subsequent motion update.
 */

extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_020adc40(s32 value);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern u32 VecFx32_GetDirectionAngle(const VecFx32Object *from,
                         const VecFx32Object *to);
extern const s16 data_020c9670[];

static s32 actor_motion_square_fx32(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

static s32 actor_motion_multiply_fx32(s16 value, s32 scale)
{
    return (s32)(((s64)value * scale + 0x800) >> 12);
}

/*
 * Select mode 2 and build a destination at target-base X plus xIndex tiles
 * and target-base Y plus (yIndex + 20) tiles. When useDirectionTable is zero,
 * the function stores the direct displacement divided by divisor (or the raw
 * displacement when divisor is zero). Otherwise it derives a distance-based
 * count and uses the shared fixed-point direction table to scale divisor into
 * two motion components. The destination X/Y and derived count are retained;
 * the count is also returned. Fixed-point math helpers may use SDK division,
 * square-root, and angle routines but no hardware state is changed.
 */
s32 ActorMotion_ConfigureGridTarget(ActorMotion *self, s32 xIndex, s32 yIndex,
                  s32 divisor, s32 useDirectionTable)
{
    VecFx32Object destination;

    self->mode = 2;
    VecFx32Object_InitComponents(&destination,
                  self->target.value.x + (xIndex << 12),
                  self->target.value.y + ((yIndex + 20) << 12), 0);

    if (!useDirectionTable) {
        VecFx32Object displacement;

        VecFx32_Subtract(&displacement, &destination, &self->position);
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
        VecFx32Object_Destroy(&displacement);
    } else {
        s32 dx = destination.value.x - self->position.value.x;
        s32 dy = destination.value.y - self->position.value.y;
        u32 direction;

        self->field_2c =
            func_020adc90(func_020adc40(actor_motion_square_fx32(dx) +
                                        actor_motion_square_fx32(dy)),
                          divisor) >> 12;
        direction = VecFx32_GetDirectionAngle(&self->position, &destination) >> 4;
        self->field_1c =
            actor_motion_multiply_fx32(data_020c9670[direction * 2 + 1],
                                       divisor);
        self->field_20 =
            actor_motion_multiply_fx32(data_020c9670[direction * 2], divisor);
        self->field_24 = destination.value.x;
        self->field_28 = destination.value.y;
    }

    VecFx32Object_Destroy(&destination);
    return self->field_2c;
}
