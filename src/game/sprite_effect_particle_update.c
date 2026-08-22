/* Per-frame simulation for resident sprite effects. */

#include "tingle/sprite_effect.h"
#include "tingle/random.h"
#include "tingle/vec_fx32.h"

extern const s16 data_020c9670[];
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_020bf1f8(u32 value, s32 divisor);

#define MULTIPLY_FX_ROUNDED(left, right) \
    ((s32)(((s64)(left) * (s64)(right) + 0x800) >> 12))

/*
 * Advance emission and every active particle by one retail simulation tick.
 * The return value is nonzero while the emitter can still spawn or any
 * particle remains live; callers destroy the effect after it reaches zero.
 */
s32 func_020a3c78(SpriteEffectInstance *effect)
{
    VecFx32Object *positions = (VecFx32Object *)effect->positions08;
    VecFx32Object *velocities = (VecFx32Object *)effect->velocities0c;
    s32 alive = 0;
    s32 index;

    ++effect->field6e;
    if (effect->lifetime54 > 0) {
        alive = 1;
        if (effect->lifetime54 != 0x7fff)
            --effect->lifetime54;
        --effect->enabled6c;
        if (effect->enabled6c == 0) {
            func_020a3804(effect, 0);
            effect->enabled6c = (u16)(
                effect->start58 +
                func_020bf1f8(genrand_int32(), effect->startRange5a + 1));
        }
    }

    for (index = (s32)effect->count04 - 1; index >= 0; --index) {
        s32 factor;

        if (effect->active1c[index] <= 0)
            continue;
        alive = 1;
        --effect->active1c[index];

        velocities[index].value.y += (s16)effect->descriptor34;
        factor = effect->inverseAngleRange3a;
        velocities[index].value.x =
            MULTIPLY_FX_ROUNDED(velocities[index].value.x, factor);
        velocities[index].value.y =
            MULTIPLY_FX_ROUNDED(velocities[index].value.y, factor);
        velocities[index].value.z =
            MULTIPLY_FX_ROUNDED(velocities[index].value.z, factor);

        if (effect->flags44 == 1 &&
            positions[index].value.y + velocities[index].value.y > 0)
            velocities[index].value.y = -velocities[index].value.y;
        positions[index].value.x += velocities[index].value.x;
        positions[index].value.y += velocities[index].value.y;
        positions[index].value.z += velocities[index].value.z;

        if (effect->mode70 == 1) {
            u32 tableIndex;
            s32 scale;

            effect->field28[index] +=
                func_020befec(0x7918, effect->lifetimeRange56);
            tableIndex = ((u16)effect->field28[index] >> 4) * 2;
            scale = effect->scale36 +
                    ((effect->field6e & 1) * (effect->scale36 >> 1));
            effect->field18[index] = (s16)MULTIPLY_FX_ROUNDED(
                data_020c9670[tableIndex], scale);
        } else if (effect->mode70 == 3 || effect->mode70 == 7) {
            if (effect->distribution4b != 4) {
                effect->field28[index] += 0xa4;
            } else {
                effect->field28[index] = effect->active1c[index] * 0x199;
            }
            if (effect->field28[index] > 0x1000)
                effect->field28[index] = 0x1000;
        }

        effect->state10[index] =
            (s16)(effect->state10[index] + effect->values14[index]);
        if (effect->tiles49 != 0) {
            effect->field20[index] = (s16)(
                effect->tiles49 -
                func_020befec(
                    func_020befec(effect->active1c[index],
                                  effect->palettes4a),
                    effect->tiles49) -
                1);
        }
    }
    return alive;
}
