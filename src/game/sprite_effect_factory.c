/* Resident sprite-effect preset selection and slot allocation. */

#include "tingle/heap.h"
#include "tingle/sprite_effect.h"

extern s32 func_020befec(s32 numerator, s32 denominator);

/*
 * Configure and allocate the effect preset requested by the caller. The manager
 * owns the new 0x74-byte instance, bounds are copied into it by the canonical
 * constructor, and the fourth argument supplies the one preset-dependent
 * scalar. Returns the descending manager-slot index, or 0xff when full.
 * Unknown kinds preserve retail's no-allocation return of the free slot.
 */
u32 SpriteEffectManager_CreatePresetEffect(SpriteEffectManager *manager,
                                           s32 presetKind,
                                           const SpriteEffectBounds *bounds,
                                           s32 presetParameter)
{
    SpriteEffectConfig config;
    SpriteEffectInstance *effect;
    s32 slot;

    SpriteEffectConfig_InitDefaults(&config);
    for (slot = SPRITE_EFFECT_SLOT_COUNT - 1; slot >= 0; --slot) {
        if (manager->effects[slot] != 0)
            continue;

        switch (presetKind) {
        case 0:
            config.renderMode00 = 0;
            config.particleCapacity02 = 0x28;
            config.horizontalVelocityX14 = 0x5000;
            config.horizontalVelocityZ18 = 0x5000;
            config.verticalAcceleration1c = 0x4cd;
            config.verticalVelocityCenter20 = -0x6000;
            config.verticalVelocityRange24 = 0x3000;
            config.emitterLifetime28 = (s16)presetParameter;
            config.particleLifetime2a = 0x24;
            config.bounceOnPositiveY34 = 1;
            config.textureResourceIndex41 = 3;
            config.animationFrameCount42 = 5;
            config.animationFrameDuration43 = 3;
            break;

        case 1:
            config.renderMode00 = 1;
            config.particleCapacity02 = 6;
            config.emitterLifetime28 = 0x7fff;
            config.particleLifetime2a = 0x3c;
            config.emissionIntervalCenter2c = (s16)presetParameter;
            config.emissionIntervalRange2e = (s16)(presetParameter >> 1);
            config.scaleCenter30 = 0x800;
            config.scaleRange32 = 0x19a;
            config.angularVelocityRange36 = 0;
            break;

        case 2:
            config.renderMode00 = 1;
            config.particleCapacity02 = 6;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x3c;
            config.scaleCenter30 = 0x1800;
            config.angularVelocityRange36 = 0;
            break;

        case 3:
        case 4:
        case 5:
            config.renderMode00 = presetKind == 4 ? 8 : 0;
            config.particleCapacity02 = 8;
            config.verticalAcceleration1c = -0x11f;
            config.verticalVelocityRange24 = 0x4cd;
            config.emitterLifetime28 = 0x10;
            config.particleLifetime2a = 0x1e;
            config.emissionIntervalCenter2c = (s16)presetParameter;
            config.emissionIntervalRange2e = (s16)(presetParameter >> 1);
            config.scaleCenter30 = 0x14cd;
            config.scaleRange32 = 0x333;
            config.textureResourceIndex41 =
                presetKind == 3 ? 4 : (presetKind == 4 ? 0x11 : 0x12);
            config.animationFrameCount42 = 6;
            config.animationFrameDuration43 = 5;
            break;

        case 6:
        case 10:
            config.renderMode00 = 2;
            config.particleCapacity02 = 0x28;
            config.horizontalVelocityX14 = 0x6000;
            config.horizontalVelocityZ18 = 0x2000;
            config.verticalAcceleration1c = 0x11f;
            config.verticalVelocityCenter20 = -0x2000;
            config.verticalVelocityRange24 = 0x1800;
            config.velocityDamping26 = 0x11f;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x20;
            config.emissionIntervalCenter2c = 8;
            config.scaleCenter30 = 0x2000;
            config.scaleRange32 = 0xccd;
            config.bounceOnPositiveY34 = 1;
            config.initialParticleCount3e = 0x28;
            config.textureResourceIndex41 = presetKind == 6 ? 6 : 0x1a;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 4;
            break;

        case 7:
        case 9:
            /* Retail expresses these linear terms as rounded fx32 products. */
            config.renderMode00 = presetKind == 7 ? 4 : 0;
            config.horizontalVelocityX14 =
                (s32)(0x1000 + (s64)presetParameter * 0xf6);
            config.horizontalVelocityZ18 = config.horizontalVelocityX14;
            config.verticalAcceleration1c = 0x7b;
            config.verticalVelocityCenter20 =
                (s32)(-0x333 - (s64)presetParameter * 0x19a);
            config.velocityDamping26 = 0x7b;
            config.emitterLifetime28 = 6;
            config.particleLifetime2a = 0x28;
            config.emissionIntervalCenter2c = 2;
            config.scaleCenter30 =
                (s16)(0xccd + (s64)presetParameter * 0x171);
            config.scaleRange32 = 0x333;
            config.bounceOnPositiveY34 = 1;
            config.initialParticleCount3e = 7;
            config.distributionMode40 = 2;
            config.textureResourceIndex41 = presetKind == 7 ? 9 : 0x1e;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 5;
            break;

        case 8:
            config.renderMode00 = 4;
            config.particleCapacity02 = 5;
            config.horizontalVelocityX14 =
                (s32)(0x1666 + (s64)presetParameter * 0x19a);
            config.horizontalVelocityZ18 = 0;
            config.verticalAcceleration1c = 0x148;
            config.verticalVelocityCenter20 =
                (s32)(-0x1e66 - (s64)presetParameter * 0xf6);
            config.verticalVelocityRange24 = 0xb33;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x30;
            config.emissionIntervalCenter2c = 8;
            config.scaleCenter30 = 0x666;
            config.scaleRange32 = 0x19a;
            config.bounceOnPositiveY34 = 1;
            config.initialParticleCount3e = 5;
            config.textureResourceIndex41 = 9;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 6;
            break;

        case 11:
            config.renderMode00 = 2;
            config.particleCapacity02 = 0x28;
            config.horizontalVelocityX14 = 0x7000;
            config.horizontalVelocityZ18 = 0x2000;
            config.verticalAcceleration1c = -0xa4;
            config.velocityDamping26 = 0x11f;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x2a;
            config.scaleRange32 = 0x99a;
            config.initialParticleCount3e = 0x28;
            config.textureResourceIndex41 = 5;
            config.animationFrameCount42 = 7;
            config.animationFrameDuration43 = 6;
            break;

        case 12:
            config.renderMode00 = 2;
            config.particleCapacity02 = 1;
            config.verticalAcceleration1c = -0xa4;
            config.verticalVelocityRange24 = 0x19a;
            config.velocityDamping26 = 0x11f;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x1c;
            config.scaleRange32 = 0x19a;
            config.initialParticleCount3e = 1;
            config.textureResourceIndex41 = 5;
            config.animationFrameCount42 = 7;
            config.animationFrameDuration43 = 4;
            break;

        case 13:
            config.renderMode00 = 4;
            config.particleCapacity02 = 0x28;
            config.horizontalVelocityX14 = 0x7000;
            config.horizontalVelocityZ18 = 0x2000;
            config.verticalAcceleration1c = -0xa4;
            config.velocityDamping26 = 0x11f;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x30;
            config.scaleRange32 = 0x99a;
            config.initialParticleCount3e = 0x28;
            config.textureResourceIndex41 = 9;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 6;
            break;

        case 14:
        case 15:
        case 16:
        case 18:
        case 19:
            config.renderMode00 = 4;
            config.particleCapacity02 =
                (u16)(func_020befec(presetParameter, 0x2b2) + 5);
            config.horizontalVelocityX14 = presetParameter;
            config.horizontalVelocityZ18 = presetParameter;
            config.verticalAcceleration1c = -0xa4;
            config.velocityDamping26 = 0x11f;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x30;
            config.scaleRange32 = 0x99a;
            config.initialParticleCount3e = (u16)(config.particleCapacity02 & 0xff);
            config.distributionMode40 = 1;
            if (presetKind == 14)
                config.textureResourceIndex41 = 9;
            else if (presetKind == 15)
                config.textureResourceIndex41 = 0x13;
            else if (presetKind == 16)
                config.textureResourceIndex41 = 0x14;
            else if (presetKind == 18)
                config.textureResourceIndex41 = 0x16;
            else
                config.textureResourceIndex41 = 0x0a;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 6;
            break;

        case 17:
            config.particleCapacity02 =
                (u16)(func_020befec(presetParameter, 0x2b2) + 5);
            config.horizontalVelocityX14 = presetParameter;
            config.horizontalVelocityZ18 = presetParameter;
            config.verticalAcceleration1c = -0xa4;
            config.velocityDamping26 = 0x11f;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x31;
            config.scaleRange32 = 0x99a;
            config.initialParticleCount3e = (u16)(config.particleCapacity02 & 0xff);
            config.distributionMode40 = 1;
            config.textureResourceIndex41 = 5;
            config.animationFrameCount42 = 7;
            config.animationFrameDuration43 = 7;
            break;

        case 20:
            config.particleCapacity02 = 1;
            config.horizontalVelocityX14 = 0x800;
            config.horizontalVelocityZ18 = 0x800;
            config.verticalAcceleration1c = 0x19a;
            config.verticalVelocityCenter20 = -0x800;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 9;
            config.scaleCenter30 = (s16)presetParameter;
            config.textureResourceIndex41 = 7;
            config.animationFrameCount42 = 3;
            config.animationFrameDuration43 = 3;
            break;

        case 21:
            config.particleCapacity02 = 1;
            config.verticalAcceleration1c = 0x19a;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x18;
            config.scaleCenter30 = (s16)presetParameter;
            config.textureResourceIndex41 = 8;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 3;
            break;

        case 22:
        case 23:
        case 24:
            config.renderMode00 = 3;
            config.particleCapacity02 = 1;
            config.emitterLifetime28 = 2;
            config.particleLifetime2a = (s16)presetParameter;
            config.distributionMode40 = 4;
            config.textureResourceIndex41 =
                presetKind == 22 ? 0x17 :
                (presetKind == 23 ? 0x19 : 0x18);
            config.animationFrameCount42 = 3;
            config.animationFrameDuration43 = 3;
            break;

        case 25:
            config.renderMode00 = 3;
            config.particleCapacity02 = 1;
            config.horizontalVelocityX14 = 0x19a;
            config.horizontalVelocityZ18 = 0x19a;
            config.verticalVelocityCenter20 = -0xb33;
            config.verticalVelocityRange24 = 0x19a;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = (s16)presetParameter;
            config.emissionIntervalCenter2c = 0x14;
            config.emissionIntervalRange2e = 5;
            config.scaleCenter30 = 0xe66;
            config.scaleRange32 = 0x800;
            config.textureResourceIndex41 = 0x0b;
            config.animationFrameCount42 = 3;
            config.animationFrameDuration43 = 6;
            break;

        case 26:
        case 27:
            config.renderMode00 = 3;
            config.particleCapacity02 = presetKind == 26 ? 1 : 7;
            config.horizontalVelocityX14 = 0x19a;
            config.horizontalVelocityZ18 = 0x19a;
            config.verticalVelocityCenter20 = -0x1000;
            config.verticalVelocityRange24 = 0x19a;
            config.emitterLifetime28 = presetKind == 26 ? 1 : 0x78;
            config.particleLifetime2a = (s16)presetParameter;
            config.emissionIntervalCenter2c = 0x14;
            config.emissionIntervalRange2e = 5;
            config.scaleCenter30 = 0xccd;
            config.scaleRange32 = 0x666;
            config.textureResourceIndex41 = 0x0c;
            config.animationFrameCount42 = 3;
            config.animationFrameDuration43 = 6;
            break;

        case 28:
            config.renderMode00 = 4;
            config.particleCapacity02 = 1;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x30;
            config.emissionIntervalCenter2c = 0x14;
            config.scaleCenter30 = 0x119a;
            config.scaleRange32 = 0x333;
            config.angularVelocityRange36 = 0;
            config.textureResourceIndex41 = 0x0d;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 6;
            break;

        case 29:
            config.renderMode00 = 4;
            config.particleCapacity02 = 1;
            config.horizontalVelocityX14 = 0x4cd;
            config.horizontalVelocityZ18 = 0x19a;
            config.verticalAcceleration1c = -0x19;
            config.verticalVelocityCenter20 = -0x4cd;
            config.verticalVelocityRange24 = 0x19a;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x28;
            config.emissionIntervalCenter2c = 0;
            config.scaleCenter30 = 0x14cd;
            config.scaleRange32 = 0x4cd;
            config.textureResourceIndex41 = 0x0e;
            config.animationFrameCount42 = 4;
            config.animationFrameDuration43 = 0x0a;
            break;

        case 30:
            config.renderMode00 = 9;
            config.particleCapacity02 = 1;
            config.horizontalVelocityX14 = 0x2000;
            config.verticalAcceleration1c = 0x2b8;
            config.verticalVelocityCenter20 = 0x52;
            config.verticalVelocityRange24 = 0x333;
            config.velocityDamping26 = 0x39;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x14;
            config.angularVelocityRange36 = 0;
            config.primitiveColor3c = (u16)presetParameter;
            break;

        case 31:
            config.renderMode00 = 10;
            config.particleCapacity02 = 1;
            config.verticalAcceleration1c = -0x19a;
            config.verticalVelocityCenter20 = -0x800;
            config.verticalVelocityRange24 = 0x1000;
            config.velocityDamping26 = 0x39;
            config.emitterLifetime28 = 1;
            config.angularVelocityRange36 = 0;
            break;

        case 32:
            config.particleCapacity02 = 0x32;
            config.horizontalVelocityX14 = func_020befec(
                bounds->maximumX - bounds->minimumX, -0x30);
            config.horizontalVelocityZ18 = func_020befec(
                bounds->maximumZ - bounds->minimumZ, -0x30);
            config.verticalAcceleration1c = 0xa4;
            config.verticalVelocityCenter20 = -0x1333;
            config.verticalVelocityRange24 = 0xcd;
            config.velocityDamping26 = 0x14;
            config.emitterLifetime28 = 1;
            config.particleLifetime2a = 0x30;
            config.scaleRange32 = 0xb33;
            config.angularVelocityRange36 = 0;
            config.initialParticleCount3e = 0x32;
            config.distributionMode40 = 3;
            config.textureResourceIndex41 = 0x15;
            config.animationFrameCount42 = 8;
            config.animationFrameDuration43 = 6;
            break;

        default:
            return (u8)slot;
        }

        SpriteEffectBounds_Assign(&config.spawnBounds04, bounds);
        effect = (SpriteEffectInstance *)Heap_Alloc(
            sizeof(SpriteEffectInstance), gSpriteEffectInstanceAllocationTag, 4, &gHeapContext);
        if (effect != 0)
            effect = SpriteEffectInstance_Init(effect, manager->renderContext, &config);
        manager->effects[slot] = effect;
        return (u8)slot;
    }
    return SPRITE_EFFECT_INVALID_HANDLE;
}
