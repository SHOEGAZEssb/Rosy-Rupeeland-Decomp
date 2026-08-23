#ifndef TINGLE_SPRITE_EFFECT_H
#define TINGLE_SPRITE_EFFECT_H

#include "tingle/types.h"

enum {
    SPRITE_EFFECT_SLOT_COUNT = 30,
    SPRITE_EFFECT_INVALID_HANDLE = 0xff
};

typedef struct SpriteEffectBounds {
    s32 minimumX;
    s32 minimumZ;
    s32 maximumX;
    s32 maximumZ;
} SpriteEffectBounds;

typedef struct SpriteEffectConfig {
    s16 renderMode00;
    u16 particleCapacity02;
    SpriteEffectBounds spawnBounds04;
    s32 horizontalVelocityX14;
    s32 horizontalVelocityZ18;
    s32 verticalAcceleration1c;
    s32 verticalVelocityCenter20;
    s16 verticalVelocityRange24;
    s16 velocityDamping26;
    s16 emitterLifetime28;
    s16 particleLifetime2a;
    s16 emissionIntervalCenter2c;
    s16 emissionIntervalRange2e;
    s16 scaleCenter30;
    s16 scaleRange32;
    u16 bounceOnPositiveY34;
    u16 angularVelocityRange36;
    /* +0x38/+0x3a are initialized and carried into the instance, but the
     * complete resident effect family has no observed consumer. */
    u16 reservedHalfwordA;
    u16 reservedHalfwordB;
    u16 primitiveColor3c;
    u16 initialParticleCount3e;
    u8 distributionMode40;
    u8 textureResourceIndex41;
    u8 animationFrameCount42;
    u8 animationFrameDuration43;
} SpriteEffectConfig;

typedef struct SpriteEffectInstance {
    void *renderContext;
    u32 particleCapacity04;
    void *positions08;
    void *velocities0c;
    u16 *angles10;
    s32 *angularVelocities14;
    s16 *scales18;
    s16 *remainingParticleLifetimes1c;
    s16 *animationFrames20;
    u16 *grayscaleColors24;
    s32 *scaleAnimationState28;
    s32 minimumVerticalVelocity2c;
    s32 verticalVelocityRange30;
    s16 verticalAcceleration34;
    s16 minimumScale36;
    s16 scaleRange38;
    s16 velocityRetention3a;
    s32 horizontalVelocityX3c;
    s32 horizontalVelocityZ40;
    u16 bounceOnPositiveY44;
    u16 angularVelocityRange46;
    u8 textureResourceIndex48;
    u8 animationFrameCount49;
    u8 animationFrameDuration4a;
    u8 distributionMode4b;
    /* +0x4c/+0x4e preserve the two reserved configuration halfwords. */
    u16 copiedConfigHalfwordA;
    u16 copiedConfigHalfwordB;
    s16 vertexDepth50;
    u16 primitiveColor52;
    s16 remainingEmitterLifetime54;
    s16 particleLifetime56;
    s16 minimumEmissionInterval58;
    s16 emissionIntervalRange5a;
    SpriteEffectBounds spawnBounds5c;
    s16 emissionCountdown6c;
    s16 age6e;
    s16 renderMode70;
    /* +0x72 is initialized to zero but has no observed consumer. */
    u16 reservedInitializationValue;
} SpriteEffectInstance;

typedef struct SpriteEffectManager {
    void *renderContext;
    SpriteEffectInstance *effects[SPRITE_EFFECT_SLOT_COUNT];
    u32 renderSuppressed7c;
} SpriteEffectManager;

typedef char SpriteEffectBoundsSizeCheck[
    sizeof(SpriteEffectBounds) == 0x10 ? 1 : -1];
typedef char SpriteEffectConfigSizeCheck[
    sizeof(SpriteEffectConfig) == 0x44 ? 1 : -1];
typedef char SpriteEffectInstanceSizeCheck[
    sizeof(SpriteEffectInstance) == 0x74 ? 1 : -1];
typedef char SpriteEffectManagerSizeCheck[
    sizeof(SpriteEffectManager) == 0x80 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern const char gSpriteEffectManagerAllocationTag[];
extern const char gSpriteEffectParticleStorageAllocationTag[];
extern const char gSpriteEffectInstanceAllocationTag[];

void SpriteEffectConfig_InitDefaults(SpriteEffectConfig *config);
SpriteEffectManager *SpriteEffectManager_Init(SpriteEffectManager *manager,
                                              void *renderContext);
SpriteEffectManager *SpriteEffectManager_Destroy(SpriteEffectManager *manager);
void SpriteEffectManager_RemoveEffectAt(SpriteEffectManager *manager,
                                        u32 effectIndex);
void SpriteEffectManager_Clear(SpriteEffectManager *manager);
void SpriteEffectManager_SetAngularVelocityRange(SpriteEffectManager *manager,
                                                 u32 effectIndex,
                                                 u16 angularVelocityRange);
void SpriteEffectManager_SetParticleLifetime(SpriteEffectManager *manager,
                                             u32 effectIndex,
                                             s16 particleLifetime);
void SpriteEffectManager_SetMinimumEmissionInterval(
    SpriteEffectManager *manager, u32 effectIndex, s16 minimumInterval);
void SpriteEffectManager_SetVertexDepth(SpriteEffectManager *manager,
                                        u32 effectIndex, s16 vertexDepth);
void SpriteEffectManager_SetHorizontalVelocityXZ(SpriteEffectManager *manager,
                                                 u32 effectIndex,
                                                 s32 velocityX,
                                                 s32 velocityZ);
SpriteEffectInstance *SpriteEffectInstance_Init(
    SpriteEffectInstance *effect, void *renderContext,
    const SpriteEffectConfig *config);
SpriteEffectBounds *SpriteEffectBounds_Assign(
    SpriteEffectBounds *destination, const SpriteEffectBounds *source);
SpriteEffectInstance *SpriteEffectInstance_Destroy(
    SpriteEffectInstance *effect);
void SpriteEffectInstance_SpawnParticle(SpriteEffectInstance *effect,
                                        u32 emitterCount);
s32 SpriteEffectInstance_Update(SpriteEffectInstance *effect);
void SpriteEffectInstance_Render(SpriteEffectInstance *effect);
u32 SpriteEffectManager_CreatePresetEffect(SpriteEffectManager *manager,
                                           s32 presetKind,
                                           const SpriteEffectBounds *bounds,
                                           s32 presetParameter);
void SpriteEffectManager_Update(SpriteEffectManager *manager);
void SpriteEffectManager_Render(SpriteEffectManager *manager);

#ifdef __cplusplus
}
#endif

#endif
