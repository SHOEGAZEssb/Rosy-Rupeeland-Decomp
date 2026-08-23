/* Per-particle initialization for resident sprite effects. */

#include "tingle/sprite_effect.h"
#include "tingle/random.h"
#include "tingle/vec_fx32.h"

extern const s16 data_020c9670[];
extern s32 func_020befec(s32 numerator, s32 denominator);
extern u64 func_020bf1f8(u32 value, u32 divisor);

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
void SpriteEffectInstance_SpawnParticle(SpriteEffectInstance *effect,
                                        u32 emitterCount)
{
    VecFx32Object *positions = (VecFx32Object *)effect->positions08;
    VecFx32Object *velocities = (VecFx32Object *)effect->velocities0c;
    s32 width = effect->spawnBounds5c.maximumX -
                effect->spawnBounds5c.minimumX;
    s32 depth = effect->spawnBounds5c.maximumZ -
                effect->spawnBounds5c.minimumZ;
    s32 index;

    for (index = (s32)effect->particleCapacity04 - 1; index >= 0; --index) {
        s32 xFactor;
        s32 zFactor;
        s32 inverseX;
        u16 angle;

        if (effect->remainingParticleLifetimes1c[index] != 0)
            continue;

        xFactor = (s32)(genrand_int32() & 0xfff);
        zFactor = (s32)(genrand_int32() & 0xfff);
        if (effect->distributionMode4b == 1 ||
            effect->distributionMode4b == 3) {
            angle = (u16)genrand_int32();
            SpriteEffect_PolarFactors(angle,
                                      SpriteEffect_RandomClusterRadius(),
                                      &xFactor, &zFactor);
        } else if (effect->distributionMode4b == 2) {
            angle = (u16)func_020befec(index << 16, (s32)emitterCount);
            SpriteEffect_PolarFactors(
                angle, 0x708 + (s32)(genrand_int32() & 0xff),
                &xFactor, &zFactor);
        }

        positions[index].value.x =
            effect->spawnBounds5c.minimumX +
            MULTIPLY_FX_ROUNDED(width, xFactor);
        positions[index].value.y = 0;
        positions[index].value.z =
            effect->spawnBounds5c.minimumZ +
            MULTIPLY_FX_ROUNDED(depth, zFactor);

        inverseX = 0x1000 - xFactor;
        if (effect->distributionMode4b == 4) {
            velocities[index].value.x = effect->horizontalVelocityX3c;
            velocities[index].value.z = effect->horizontalVelocityZ40;
        } else {
            velocities[index].value.x = MULTIPLY_FX_ROUNDED(
                effect->horizontalVelocityX3c, xFactor - 0x800);
            velocities[index].value.z = MULTIPLY_FX_ROUNDED(
                effect->horizontalVelocityZ40, zFactor - 0x800);
        }
        velocities[index].value.y =
            effect->minimumVerticalVelocity2c +
            MULTIPLY_FX_ROUNDED(effect->verticalVelocityRange30,
                                (s32)(genrand_int32() & 0xfff));

        effect->scales18[index] = (s16)(
            effect->minimumScale36 +
            MULTIPLY_FX_ROUNDED(effect->scaleRange38,
                                (s32)(genrand_int32() & 0xfff)));
        if (effect->angularVelocityRange46 == 0) {
            effect->angles10[index] = 0;
        } else {
            effect->angles10[index] = (u16)genrand_int32();
        }
        effect->angularVelocities14[index] =
            (s32)(func_020bf1f8(
                      genrand_int32(), effect->angularVelocityRange46 * 2u) >>
                  32) -
            effect->angularVelocityRange46;

        effect->remainingParticleLifetimes1c[index] =
            effect->particleLifetime56;
        effect->animationFrames20[index] = 0;
        if (effect->renderMode70 == 2 || effect->renderMode70 == 6) {
            s32 channel =
                (MULTIPLY_FX_ROUNDED(inverseX + zFactor, 0xa000) +
                 0xb000) >>
                12;
            effect->grayscaleColors24[index] =
                (u16)(channel | (channel << 5) | (channel << 10));
        }
        effect->scaleAnimationState28[index] = 0;
        return;
    }
}
