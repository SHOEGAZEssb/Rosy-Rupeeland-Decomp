#include "tingle/types.h"

/*
 * Overlay 42 variant-2 state machine. This recovered update controls launch,
 * projectile volleys, collision damage, flashing, death bursts, animation,
 * scale, and presentation position for one late effect object.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, u8 index);
extern "C" void func_020a1794(void *sceneObject, const void *position,
                                void *destination, s32 unused);
extern "C" void func_020a1ec0(void *sceneObject, u32 soundOrEffect);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" void func_ov042_021fda24(void *pool, s32 type,
                                      const void *position, s32 variant);
extern "C" void func_ov042_022051a8(void *pool, s32 subtype,
                                      const void *position, u16 angle);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 kind, s32 flags);
extern "C" u8 data_ov042_0220b500[];

static void set_variant_animation(void *object, s32 odd)
{
    u8 variant = FIELD(u8, object, 0x8a);
    s32 frame = (variant % 3) * 2 + odd;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c),
                  (u8)frame);
}

static void spawn_projectile(void *object, u16 angle)
{
    void *owner = FIELD(void *, object, 0x48);
    void *pool = FIELD(void *, FIELD(void *, owner, 0x0c), 0xa0);
    func_ov042_022051a8(pool, 3, (u8 *)object + 0x50, angle);
}

/*
 * Given one variant-2 object, increment timer +0x80 and dispatch state +0x74.
 * State 1 delays 16 ticks and selects the even variant animation. State 2
 * accelerates and integrates the +0x50 position using +0x68 velocity, damping
 * its first component until payload +0x58 crosses +0x64. State 3 emits a
 * variant-dependent three- or four-shot angle pattern every 16 ticks, then
 * advances after 80 ticks. State 4 shrinks the presentation scale for 60 ticks
 * and hides it. State 100 flashes visibility, jitters periodic burst positions,
 * and eventually advances to 101.
 *
 * Every call derives the displayed position (adding the owner's +0x160 vector
 * only in state zero), applies it through func_020a1794, and in states 2/3
 * queries overlay-71 collision at radius 0x18000. Damage reduces +0x7C, starts
 * a 30-tick hit flash/odd animation, and on depletion enters state 100, starts
 * a 40-tick death flash, disables the active flag, changes animation to six,
 * and dispatches confirmed effect 0xB484. Helpers mutate geometry, animation,
 * audio/effect, PRNG, collision, and projectile-pool state. No value is returned.
 */
extern "C" void func_ov042_02208aac(void *object)
{
    s32 timer = ++FIELD(s32, object, 0x80);
    s32 state = FIELD(s32, object, 0x74);

    if (state == 1) {
        timer = ++FIELD(s32, object, 0x80);
        if (timer > 16) {
            set_variant_animation(object, 0);
            void *animation = FIELD(void *, FIELD(void *, object, 0x4c), 0x0c);
            FIELD(u16, animation, 0x24) |= 2;
            FIELD(s32, object, 0x74) = 2;
            FIELD(s32, object, 0x80) = 0;
        }
    } else if (state == 2) {
        FIELD(s32, object, 0x70) += 0x4cd;
        s32 vx = FIELD(s32, object, 0x6c);
        FIELD(s32, object, 0x6c) =
            vx - (s32)(((s64)vx * 0x52 + 0x800) >> 12);
        func_ov042_021ff2f8((u8 *)object + 0x50,
                            (u8 *)object + 0x68);
        if (FIELD(s32, object, 0x58) > FIELD(s32, object, 0x64)) {
            FIELD(s32, object, 0x74) = 3;
            FIELD(s32, object, 0x80) = 0;
        }
    } else if (state == 3) {
        if ((timer & 15) == 1) {
            u8 variant = FIELD(u8, object, 0x84);
            if (variant == 0) {
                spawn_projectile(object, 0xfc18);
                spawn_projectile(object, 0);
                spawn_projectile(object, 0x3e8);
            } else if (variant == 1) {
                spawn_projectile(object, 0xf448);
                spawn_projectile(object, 0);
                spawn_projectile(object, 0xbb8);
            } else {
                spawn_projectile(object, 0xf448);
                spawn_projectile(object, 0xfc18);
                spawn_projectile(object, 0x3e8);
                spawn_projectile(object, 0xbb8);
            }
        }
        if (timer > 80) {
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0x74) = 4;
        }
    } else if (state == 4) {
        s16 scale = (s16)(0x100 - timer * 4);
        void *presentation = FIELD(void *, object, 0x4c);
        FIELD(u16, presentation, 0x3c) = (u16)scale;
        FIELD(u16, presentation, 0x3e) = (u16)scale;
        if (timer > 60) {
            FIELD(u16, presentation, 0x42) |= 4;
            FIELD(s32, object, 0x74) = 101;
        }
    } else if (state == 100) {
        s8 flash = FIELD(s8, object, 0x8b);
        if (flash > 0) {
            flash--;
            FIELD(s8, object, 0x8b) = flash;
            if (flash == 0)
                FIELD(s32, object, 0x74) = 101;
        }
        void *presentation = FIELD(void *, object, 0x4c);
        if ((FIELD(s8, object, 0x8b) & 2) == 0)
            FIELD(u16, presentation, 0x42) |= 4;
        else
            FIELD(u16, presentation, 0x42) &= (u16)~4;

        flash = FIELD(s8, object, 0x8b);
        if ((flash & 3) == 0) {
            u8 position[12];
            func_ov042_021fcf80(position);
            func_ov042_021fda0c(position, (u8 *)object + 0x50);
            FIELD(s32, position, 4) +=
                ((s32)(genrand_int32() & 31) - 16) << 12;
            FIELD(s32, position, 8) +=
                ((s32)(genrand_int32() & 63) - 32) << 12;
            func_ov042_021fda24(
                FIELD(void *, FIELD(void *, object, 0x48), 0x14), 1,
                position, ((s32)FIELD(s8, object, 0x8b) >> 3) & 3);
        }
    }

    u8 displayPosition[12];
    func_ov042_021fcf80(displayPosition);
    if (FIELD(s32, object, 0x74) == 0) {
        void *owner = FIELD(void *, object, 0x48);
        func_ov042_021fda0c(displayPosition,
                            (u8 *)FIELD(void *, owner, 0x0c) + 0x160);
        func_ov042_021ff2f8(displayPosition, (u8 *)object + 0x50);
    } else {
        func_ov042_021fda0c(displayPosition, (u8 *)object + 0x50);
    }
    func_020a1794(FIELD(void *, object, 0x48), displayPosition,
                  (u8 *)FIELD(void *, object, 0x4c) + 0x2c, 0);

    state = FIELD(s32, object, 0x74);
    if (state >= 2 && state < 4) {
        u8 queryPosition[12];
        FIELD(void *, queryPosition, 0) = data_ov042_0220b500;
        FIELD(s32, queryPosition, 4) = FIELD(s32, displayPosition, 4);
        FIELD(s32, queryPosition, 8) = FIELD(s32, displayPosition, 8);
        void *owner = FIELD(void *, object, 0x48);
        s32 damage = func_ov071_02211a10(
            FIELD(void *, FIELD(void *, owner, 8), 0xe8), queryPosition,
            0x18000, 0, 0);
        if (damage > 0) {
            if (FIELD(s8, object, 0x8b) == 0) {
                set_variant_animation(object, 1);
                FIELD(s8, object, 0x8b) = 30;
            }
            FIELD(s32, object, 0x7c) -= damage;
            if (FIELD(s32, object, 0x7c) <= 0) {
                if (FIELD(s32, object, 0x74) < 2) {
                    func_ov042_021ff2f8((u8 *)object + 0x50,
                        (u8 *)FIELD(void *, FIELD(void *, object, 0x48), 0x0c) + 0x160);
                }
                FIELD(s32, object, 0x74) = 100;
                FIELD(s8, object, 0x8b) = 40;
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 6);
                void *presentation = FIELD(void *, object, 0x4c);
                FIELD(u16, FIELD(void *, presentation, 0x0c), 0x24) &= (u16)~2;
                func_020a1ec0(FIELD(void *, object, 0x48), 0xb484);
            }
        }

        if (FIELD(s8, object, 0x8b) > 0) {
            FIELD(s8, object, 0x8b)--;
            if (FIELD(s8, object, 0x8b) == 0)
                set_variant_animation(object, 0);
        }
    }
}
