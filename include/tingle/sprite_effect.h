#ifndef TINGLE_SPRITE_EFFECT_H
#define TINGLE_SPRITE_EFFECT_H

#include "tingle/types.h"

enum { SPRITE_EFFECT_SLOT_COUNT = 30 };

typedef struct SpriteEffectBounds {
    s32 minimum_x;
    s32 minimum_y;
    s32 maximum_x;
    s32 maximum_y;
} SpriteEffectBounds;

typedef struct SpriteEffectConfig {
    s16 mode00;
    u16 count02;
    SpriteEffectBounds bounds04;
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

typedef struct SpriteEffectInstance {
    void *owner00;
    u32 count04;
    void *positions08;
    void *velocities0c;
    s16 *state10;
    s32 *values14;
    s16 *field18;
    s16 *active1c;
    s16 *field20;
    s16 *field24;
    s32 *field28;
    s32 acceleration2c;
    s32 angle30;
    u16 descriptor34;
    s16 scale36;
    s16 scaleRange38;
    s16 inverseAngleRange3a;
    s32 velocity3c;
    s32 velocity40;
    u16 flags44;
    u16 color46;
    u8 animation48;
    u8 tiles49;
    u8 palettes4a;
    u8 distribution4b;
    u16 field4c;
    u16 field4e;
    u16 field50;
    u16 alpha52;
    s16 lifetime54;
    s16 lifetimeRange56;
    s16 start58;
    s16 startRange5a;
    SpriteEffectBounds bounds5c;
    u16 enabled6c;
    u16 field6e;
    s16 mode70;
    u16 field72;
} SpriteEffectInstance;

typedef struct SpriteEffectManager {
    void *owner00;
    SpriteEffectInstance *slots04[SPRITE_EFFECT_SLOT_COUNT];
    u32 suppressRender7c;
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

void func_020a32e0(SpriteEffectConfig *config);
void func_020a338c(SpriteEffectManager *manager, s32 index);
void func_020a3418(SpriteEffectManager *manager, s32 index, u16 value);
void func_020a342c(SpriteEffectManager *manager, s32 index, u16 value);
void func_020a3440(SpriteEffectManager *manager, s32 index, u16 value);
void func_020a3454(SpriteEffectManager *manager, s32 index, u16 value);
void func_020a3468(SpriteEffectManager *manager, s32 index, s32 first,
                   s32 second);
SpriteEffectInstance *func_020a3480(SpriteEffectInstance *effect, void *owner,
                                    const SpriteEffectConfig *config);
void *func_020a376c(void *destination, const void *source);

#ifdef __cplusplus
}
#endif

#endif
