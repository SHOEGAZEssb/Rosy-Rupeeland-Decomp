#include "tingle/types.h"

/*
 * Overlay 42 encounter controller. This recovered top-level frame routine
 * selects the active encounter variant, applies damage and death sequences,
 * updates subordinate actor families, and coordinates effects and audio.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gSoundContext;
extern "C" s16 data_020c9670[];
extern "C" s32 data_ov042_0220ac78[];
extern "C" s32 data_ov042_0220ac84[];
extern "C" s32 data_ov042_0220ac9c[];
extern "C" s32 data_ov042_0220aca8[];
extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 value, s32 modulus);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void Sound_StopDirectSequence(void *sound, s32 sequence, s32 value);
extern "C" void func_020593ac(void *sound, s32 sequence, s32 channel,
                               s32 value, s32 arg0, s32 arg1);
extern "C" void func_0205940c(void *sound, s32 sequence, s32 value);
extern "C" void func_0205943c(void *sound, s32 sequence, s32 channel,
                               s32 value, s32 arg0, s32 arg1);
extern "C" void func_020594ec(void *sound, s32 value);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, s32 index);
extern "C" void func_020a1794(void *owner, const void *position,
                               const void *display, s32 flags);
extern "C" void func_020a1ec0(void *owner, u32 effect);
extern "C" void Heap_Free(void *allocation);
extern "C" void func_ov042_021fcf80(void *vector);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_021fda24(void *effects, s32 kind,
                                     const void *position, s32 variant);
extern "C" void func_ov042_021fe2f0(void *effects, const void *position);
extern "C" void func_ov042_021fe544(void *effects, const void *position);
extern "C" void func_ov042_021fe670(void *effects, const void *position);
extern "C" void func_ov042_021fea78(void *effects);
extern "C" void func_ov042_02200658(void *scene, s32 count);
extern "C" void func_ov042_022009a0(void *scene, const void *position,
                                     s32 health, s32 period);
extern "C" void func_ov042_02200bc0(void *scene);
extern "C" void func_ov042_02201234(void *scene);
extern "C" void func_ov042_02201ea0(void *scene, s32 damage);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" void func_ov042_02205180(void *pool);
extern "C" void func_ov042_0220549c(void *pool);
extern "C" void func_ov042_02205cb8(void *scene);
extern "C" void func_ov042_02207114(void *scene);
extern "C" void func_ov042_02207ef0(void *object);
extern "C" void func_ov042_022080d4(void *object);
extern "C" void func_ov042_022080f0(void *object);
extern "C" void func_ov042_02208894(void *object);
extern "C" void func_ov042_02208a90(void *object);
extern "C" void func_ov042_02208aac(void *object);
extern "C" void func_ov042_02209128(void *object);
extern "C" void func_ov042_02209344(void *object);
extern "C" void func_ov042_02209360(void *object);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 category, s32 *extra);
extern "C" void func_ov071_02210440(void *world, const void *position,
                                     s32 radius, s32 category);
extern "C" void func_ov071_02210514(void *world, s32 state);
extern "C" void func_ov071_02210540(void *world);

/* Return the animation object stored behind a display wrapper. */
static void *animation_of(void *display)
{
    return FIELD(void *, display, 0xc);
}

/* Select an animation, preserving all other animation-object state. */
static void set_animation(void *display, s32 index)
{
    GraphicsSpriteState_SetAnimationIndex(animation_of(display), index);
}

/* Emit a randomized hit particle around the scene's primary position. */
static void emit_hit_particle(void *scene, s32 kind, s32 variant)
{
    s32 position[3];
    func_ov042_021fcf80(position);
    position[1] = FIELD(s32, scene, 0xa8) +
                  (func_020bf1f8(genrand_int32(), 160) - 80) * 0x1000;
    position[2] = FIELD(s32, scene, 0xac) +
                  ((s32)(genrand_int32() & 0x7f) - 96) * 0x1000;
    func_ov042_021fda24(FIELD(void *, FIELD(void *, scene, 0x48), 0x14),
                         kind, position, variant);
}

/* Stop and dispose the three subordinate actor arrays used by the base mode. */
static void release_subordinates(void *scene)
{
    for (s32 i = 1; i >= 0; --i) {
        void *object = FIELD(void *, scene, 0x84 + i * 4);
        if (object) {
            func_ov042_02209128(object);
            Heap_Free(object);
            FIELD(void *, scene, 0x84 + i * 4) = 0;
        }
    }
    for (s32 i = 2; i >= 0; --i) {
        void *object = FIELD(void *, scene, 0x78 + i * 4);
        if (object) {
            func_ov042_02208894(object);
            Heap_Free(object);
            FIELD(void *, scene, 0x78 + i * 4) = 0;
        }
    }
    for (s32 i = 3; i >= 0; --i) {
        void *object = FIELD(void *, scene, 0x68 + i * 4);
        if (object) {
            func_ov042_02207ef0(object);
            Heap_Free(object);
            FIELD(void *, scene, 0x68 + i * 4) = 0;
        }
    }
}

/* Update the shared display transform and the health-dependent trail effect. */
static void update_display_and_trail(void *scene, s32 yOffset, s32 period,
                                     s32 transformFlags)
{
    void *display = FIELD(void *, scene, 0x4c);
    func_020a1794(FIELD(void *, scene, 0x48), (u8 *)scene + 0xa4,
                   (u8 *)display + 0x2c, transformFlags);
    s32 position[3];
    func_ov042_021fcf80(position);
    position[1] = FIELD(s32, display, 0x30);
    position[2] = FIELD(s32, display, 0x34) - yOffset;
    func_ov042_022009a0(scene, position, FIELD(s32, scene, 0xe0), period);
}

/*
 * Advance the complete overlay encounter by one frame. The scene pointer is
 * both input and output. Mode +0x1B4 selects the alternate primary controller
 * (1), scripted primary encounter (2), or base multi-family encounter. The
 * routine changes health +0xE0, hit/death timers +0x1B0/+0x1BC/+0x1C0,
 * positions +0xA4..+0xAC/+0x154..+0x15C, family objects +0x68..+0x88,
 * animation/display state, collision-world state, sound channels, and effects.
 * It returns nothing. The exact semantic role of several timers remains
 * inferred, so their offset names and confirmed thresholds are retained.
 */
extern "C" void func_ov042_02201f30(void *scene)
{
    void *owner = FIELD(void *, scene, 0x48);

    /* +0x1C0 drives the shared death-smoke loop in every encounter mode. */
    if (FIELD(s32, scene, 0x1c0)) {
        s32 tick = ++FIELD(s32, scene, 0x1c0);
        if ((tick & 3) == 0)
            emit_hit_particle(scene, 2, (tick >> 3) & 3);
        if (tick & 1) {
            s32 position[3];
            func_ov042_021fcf80(position);
            position[1] = FIELD(s32, scene, 0xa8) +
                          (func_020bf1f8(genrand_int32(), 180) - 90) * 0x1000;
            position[2] = FIELD(s32, scene, 0xac) +
                          (func_020bf1f8(genrand_int32(), 160) - 160) * 0x1000;
            func_ov042_021fe544(FIELD(void *, owner, 0x14), position);
        }
        if ((tick & 15) == 0)
            func_020a1ec0(owner, 0xb480);
    }

    s32 mode = FIELD(s32, scene, 0x1b4);
    if (mode == 1) {
        func_ov042_02207114(scene);
        return;
    }

    if (mode == 2) {
        /* +0x1B0 is a scripted entry/descent sequence for this mode. */
        if (FIELD(s32, scene, 0x1b0)) {
            s32 tick = ++FIELD(s32, scene, 0x1b0);
            if (tick == 2) {
                FIELD(s32, FIELD(void *, owner, 0x10), 0x538) = 1;
                func_ov071_02210514(FIELD(void *, owner, 8), 4);
                FIELD(s32, scene, 0xb8) = 0x1333;
                func_020593ac(gSoundContext, 0x16b, 4, 0, 0, 0);
                ++FIELD(s32, scene, 0x1b0);
            }
            if (tick > 140 && tick < 180) {
                FIELD(s32, scene, 0xac) += FIELD(s32, scene, 0xb8);
                if (FIELD(s32, scene, 0xac) > -0x82000)
                    FIELD(s32, scene, 0xb8) -= func_020befec(FIELD(s32, scene, 0xb8), 9);
                FIELD(s32, scene, 0x1d0) = 2;
                ++FIELD(s32, scene, 0x1d4);
                FIELD(s32, scene, 0x1d8) = 900;
                FIELD(s32, scene, 0x1dc) = 0x800;
            } else if (tick >= 180 && tick < 308) {
                FIELD(s32, scene, 0xac) += 0x119a;
                FIELD(s32, scene, 0x1dc) -= 0x52;
                if (FIELD(s32, scene, 0x1dc) < 0)
                    FIELD(s32, scene, 0x1dc) = FIELD(s32, scene, 0x1d4) = 0;
            }
            if (tick == 140) {
                FIELD(s32, owner, 0x1c8) = 6;
                ++FIELD(s32, scene, 0x1b0);
            }
            if (tick == 180)
                func_ov071_02210514(FIELD(void *, owner, 8), 7);
            if (tick >= 308)
                FIELD(s32, scene, 0x1b0) = 0;
            update_display_and_trail(scene, 0x5a000, 0x582, 0x52);
            return;
        }

        if (FIELD(s32, scene, 0x1bc) == 0) {
            func_ov042_02201234(scene);

            /* Four vertically offset probes make up the confirmed damage area. */
            static const s32 offsets[4] = {-0x28000, 0, 0x28000, 0x50000};
            static const s32 radii[4] = {0x64000, 0x64000, 0x46000, 0x1e000};
            s32 totalDamage = 0;
            s32 reportedDamage = 0;
            for (s32 i = 0; i < 4; ++i) {
                s32 query[3];
                func_ov042_02203658(query, (u8 *)scene + 0xa4);
                query[2] += offsets[i];
                totalDamage += func_ov071_02211a10(
                    FIELD(void *, FIELD(void *, owner, 8), 0xe8), query,
                    radii[i], 5, &reportedDamage);
                if (i < 2)
                    func_ov071_02210440(FIELD(void *, owner, 8), query, 0x64000, 1);
            }
            if (totalDamage > 0) {
                --FIELD(s32, scene, 0xe0);
                if (FIELD(s32, scene, 0x1c4) == 0)
                    FIELD(s32, scene, 0x1c4) = 8;
                ++FIELD(s32, scene, 0x1c8);
                func_ov042_02201ea0(scene, reportedDamage);

                s32 healthBand = 2 - func_020befec(FIELD(s32, scene, 0xe0), 470);
                if (healthBand < 0) healthBand = 0;
                if (healthBand > 2) healthBand = 2;
                s32 variant = data_ov042_0220ac78[healthBand];
                if (FIELD(s32, scene, 0xc4) != variant) {
                    func_020a1ec0(owner, 0xb580);
                    FIELD(s32, scene, 0xdc) = 1;
                }
                FIELD(s32, scene, 0xc4) = variant;
                FIELD(s32, scene, 0x150) = healthBand;
                FIELD(s32, scene, 0xe8) = 90;
            }
            if (FIELD(s32, scene, 0x1c4) > 0)
                --FIELD(s32, scene, 0x1c4);
            if (FIELD(s32, scene, 0xe0) <= 0) {
                ++FIELD(s32, scene, 0x1bc);
                FIELD(s32, owner, 0x1ec) = 2;
                func_ov042_021fda0c((u8 *)scene + 0x154, (u8 *)scene + 0xa4);
                FIELD(s32, scene, 0x1c4) = 0;
                Sound_StopDirectSequence(gSoundContext, 0xe1, 0);
            }
        } else {
            s32 tick = ++FIELD(s32, scene, 0x1bc);
            if ((tick & 3) == 0)
                emit_hit_particle(scene, 1, (tick >> 3) & 3);
            if (FIELD(s32, scene, 0x158) > 0x1000) FIELD(s32, scene, 0x158) -= 0x1000;
            if (FIELD(s32, scene, 0x158) < -0x1000) FIELD(s32, scene, 0x158) += 0x1000;
            if (FIELD(s32, scene, 0x15c) > -0x71000) FIELD(s32, scene, 0x15c) -= 0x1333;
            if (FIELD(s32, scene, 0x15c) < -0x73000) FIELD(s32, scene, 0x15c) += 0x1333;
            if (tick == 280) func_020594ec(gSoundContext, 29);
            if (tick == 300) func_ov071_02210540(FIELD(void *, owner, 8));
            if (tick == 1410) FIELD(s32, owner, 0x1c8) = 8;
            FIELD(s32, scene, 0xa8) = FIELD(s32, scene, 0x158) +
                                           (func_020bf1f8(genrand_int32(), 10) - 5) * 0x1000;
            FIELD(s32, scene, 0xac) = FIELD(s32, scene, 0x15c) +
                                           (func_020bf1f8(genrand_int32(), 10) - 5) * 0x1000;
            func_0205940c(gSoundContext, 0x16b, 4);
        }
        update_display_and_trail(scene, 0x5a000, 0x582, 0x52);
        return;
    }

    /* Base encounter: update the pool and all three subordinate families. */
    if (FIELD(s32, scene, 0x1b0) && ++FIELD(s32, scene, 0x1b0) == 30) {
        func_020a1ec0(owner, 0xeb8f);
        FIELD(s32, scene, 0x1b0) = 0;
    }
    if (FIELD(s32, scene, 0x1bc) == 0)
        func_ov042_02200bc0(scene);
    func_ov042_0220549c(FIELD(void *, scene, 0xa0));
    for (s32 i = 3; i >= 0; --i)
        func_ov042_022080f0(FIELD(void *, scene, 0x68 + i * 4));
    for (s32 i = 2; i >= 0; --i)
        func_ov042_02208aac(FIELD(void *, scene, 0x78 + i * 4));
    for (s32 i = 1; i >= 0; --i)
        func_ov042_02209360(FIELD(void *, scene, 0x84 + i * 4));

    if (FIELD(s32, scene, 0x1bc) == 0) {
        s32 query[3], reportedDamage = 0;
        func_ov042_02203658(query, (u8 *)scene + 0xa4);
        s32 damage = func_ov071_02211a10(
            FIELD(void *, FIELD(void *, owner, 8), 0xe8), query,
            0x64000, 7, &reportedDamage);
        if (damage > 0) {
            s32 oldHealth = FIELD(s32, scene, 0xe0);
            FIELD(s32, scene, 0xe0) -= damage;
            if (FIELD(s32, scene, 0xe0) <= 0) {
                FIELD(s32, scene, 0xe0) = 0;
                FIELD(s32, scene, 0x1c0) = FIELD(s32, scene, 0x1bc) = 1;
                func_0205940c(gSoundContext, 0x16b, 4);
                func_ov042_02205180(FIELD(void *, scene, 0xa0));
                for (s32 i = 3; i >= 0; --i) func_ov042_022080d4(FIELD(void *, scene, 0x68 + i * 4));
                for (s32 i = 2; i >= 0; --i) func_ov042_02208a90(FIELD(void *, scene, 0x78 + i * 4));
                for (s32 i = 1; i >= 0; --i) func_ov042_02209344(FIELD(void *, scene, 0x84 + i * 4));
                if (FIELD(s32, scene, 0x16c) >= 0) FIELD(s32, scene, 0x16c) = 3;
            } else {
                func_ov042_02201ea0(scene, reportedDamage);
                FIELD(s32, scene, 0x1b0) = 1;
                if (oldHealth != FIELD(s32, scene, 0xe0))
                    func_020a1ec0(owner, 0xeb8e);
            }
        }
    } else {
        s32 tick = ++FIELD(s32, scene, 0x1bc);
        FIELD(s32, scene, 0x1c0) = 0;
        FIELD(s32, owner, 0x1ec) = 1;
        if (tick >= 240 && tick < 400) {
            s32 phase = ((tick - 240) * 110) & 0xffff;
            if (phase <= 0x3a98) {
                s32 scale = 0x100 - (data_020c9670[(phase >> 4) * 2] >> 4);
                FIELD(s16, FIELD(void *, scene, 0x50), 0x3c) = (s16)scale;
                FIELD(s16, FIELD(void *, scene, 0x50), 0x3e) = (s16)scale;
                FIELD(u16, animation_of(FIELD(void *, scene, 0x50)), 0x30) =
                    (u16)((tick - 240) * 0x398);
            } else {
                FIELD(u16, FIELD(void *, scene, 0x50), 0x42) |= 4;
                FIELD(u16, animation_of(FIELD(void *, scene, 0x50)), 0x24) |= 4;
            }
        }
        if (tick == 410) {
            FIELD(s32, scene, 0x23c) = 1;
            func_020a1ec0(owner, 0xb482);
        }
        if (tick == 510) {
            release_subordinates(scene);
            func_ov042_021fea78(FIELD(void *, owner, 0x14));
            func_ov042_02200658(scene, 4);
            func_ov042_02205cb8(scene);
        }
    }
    update_display_and_trail(scene, 0x60000, 0x352, 0);
}
