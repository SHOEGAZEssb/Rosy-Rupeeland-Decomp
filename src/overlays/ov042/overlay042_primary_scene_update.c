#include "tingle/types.h"

/*
 * Overlay 42 primary scene update. This recovered frame controller coordinates
 * the central actor, five variant actors, collision damage, animation sprites,
 * sound parameters, screen brightness, and the encounter's closing sequence.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gSoundContext;
extern "C" s16 data_020c9670[];
extern "C" s32 data_ov042_0220b190[];
extern "C" u8 data_020f4dc8[];
extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 value, s32 modulus);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_0205940c(void *sound, s32 sequence, s32 value);
extern "C" void func_020594bc(void *sound, s32 sequence, s32 parameter, s32 value);
extern "C" void func_020594d4(void *sound, s32 sequence, s32 parameter, s32 value);
extern "C" void func_0205946c(void *sound, s32 sequence, s32 parameter, s32 value);
extern "C" void func_020595b0(void *sound, s32 sequence, s32 value);
extern "C" void func_0205929c(void *sound, s32 sequence, s32 value);
extern "C" void func_0205958c(void *sound, s32 value);
extern "C" void func_020a1ec0(void *owner, u32 effect);
extern "C" void func_020a1e10(void *owner);
extern "C" void func_020a1e50(void *owner);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, s32 index);
extern "C" void func_020a1794(void *owner, const void *position, const void *display, s32 arg);
extern "C" void VecFx32Object_Assign(void *destination, const void *source);
extern "C" void *DisplayBrightnessPair_GetScreen(void *controller, s32 screen);
extern "C" void DisplayBrightness_StartTransition(void *brightness, s32 start, s32 end, s32 duration);
extern "C" s32 DisplayBrightness_GetCurrent(void *brightness);
extern "C" void func_ov042_02205d80(void *scene);
extern "C" void func_ov042_0220549c(void *pool);
extern "C" void func_ov042_02209cd8(void *object);
extern "C" void func_ov042_02209cbc(void *object);
extern "C" void func_ov042_021fdd48(void *effects, s32 arg, const void *position);
extern "C" void func_ov042_021fcf80(void *vector);
extern "C" void func_ov042_021fe1c4(void *effects, const void *position);
extern "C" void func_ov042_021fe098(void *effects, const void *position);
extern "C" void func_ov042_021fdeac(void *effects, s32 side, const void *position);
extern "C" void func_ov042_021fea78(void *effects);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 category, s32 *extra);
extern "C" void func_ov042_02205180(void *pool);
extern "C" void func_ov042_02206ff8(void *scene, s32 variant);
extern "C" void func_ov042_022008f8(void *scene);
extern "C" void func_ov042_022009a0(void *scene, const void *position,
                                     s32 strength, s32 period);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);

/* Return the animation object stored behind a scene display wrapper. */
static void *animation_of(void *display)
{
    return FIELD(void *, display, 0xc);
}

/* Apply the same signed scale to both halfword scale fields of a display. */
static void set_display_scale(void *display, s32 scale)
{
    FIELD(s16, display, 0x3c) = (s16)scale;
    FIELD(s16, display, 0x3e) = (s16)scale;
}

/* Toggle bit two of the display visibility/control halfword at +0x42. */
static void set_display_bit4(void *display, s32 enabled)
{
    u16 value = FIELD(u16, display, 0x42);
    FIELD(u16, display, 0x42) = enabled ? (value | 4) : (value & ~4);
}

/* Return a uniformly distributed signed displacement in [-halfRange, halfRange). */
static s32 random_offset(s32 range, s32 halfRange)
{
    return func_020bf1f8(genrand_int32(), range) - halfRange;
}

/*
 * Update one frame of the primary encounter scene. The scene pointer owns all
 * state. The function may spawn effects, change animations and visibility,
 * update sound channels and both-screen brightness, apply collision damage,
 * advance finale counters, move display objects, and perturb the main actor.
 * It has no return value. Offset meanings not established by neighbouring
 * routines retain their address-derived form below.
 */
extern "C" void func_ov042_02207114(void *scene)
{
    void *owner = FIELD(void *, scene, 0x48);
    void *primaryDisplay = FIELD(void *, scene, 0x4c);
    void *secondaryDisplay = FIELD(void *, scene, 0x50);
    void *shadowDisplay = FIELD(void *, scene, 0x54);

    if (FIELD(s32, scene, 0x1bc) == 0 && FIELD(s32, scene, 0x1c4) == 0 &&
        FIELD(s32, scene, 0x1b0) == 0)
        func_ov042_02205d80(scene);

    /* +0x224 is a one-frame sound-ramp request; +0x228 retains its decay. */
    s32 request = FIELD(s32, scene, 0x224);
    if (request >= 0) {
        FIELD(s32, scene, 0x228) = request;
    } else if ((FIELD(s32, scene, 0x228) -= 0x4c) < 0) {
        func_0205940c(gSoundContext, 0x16a, 6);
        func_0205940c(gSoundContext, 0x16a, 11);
        func_0205940c(gSoundContext, 0x16a, 10);
    }
    FIELD(s32, scene, 0x224) = -1;
    if (FIELD(s32, scene, 0x228) >= 0) {
        s32 ramp = FIELD(s32, scene, 0x228);
        func_020594bc(gSoundContext, 0x16a, 6, (ramp * 0xff000 + 0x800) >> 24);
        func_020594d4(gSoundContext, 0x16a, 6,
                     ((ramp * 0xef000 + 0x800) >> 24) + 0x10);
        func_0205946c(gSoundContext, 0x16a, 6,
                     (ramp * 0xc00000 + 0x800) >> 24);
    }

    func_ov042_0220549c(FIELD(void *, scene, 0xa0));
    for (s32 i = 4; i >= 0; --i)
        func_ov042_02209cd8(FIELD(void *, scene, 0x8c + i * 4));

    if (FIELD(s32, scene, 0x1f0) == 1) {
        FIELD(s32, scene, 0x1f8) += 0xa000;
        func_ov042_021fdd48(FIELD(void *, owner, 0x14), 0,
                            (u8 *)scene + 0x1f4);
    }

    /* +0x1b0 is the short hit-flash/damage presentation. */
    if (FIELD(s32, scene, 0x1b0) != 0) {
        s32 tick = FIELD(s32, scene, 0x1b0);
        s32 phase = func_020befec(tick, 60) * 70 + 46;
        s32 wave = func_020befec(func_020befec(tick, 60) * 5, 3);
        if (wave > 70)
            wave = 70;
        s32 index = ((((phase + wave) << 22) >> 16) >> 4) * 2 + 1;
        set_display_bit4(primaryDisplay, 0);
        s32 scale = 0x100 - (data_020c9670[index] >> 4);
        set_display_scale(primaryDisplay, scale);
        FIELD(u16, animation_of(primaryDisplay), 0x30) = 0;
        if (++FIELD(s32, scene, 0x1b0) > 180) {
            GraphicsSpriteState_SetAnimationIndex(animation_of(primaryDisplay), 0);
            FIELD(s32, scene, 0x1b0) = 0;
            set_display_scale(primaryDisplay, 0x100);
            FIELD(s32, scene, 0xac) += 0x1e000;
            func_020a1e10(owner);
        }
        FIELD(s32, FIELD(void *, owner, 0xc), 0x240) = 2;
        goto common_update;
    }

    /* +0x1c4 expands random impact effects, then fades the primary display. */
    if (FIELD(s32, scene, 0x1c4) != 0) {
        s32 tick = ++FIELD(s32, scene, 0x1c4);
        if (tick < 60) {
            if (tick & 1) {
                s32 position[3];
                func_ov042_021fcf80(position);
                position[1] = FIELD(s32, scene, 0xa8) + random_offset(140, 70) * 0x1000;
                position[2] = FIELD(s32, scene, 0xac) + random_offset(140, 120) * 0x1000;
                func_ov042_021fe1c4(FIELD(void *, owner, 0x14), position);
            }
            if (tick < 30 && (tick & 3) == 1) {
                s32 position[3];
                func_ov042_021fcf80(position);
                position[1] = FIELD(s32, scene, 0xa8) + random_offset(140, 70) * 0x1000;
                position[2] = FIELD(s32, scene, 0xac) + random_offset(140, 120) * 0x1000;
                func_ov042_021fe098(FIELD(void *, owner, 0x14), position);
            }
        } else {
            if (tick == 60) {
                func_020a1ec0(owner, 0xb501);
                FIELD(s32, scene, 0xe8) = 1;
            }
            s32 fadeTick = tick - 60;
            s32 phase = (fadeTick * 200) & 0xffff;
            s32 scale = 0x100 - (data_020c9670[(phase >> 4) * 2] >> 4);
            if (scale < 0x10) {
                scale = 0x10;
                set_display_bit4(primaryDisplay, 1);
                if (FIELD(s32, scene, 0x1bc) != 0) {
                    FIELD(s32, scene, 0x1c4) = 0;
                } else if (FIELD(u8, animation_of(primaryDisplay), 0x38) != 9) {
                    GraphicsSpriteState_SetAnimationIndex(animation_of(primaryDisplay), 9);
                    FIELD(u16, animation_of(primaryDisplay), 0x30) = 0;
                    func_020a1ec0(owner, 0xb486);
                }
            } else {
                set_display_bit4(primaryDisplay, 0);
                if (fadeTick < 81)
                    func_ov042_021ff2f8((u8 *)scene + 0xa4, (u8 *)scene + 0xb0);
            }
            if (FIELD(u8, animation_of(primaryDisplay), 0x38) != 9)
                FIELD(u16, animation_of(primaryDisplay), 0x30) = (u16)(fadeTick * 0x578);
            if (scale > 0x100) {
                scale = 0x100;
                FIELD(s32, scene, 0x1c4) = 0;
                FIELD(s32, scene, 0x20c) = 0;
                GraphicsSpriteState_SetAnimationIndex(animation_of(primaryDisplay), 0);
                FIELD(s32, scene, 0xbc) = FIELD(s32, scene, 0xc0) = 0;
            }
            set_display_scale(primaryDisplay, scale);
        }
        goto common_update;
    }

    if (FIELD(s32, scene, 0x1bc) == 0) {
        s32 query[3];
        s32 extra = 0;
        func_ov042_02203658(query, (u8 *)scene + 0xa4);
        s32 damage = func_ov071_02211a10(
            FIELD(void *, FIELD(void *, owner, 8), 0xe8), query, 0x3c000, 4, &extra);
        if (FIELD(s32, scene, 0x20c) < 0)
            damage = 1000;
        if (damage > 0) {
            FIELD(s32, scene, 0xe0) -= damage;
            if (FIELD(s32, scene, 0xe0) <= 0) {
                FIELD(s32, scene, 0xe0) = 0;
                FIELD(s32, scene, 0x1c0) = FIELD(s32, scene, 0x1bc) = 1;
                func_020595b0(gSoundContext, 0, 60);
                const s32 channels[5] = {0xa4, 0xa5, 0xcd, 0xea, 0xf0};
                for (s32 i = 0; i < 5; ++i)
                    func_0205929c(gSoundContext, channels[i], 0);
                func_020a1ec0(owner, 0xb500);
                FIELD(s32, scene, 0x1c4) = FIELD(s32, scene, 0x20c) = 0;
                func_ov042_02205180(FIELD(void *, scene, 0xa0));
                for (s32 i = 4; i >= 0; --i)
                    func_ov042_02209cbc(FIELD(void *, scene, 0x8c + i * 4));
                set_display_bit4(shadowDisplay, 1);
            } else if (FIELD(s32, scene, 0x20c) < 0) {
                FIELD(s32, scene, 0x1c4) = 1;
                FIELD(s32, scene, 0x20c) = 0;
                func_020a1ec0(owner, 0xb500);
            } else if (FIELD(s32, scene, 0xd0) == 0 &&
                       FIELD(u8, animation_of(primaryDisplay), 0x38) == 0) {
                GraphicsSpriteState_SetAnimationIndex(animation_of(primaryDisplay), 1);
                FIELD(u16, animation_of(primaryDisplay), 0x24) &= ~2;
            }
        }

        s32 band = 2 - func_020befec(FIELD(s32, scene, 0xe0), 1000);
        if (band > 2)
            band = 2;
        s32 variant = data_ov042_0220b190[band];
        if (FIELD(s32, scene, 0xc4) != variant)
            func_ov042_02206ff8(scene, variant);
        FIELD(s32, scene, 0xc4) = variant;
        FIELD(s32, scene, 0x150) = band;
        if (FIELD(s32, scene, 0x1c4) != 0 || FIELD(s32, scene, 0x1bc) != 0) {
            FIELD(s32, scene, 0x158) = 0;
            FIELD(s32, scene, 0x15c) = -0xa0000;
            FIELD(s32, scene, 0xb4) = func_020adc90(-FIELD(s32, scene, 0xa8), 0x50000);
            FIELD(s32, scene, 0xb8) = func_020adc90(-0xa0000 - FIELD(s32, scene, 0xac), 0x50000);
            GraphicsSpriteState_SetAnimationIndex(animation_of(primaryDisplay), FIELD(s32, scene, 0x1bc) ? 17 : 8);
            set_display_bit4(secondaryDisplay, 1);
        }
        FIELD(s32, scene, 0xe8) = 90;
    } else {
        /* Finale: center the actor, drive a dual-screen fade, then swap displays. */
        s32 tick = ++FIELD(s32, scene, 0x1bc);
        if (tick < 120) {
            s32 x = FIELD(s32, scene, 0xa8);
            if (x > 0x2000) x -= 0x1000;
            if (x < -0x2000) x += 0x1000;
            FIELD(s32, scene, 0xa8) = x;
            s32 y = FIELD(s32, scene, 0xac);
            if (y > -0x4e000) y -= 0x1000;
            if (y < -0x52000) y += 0x1000;
            FIELD(s32, scene, 0xac) = y;
        }
        if (tick == 120) {
            FIELD(s32, scene, 0x24c) = 1;
            FIELD(s32, owner, 0x1ec) = 1;
        }
        if (tick == 210) {
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 0), 0, 16, 17);
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 1), 0, 16, 17);
            func_0205929c(gSoundContext, 0x16, 0);
        }
        if (tick > 210 && tick < 234 &&
            DisplayBrightness_GetCurrent(DisplayBrightnessPair_GetScreen(data_020f4dc8, 0)) == 16 &&
            DisplayBrightness_GetCurrent(DisplayBrightnessPair_GetScreen(data_020f4dc8, 1)) == 16) {
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 0), 16, 0, 16);
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 1), 16, 0, 16);
            FIELD(s32, scene, 0x24c) = FIELD(s32, scene, 0x1c0) = 0;
            FIELD(s32, scene, 0x1bc) = 234;
            FIELD(s32, scene, 0xac) -= 0x20000;
            func_020a1e50(owner);
            func_ov042_02206ff8(scene, -1);
            set_display_scale(secondaryDisplay, 0x100);
        }
        tick = FIELD(s32, scene, 0x1bc);
        if (tick > 234 && tick < 746) {
            s32 scale = 0x170 - (tick - 6);
            if (scale > 0x100) scale = 0x100;
            if (scale < 0x20) {
                FIELD(s32, scene, 0x1bc) = 746;
                scale = 0x100;
                set_display_bit4(primaryDisplay, 1);
                set_display_bit4(secondaryDisplay, 0);
                FIELD(u16, animation_of(secondaryDisplay), 0x24) &= ~2;
                FIELD(s32, secondaryDisplay, 0x30) = FIELD(s32, primaryDisplay, 0x30);
                FIELD(s32, secondaryDisplay, 0x34) = FIELD(s32, primaryDisplay, 0x34) - 0x5000;
            }
            set_display_scale(primaryDisplay, scale);
        }
        if (FIELD(s32, scene, 0x1bc) > 746 &&
            (FIELD(u16, animation_of(secondaryDisplay), 0x24) & 1)) {
            func_ov042_022008f8(scene);
            func_0205958c(gSoundContext, 25);
            for (s32 i = 2; i >= 0; --i) {
                void *display = FIELD(void *, scene, 0x4c + i * 4);
                set_display_bit4(display, 1);
                FIELD(u16, animation_of(display), 0x24) |= 4;
            }
            func_ov042_021fea78(FIELD(void *, owner, 0x14));
        }
    }

common_update:
    func_020a1794(owner, (u8 *)scene + 0xa4, (u8 *)primaryDisplay + 0x2c, 0);
    VecFx32Object_Assign((u8 *)shadowDisplay + 0x2c, (u8 *)primaryDisplay + 0x2c);
    FIELD(s32, shadowDisplay, 0x34) += 0x28000;
    if (FIELD(s32, scene, 0x1bc) != 0 && FIELD(s32, scene, 0x1bc) < 234) {
        FIELD(s32, primaryDisplay, 0x30) += random_offset(12, 6) * 0x1000;
        FIELD(s32, primaryDisplay, 0x34) += random_offset(12, 6) * 0x1000;
    }

    if (FIELD(s32, scene, 0x20c) > 0) {
        func_020a1794(owner, (u8 *)scene + 0x214, (u8 *)secondaryDisplay + 0x2c, 0);
    } else if (FIELD(u8, animation_of(primaryDisplay), 0x38) == 2) {
        set_display_bit4(secondaryDisplay, 0);
        set_display_scale(secondaryDisplay, FIELD(s32, scene, 0xd0) + 150);
        VecFx32Object_Assign((u8 *)secondaryDisplay + 0x2c, (u8 *)primaryDisplay + 0x2c);
        s32 effectPosition[3];
        func_ov042_02203658(effectPosition, (u8 *)scene + 0xa4);
        s32 side = func_020befec(FIELD(s32, scene, 0xd0), 3);
        if (FIELD(s32, scene, 0xd0) > 135) side = 0;
        if (FIELD(s32, scene, 0xd0) & 2) {
            FIELD(s32, secondaryDisplay, 0x30) -= 0x37000;
            FIELD(s32, secondaryDisplay, 0x34) -= 0x35000;
            effectPosition[1] -= 0x50000;
        } else {
            FIELD(s32, secondaryDisplay, 0x30) += 0x37000;
            FIELD(s32, secondaryDisplay, 0x34) -= 0x36000;
            effectPosition[1] += 0x50000;
        }
        effectPosition[2] -= 0x50000;
        if (side != 0)
            func_ov042_021fdeac(FIELD(void *, owner, 0x14), side, effectPosition);
    }

    s32 trailPosition[3];
    func_ov042_021fcf80(trailPosition);
    trailPosition[1] = FIELD(s32, primaryDisplay, 0x30);
    trailPosition[2] = FIELD(s32, primaryDisplay, 0x34) - 0x50000;
    func_ov042_022009a0(scene, trailPosition, FIELD(s32, scene, 0xe0), 3000);
}
