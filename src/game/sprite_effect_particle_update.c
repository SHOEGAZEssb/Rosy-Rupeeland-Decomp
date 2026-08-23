/* Per-frame simulation for resident sprite effects. */

#include "tingle/sprite_effect.h"
#include "tingle/random.h"
#include "tingle/vec_fx32.h"

extern const s16 data_020c9670[];
extern s32 func_020befec(s32 numerator, s32 denominator);
extern u64 func_020bf1f8(u32 value, u32 divisor);

#define MULTIPLY_FX_ROUNDED(left, right) \
    ((s32)(((s64)(left) * (s64)(right) + 0x800) >> 12))

/*
 * Advance emission and every active particle by one retail simulation tick.
 * The return value is nonzero while the emitter can still spawn or any
 * particle remains live; callers destroy the effect after it reaches zero.
 */
s32 SpriteEffectInstance_Update(SpriteEffectInstance *effect)
{
    VecFx32Object *positions = (VecFx32Object *)effect->positions08;
    VecFx32Object *velocities = (VecFx32Object *)effect->velocities0c;
    s32 alive = 0;
    s32 index;

    ++effect->age6e;
    if (effect->remainingEmitterLifetime54 > 0) {
        alive = 1;
        if (effect->remainingEmitterLifetime54 != 0x7fff)
            --effect->remainingEmitterLifetime54;
        --effect->emissionCountdown6c;
        if (effect->emissionCountdown6c == 0) {
            SpriteEffectInstance_SpawnParticle(effect, 0);
            effect->emissionCountdown6c = (s16)(
                effect->minimumEmissionInterval58 +
                (s32)(func_020bf1f8(
                          genrand_int32(),
                          (u32)effect->emissionIntervalRange5a + 1u) >>
                      32));
        }
    }

    for (index = (s32)effect->particleCapacity04 - 1; index >= 0; --index) {
        s32 factor;

        if (effect->remainingParticleLifetimes1c[index] <= 0)
            continue;
        alive = 1;
        --effect->remainingParticleLifetimes1c[index];

        velocities[index].value.y += (s16)effect->verticalAcceleration34;
        factor = effect->velocityRetention3a;
        velocities[index].value.x =
            MULTIPLY_FX_ROUNDED(velocities[index].value.x, factor);
        velocities[index].value.y =
            MULTIPLY_FX_ROUNDED(velocities[index].value.y, factor);
        velocities[index].value.z =
            MULTIPLY_FX_ROUNDED(velocities[index].value.z, factor);

        if (effect->bounceOnPositiveY44 == 1 &&
            positions[index].value.y + velocities[index].value.y > 0)
            velocities[index].value.y = -velocities[index].value.y;
        positions[index].value.x += velocities[index].value.x;
        positions[index].value.y += velocities[index].value.y;
        positions[index].value.z += velocities[index].value.z;

        if (effect->renderMode70 == 1) {
            u32 tableIndex;
            s32 scale;

            effect->scaleAnimationState28[index] +=
                func_020befec(0x7918, effect->particleLifetime56);
            tableIndex =
                ((u16)effect->scaleAnimationState28[index] >> 4) * 2;
            scale = effect->minimumScale36 +
                    ((effect->age6e % 2) *
                     (effect->minimumScale36 >> 1));
            effect->scales18[index] = (s16)MULTIPLY_FX_ROUNDED(
                data_020c9670[tableIndex], scale);
        } else if (effect->renderMode70 == 3 ||
                   effect->renderMode70 == 7) {
            if (effect->distributionMode4b != 4) {
                effect->scaleAnimationState28[index] += 0xa4;
            } else {
                effect->scaleAnimationState28[index] =
                    effect->remainingParticleLifetimes1c[index] * 0x199;
            }
            if (effect->scaleAnimationState28[index] > 0x1000)
                effect->scaleAnimationState28[index] = 0x1000;
        }

        effect->angles10[index] = (u16)(
            effect->angles10[index] + effect->angularVelocities14[index]);
        if (effect->animationFrameCount49 != 0) {
            s32 elapsedFrames = func_020befec(
                effect->remainingParticleLifetimes1c[index],
                effect->animationFrameDuration4a);

            effect->animationFrames20[index] = (s16)(
                effect->animationFrameCount49 -
                (elapsedFrames % effect->animationFrameCount49) -
                1);
        }
    }
    return alive;
}
