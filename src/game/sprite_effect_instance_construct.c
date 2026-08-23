/* Resident sprite-effect instance construction and owned particle storage. */

#include "tingle/heap.h"
#include "tingle/sprite_effect.h"
#include "tingle/vec_fx32.h"

/*
 * Construct one caller-allocated resident sprite effect. The instance retains
 * the borrowed render context, copies the configuration, owns all nine arrays
 * it allocates, and may seed up to particleCapacity04 particles through the
 * canonical spawn routine. Allocation failure remains a null owned-array
 * pointer, matching retail behavior.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020c09cc(void *allocation, u32 count, u32 elementSize,
                           u32 headerSize, void *constructor,
                           void *destructor);
SpriteEffectInstance *SpriteEffectInstance_Init(
    SpriteEffectInstance *effect, void *renderContext,
    const SpriteEffectConfig *config)
{
    void *allocation;
    u32 count;
    s32 index;
    s32 range;

    effect->renderContext = renderContext;
    effect->age6e = 0;
    effect->emissionCountdown6c = 1;
    effect->reservedInitializationValue = 0;
    effect->particleCapacity04 = config->particleCapacity02;
    effect->renderMode70 = config->renderMode00;
    effect->distributionMode4b = config->distributionMode40;
    SpriteEffectBounds_Assign(&effect->spawnBounds5c,
                              &config->spawnBounds04);
    effect->remainingEmitterLifetime54 = config->emitterLifetime28;
    effect->particleLifetime56 = config->particleLifetime2a;
    range = config->emissionIntervalRange2e;
    effect->minimumEmissionInterval58 = config->emissionIntervalCenter2c -
                      ((range + (s32)((u32)range >> 31)) >> 1);
    effect->emissionIntervalRange5a = config->emissionIntervalRange2e;
    effect->verticalVelocityRange30 = config->verticalVelocityRange24;
    range = config->verticalVelocityRange24;
    effect->minimumVerticalVelocity2c = config->verticalVelocityCenter20 -
                             ((range + (s32)((u32)range >> 31)) >> 1);
    effect->verticalAcceleration34 = (s16)config->verticalAcceleration1c;
    effect->scaleRange38 = config->scaleRange32;
    range = config->scaleRange32;
    effect->minimumScale36 = config->scaleCenter30 -
                      ((range + (s32)((u32)range >> 31)) >> 1);
    effect->horizontalVelocityX3c = config->horizontalVelocityX14;
    effect->horizontalVelocityZ40 = config->horizontalVelocityZ18;
    effect->velocityRetention3a =
        (s16)(0x1000 - config->velocityDamping26);
    effect->bounceOnPositiveY44 = config->bounceOnPositiveY34;
    effect->angularVelocityRange46 = config->angularVelocityRange36;
    effect->textureResourceIndex48 = config->textureResourceIndex41;
    effect->animationFrameCount49 = config->animationFrameCount42;
    effect->animationFrameDuration4a = config->animationFrameDuration43;
    effect->copiedConfigHalfwordA = config->reservedHalfwordA;
    effect->copiedConfigHalfwordB = config->reservedHalfwordB;
    effect->vertexDepth50 = 0;
    effect->primitiveColor52 = config->primitiveColor3c;

    count = effect->particleCapacity04;
    allocation = func_02003e20(count * 0x10 + 8, gSpriteEffectParticleStorageAllocationTag, 4,
                               &gHeapContext);
    if (allocation != 0)
        allocation = func_020c09cc(allocation, count, 0x10, 8,
                                   (void *)VecFx32Object_Init,
                                   (void *)VecFx32Object_Destroy);
    effect->positions08 = allocation;

    allocation = func_02003e20(count * 0x10 + 8, gSpriteEffectParticleStorageAllocationTag, 4,
                               &gHeapContext);
    if (allocation != 0)
        allocation = func_020c09cc(allocation, count, 0x10, 8,
                                   (void *)VecFx32Object_Init,
                                   (void *)VecFx32Object_Destroy);
    effect->velocities0c = allocation;
    effect->angles10 = (u16 *)func_02003e20(count * 2, gSpriteEffectParticleStorageAllocationTag, 4,
                                           &gHeapContext);
    effect->angularVelocities14 = (s32 *)func_02003e20(count * 4, gSpriteEffectParticleStorageAllocationTag, 4,
                                            &gHeapContext);
    effect->scales18 = (s16 *)func_02003e20(count * 2, gSpriteEffectParticleStorageAllocationTag, 4,
                                           &gHeapContext);
    effect->remainingParticleLifetimes1c = (s16 *)func_02003e20(count * 2, gSpriteEffectParticleStorageAllocationTag, 4,
                                            &gHeapContext);
    effect->animationFrames20 = (s16 *)func_02003e20(count * 2, gSpriteEffectParticleStorageAllocationTag, 4,
                                           &gHeapContext);
    effect->grayscaleColors24 = (u16 *)func_02003e20(count * 2, gSpriteEffectParticleStorageAllocationTag, 4,
                                           &gHeapContext);
    effect->scaleAnimationState28 = (s32 *)func_02003e20(count * 4, gSpriteEffectParticleStorageAllocationTag, 4,
                                           &gHeapContext);

    for (index = (s32)effect->particleCapacity04 - 1; index >= 0; --index)
        effect->remainingParticleLifetimes1c[index] = 0;

    count = config->initialParticleCount3e;
    if (count != 0) {
        if (count > effect->particleCapacity04)
            count = effect->particleCapacity04;
        while (count-- != 0)
            SpriteEffectInstance_SpawnParticle(
                effect, config->initialParticleCount3e);
        if (effect->distributionMode4b == 2)
            effect->distributionMode4b = 1;
    }
    return effect;
}

#ifdef __cplusplus
}
#endif
