/* Default configuration state for resident sprite effects. */

#include "tingle/sprite_effect.h"

/* Fill a caller-owned configuration with the retail defaults. */
void SpriteEffectConfig_InitDefaults(SpriteEffectConfig *config)
{
    config->renderMode00 = 0;
    config->particleCapacity02 = 10;
    config->distributionMode40 = 0;
    config->verticalAcceleration1c = 0;
    config->emitterLifetime28 = 100;
    config->particleLifetime2a = 10;
    config->emissionIntervalCenter2c = 1;
    config->emissionIntervalRange2e = 0;
    config->scaleCenter30 = 0x1000;
    config->scaleRange32 = 0;
    config->horizontalVelocityX14 = 0;
    config->horizontalVelocityZ18 = 0;
    config->verticalVelocityCenter20 = 0;
    config->verticalVelocityRange24 = 0;
    config->velocityDamping26 = 0;
    config->bounceOnPositiveY34 = 0;
    config->initialParticleCount3e = 0;
    config->angularVelocityRange36 = 0x190;
    config->textureResourceIndex41 = 0;
    config->animationFrameCount42 = 1;
    config->animationFrameDuration43 = 1;
    config->reservedHalfwordA = 0;
    config->reservedHalfwordB = 0;
    config->primitiveColor3c = 0x7fff;
}
