#include "tingle/types.h"

/* Derive actor-relative volume and pan, then dispatch encoded sound requests. */
extern void *data_021052fc;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorMotionAreaFollower_GetPosition(void *state);
extern s32 SignedAbsoluteValueVariant(s32 value);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern s32 func_020adc40(s32 value);
extern void Sound_PlayEffectWithParameters(void *soundContext, u32 soundId, u32 variant,
                          s32 volume, s32 pan, s32 extra);
#ifdef __cplusplus
}
#endif

/*
 * Dispatch only when actor flag 4 at +0x10 is set or secondary attachment
 * +0x58 exists. Compute horizontal displacement from actor X +0x1c to global
 * reference X (manager+0x2fbc resolved through ActorMotionAreaFollower_GetPosition), subtracting
 * 0x80000, shifting by 12, and clamping to [-96,96]. Volume is 96-|pan|/3.
 * The encoded sound splits into id=value>>7 and variant=value&0x7f; extra is
 * forwarded unchanged. Returns no value; Sound_PlayEffectWithParameters affects sound hardware.
 */
void func_020349b8(void *self, u32 sound, s32 extra)
{
    u8 *actor = (u8 *)self;
    u8 *reference;
    s32 pan;
    s32 volume;

    if ((*(u32 *)(actor + 0x10) & 4) == 0 &&
        *(void **)(actor + 0x58) == 0) {
        return;
    }
    reference = (u8 *)ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
    pan = (*(s32 *)(actor + 0x1c) - *(s32 *)(reference + 4) - 0x80000) >> 12;
    if (pan < -96) pan = -96;
    if (pan > 96) pan = 96;
    volume = 96 - func_020adae4(SignedAbsoluteValueVariant(pan), 3);
    Sound_PlayEffectWithParameters(gSoundContext, sound >> 7, sound & 0x7f,
                  volume, pan, extra);
}

/*
 * Compute X/Y displacement from the same global reference, subtracting
 * 0x80000 from X and 0x74000 from Y before shifting by 12. Return without sound
 * when either component lies outside [-255,255]. Otherwise volume is
 * 96-(sqrt((x*x+y*y)<<12)>>12)/3 and pan is x/2 rounded toward zero. Split the
 * encoded sound and forward extra as in func_020349b8. Returns no value; the
 * final helper dispatches to sound hardware.
 */
void func_02034a60(void *self, u32 sound, s32 extra)
{
    u8 *actor = (u8 *)self;
    u8 *reference = (u8 *)ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
    s32 x = (*(s32 *)(actor + 0x1c) - *(s32 *)(reference + 4) - 0x80000) >> 12;
    s32 y;
    s32 distance;
    s32 volume;

    if (x < -255 || x > 255) return;
    reference = (u8 *)ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
    y = (*(s32 *)(actor + 0x20) - *(s32 *)(reference + 8) - 0x74000) >> 12;
    if (y < -255 || y > 255) return;

    distance = func_020adc40((x * x + y * y) << 12) >> 12;
    volume = 96 - func_020adae4(SignedAbsoluteValueVariant(distance), 3);
    Sound_PlayEffectWithParameters(gSoundContext, sound >> 7, sound & 0x7f,
                  volume, x / 2, extra);
}
