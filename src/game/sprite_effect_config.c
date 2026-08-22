#include "tingle/types.h"

/* Caller-owned configuration used to construct one resident sprite effect. */
typedef struct SpriteEffectConfig {
    s16 mode00;
    u16 count02;
    s32 bounds04[4];
    s32 velocity14;
    s32 velocity18;
    u32 descriptor1c;
    s32 acceleration20;
    s16 angle24;
    s16 angleRange26;
    s16 lifetime28;
    s16 lifetimeRange2a;
    s16 start2c;
    s16 startRange2e;
    s16 scale30;
    s16 scaleRange32;
    u16 flags34;
    u16 color36;
    u16 field38;
    u16 field3a;
    u16 alpha3c;
    u16 initialCount3e;
    u8 distribution40;
    u8 animation41;
    u8 tiles42;
    u8 palettes43;
} SpriteEffectConfig;

#ifdef __cplusplus
extern "C" {
#endif

/* Fill a caller-owned configuration with the retail defaults. */
void func_020a32e0(SpriteEffectConfig *config)
{
    config->mode00 = 0;
    config->count02 = 10;
    config->distribution40 = 0;
    config->descriptor1c = 0;
    config->lifetime28 = 100;
    config->lifetimeRange2a = 10;
    config->start2c = 1;
    config->startRange2e = 0;
    config->scale30 = 0x1000;
    config->scaleRange32 = 0;
    config->velocity14 = 0;
    config->velocity18 = 0;
    config->acceleration20 = 0;
    config->angle24 = 0;
    config->angleRange26 = 0;
    config->flags34 = 0;
    config->initialCount3e = 0;
    config->color36 = 0x190;
    config->animation41 = 0;
    config->tiles42 = 1;
    config->palettes43 = 1;
    config->field38 = 0;
    config->field3a = 0;
    config->alpha3c = 0x7fff;
}

#ifdef __cplusplus
}
#endif
