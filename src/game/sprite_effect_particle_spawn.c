/* Per-particle initialization for resident sprite effects. */

#include "tingle/sprite_effect.h"
#include "tingle/random.h"
#include "tingle/vec_fx32.h"

extern const s16 data_020c9670[];
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_020bf1f8(u32 value, s32 divisor);

#define MULTIPLY_FX_ROUNDED(left, right) \
    ((s32)(((s64)(left) * (s64)(right) + 0x800) >> 12))

/*
 * Convert a random angle and radial magnitude into the two Q12 interpolation
 * factors used for X/Z placement. The sine table stores cosine/sine pairs at
 * 16 angle units per entry; factors are centered at 0x800.
 */
static void SpriteEffect_PolarFactors(u16 angle, s32 radius, s32 *xFactor,
                                      s32 *zFactor)
{
    u32 tableIndex = ((u32)angle >> 4) * 2;

    if (radius > 0x800)
        radius = 0x800;
    *xFactor = MULTIPLY_FX_ROUNDED(data_020c9670[tableIndex + 1], radius) +
               0x800;
    *zFactor = MULTIPLY_FX_ROUNDED(data_020c9670[tableIndex], radius) + 0x800;
}

/* Three cosine samples reproduce the retail clustered radial distribution. */
static s32 SpriteEffect_RandomClusterRadius(void)
{
    s32 radius = 10;
    s32 sample;

    for (sample = 0; sample < 3; ++sample) {
        u32 angle = genrand_int32() & 0x3fff;
        radius += data_020c9670[(angle >> 4) * 2] >> 2;
    }
    return radius;
}

/*
 * Activate the highest-index free particle and initialize its position,
 * velocity, scale, random color state, lifetime counters, and optional packed
 * grayscale color. The caller supplies the emitter count used by the evenly
 * distributed radial mode. A full effect is left unchanged.
 */
void func_020a3804(SpriteEffectInstance *effect, u32 count)
{
    VecFx32Object *positions = (VecFx32Object *)effect->positions08;
    VecFx32Object *velocities = (VecFx32Object *)effect->velocities0c;
    s32 width = effect->bounds5c.maximum_x - effect->bounds5c.minimum_x;
    s32 height = effect->bounds5c.maximum_y - effect->bounds5c.minimum_y;
    s32 index;

    for (index = (s32)effect->count04 - 1; index >= 0; --index) {
        s32 xFactor;
        s32 zFactor;
        s32 inverseX;
        u16 angle;

        if (effect->active1c[index] != 0)
            continue;

        xFactor = (s32)(genrand_int32() & 0xfff);
        zFactor = (s32)(genrand_int32() & 0xfff);
        if (effect->distribution4b == 1 || effect->distribution4b == 3) {
            angle = (u16)genrand_int32();
            SpriteEffect_PolarFactors(angle,
                                      SpriteEffect_RandomClusterRadius(),
                                      &xFactor, &zFactor);
        } else if (effect->distribution4b == 2) {
            angle = (u16)func_020befec(index << 16, (s32)count);
            SpriteEffect_PolarFactors(
                angle, 0x708 + (s32)(genrand_int32() & 0xff),
                &xFactor, &zFactor);
        }

        positions[index].value.x =
            effect->bounds5c.minimum_x +
            MULTIPLY_FX_ROUNDED(width, xFactor);
        positions[index].value.y = 0;
        positions[index].value.z =
            effect->bounds5c.minimum_y +
            MULTIPLY_FX_ROUNDED(height, zFactor);

        inverseX = 0x1000 - xFactor;
        if (effect->distribution4b == 4) {
            velocities[index].value.x = effect->velocity3c;
            velocities[index].value.z = effect->velocity40;
        } else {
            velocities[index].value.x = MULTIPLY_FX_ROUNDED(
                effect->velocity3c, xFactor - 0x800);
            velocities[index].value.z = MULTIPLY_FX_ROUNDED(
                effect->velocity40, zFactor - 0x800);
        }
        velocities[index].value.y =
            effect->acceleration2c +
            MULTIPLY_FX_ROUNDED(effect->angle30,
                                (s32)(genrand_int32() & 0xfff));

        effect->field18[index] = (s16)(
            effect->scale36 +
            MULTIPLY_FX_ROUNDED(effect->scaleRange38,
                                (s32)(genrand_int32() & 0xfff)));
        if (effect->color46 == 0) {
            effect->state10[index] = 0;
        } else {
            effect->state10[index] = (s16)(u16)genrand_int32();
            effect->values14[index] =
                func_020bf1f8(genrand_int32(), effect->color46 * 2) -
                effect->color46;
        }

        effect->active1c[index] = effect->lifetimeRange56;
        effect->field20[index] = 0;
        if (effect->mode70 == 2 || effect->mode70 == 6) {
            s32 channel =
                (MULTIPLY_FX_ROUNDED(inverseX + zFactor, 0xa000) +
                 0xb000) >>
                12;
            effect->field24[index] =
                (s16)(channel | (channel << 5) | (channel << 10));
        }
        effect->field28[index] = 0;
        return;
    }
}
