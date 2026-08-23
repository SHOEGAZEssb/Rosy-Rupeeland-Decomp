/* Scalar mutation helpers for occupied resident sprite-effect slots. */

#include "tingle/sprite_effect.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Replace the symmetric signed angular-velocity range for an occupied slot. */
void SpriteEffectManager_SetAngularVelocityRange(
    SpriteEffectManager *manager, u32 effectIndex, u16 angularVelocityRange)
{
    SpriteEffectInstance *effect = manager->effects[effectIndex];
    if (effect != 0)
        effect->angularVelocityRange46 = angularVelocityRange;
}

/* Replace the fixed lifetime assigned to subsequently spawned particles. */
void SpriteEffectManager_SetParticleLifetime(
    SpriteEffectManager *manager, u32 effectIndex, s16 particleLifetime)
{
    SpriteEffectInstance *effect = manager->effects[effectIndex];
    if (effect != 0)
        effect->particleLifetime56 = particleLifetime;
}

/* Replace the minimum interval between subsequent particle emissions. */
void SpriteEffectManager_SetMinimumEmissionInterval(
    SpriteEffectManager *manager, u32 effectIndex, s16 minimumInterval)
{
    SpriteEffectInstance *effect = manager->effects[effectIndex];
    if (effect != 0)
        effect->minimumEmissionInterval58 = minimumInterval;
}

/* Replace the signed immediate-renderer depth for an occupied slot. */
void SpriteEffectManager_SetVertexDepth(SpriteEffectManager *manager,
                                        u32 effectIndex, s16 vertexDepth)
{
    SpriteEffectInstance *effect = manager->effects[effectIndex];
    if (effect != 0)
        effect->vertexDepth50 = vertexDepth;
}

/* Replace the occupied slot's two Q12 horizontal emission velocities. */
void SpriteEffectManager_SetHorizontalVelocityXZ(
    SpriteEffectManager *manager, u32 effectIndex, s32 velocityX,
    s32 velocityZ)
{
    SpriteEffectInstance *effect = manager->effects[effectIndex];
    if (effect != 0) {
        effect->horizontalVelocityX3c = velocityX;
        effect->horizontalVelocityZ40 = velocityZ;
    }
}

#ifdef __cplusplus
}
#endif
