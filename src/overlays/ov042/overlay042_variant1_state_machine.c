#include "tingle/types.h"

/*
 * Overlay 42 variant-1 state machine. This recovered update controls staged
 * motion, directional animation, projectile emission, collision damage,
 * flashing, death bursts, and presentation placement for one child object.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" u16 func_020ae024(s32 x, s32 y);
extern "C" void func_02072b68(void *animation, u8 index);
extern "C" void func_020a1794(void *scene, const void *position,
                                void *destination, s32 unused);
extern "C" void func_020a1ec0(void *scene, u32 effect);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" void func_ov042_021fda24(void *pool, s32 type,
                                      const void *position, s32 variant);
extern "C" void func_ov042_022051a8(void *pool, s32 subtype,
                                      const void *position, u16 angle);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 kind, s32 flags);
extern "C" s16 data_020c9670[];

static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

static s32 vector_length(s32 x, s32 y)
{
    return func_020adc40(multiply_fx(x, x) + multiply_fx(y, y));
}

static void spawn_shot(void *object, s32 subtype, const void *position)
{
    void *owner = FIELD(void *, object, 0x48);
    func_ov042_022051a8(
        FIELD(void *, FIELD(void *, owner, 0x0c), 0xa0), subtype,
        position, 0);
}

/*
 * Increment timer +0x80 and dispatch state +0x74. State zero follows a sine
 * entrance using phase timer*0x10E and amplitude +0x6C before selecting state
 * two. State two damps velocity by 0xA4, accelerates toward +0x60/+0x64 with
 * normalized strength 0x4CD, integrates +0x50, and advances within 0x5000.
 * State three emits subtype-zero records every 32 ticks after tick 40 and
 * advances after 360. State four applies horizontal boundary acceleration,
 * scales vertical velocity by 0xEE1, emits offset subtype-one records during
 * alternating timer windows, and leaves the field after tick 800. State five
 * accelerates downward until payload +0x58 exceeds 0x12C000. State 100 flashes
 * and emits randomized bursts until entering terminal state 101.
 *
 * Active states derive an eight-direction animation from the owner position;
 * cooldown +0x84 temporarily selects the upper animation bank. Radius-0x18000
 * collision damage selects a hit animation for 30 ticks, reduces health +0x7C,
 * and on depletion enters state 100 with a 40-tick flash, animation 26, and
 * effect 0xEB83. Animation, audio/effect, PRNG, collision, projectile-pool,
 * and presentation state can change. No value is returned.
 */
extern "C" void func_ov042_022080f0(void *object)
{
    s32 timer = ++FIELD(s32, object, 0x80);
    s32 state = FIELD(s32, object, 0x74);
    if (state == 0) {
        s32 phase = timer * 0x10e;
        if (phase > 0x4000) {
            FIELD(s32, object, 0x74) = 2;
            FIELD(s32, object, 0x6c) = 0;
            FIELD(s32, object, 0x70) = 0;
            func_02072b68(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 0);
        } else {
            s16 sine = data_020c9670[(phase >> 4) * 2];
            FIELD(s32, object, 0x54) =
                multiply_fx(FIELD(s32, object, 0x6c), sine);
        }
    } else if (state == 2) {
        s32 dx = FIELD(s32, object, 0x60) - FIELD(s32, object, 0x54);
        s32 dy = FIELD(s32, object, 0x64) - FIELD(s32, object, 0x58);
        s32 distance = vector_length(dx, dy);
        FIELD(s32, object, 0x6c) -= multiply_fx(FIELD(s32, object, 0x6c), 0xa4);
        FIELD(s32, object, 0x70) -= multiply_fx(FIELD(s32, object, 0x70), 0xa4);
        FIELD(s32, object, 0x6c) +=
            multiply_fx(func_020adc90(dx, distance), 0x4cd);
        FIELD(s32, object, 0x70) +=
            multiply_fx(func_020adc90(dy, distance), 0x4cd);
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
        if (distance <= 0x5000) {
            FIELD(s32, object, 0x74)++;
            if (FIELD(u8, object, 0x8a) >= 4) {
                FIELD(s32, object, 0x80) = 0;
                FIELD(s32, object, 0x74)++;
            }
        }
    } else if (state == 3) {
        if (timer > 40 && (timer & 31) == 0) {
            FIELD(s32, object, 0x84) = 5;
            spawn_shot(object, 0, (u8 *)object + 0x50);
            func_020a1ec0(FIELD(void *, object, 0x48),
                           (timer & 1) ? 0xeb85 : 0xeb8c);
        }
        if (timer > 360)
            FIELD(s32, object, 0x74) = 5;
    } else if (state == 4) {
        s32 x = FIELD(s32, object, 0x54);
        if (timer < 800) {
            if (x < -0x6e000) {
                FIELD(s32, object, 0x6c) += 0xcd;
                if (FIELD(s32, object, 0x6c) > 0x3000)
                    FIELD(s32, object, 0x6c) = 0x3000;
            } else if (x > 0x6e000) {
                FIELD(s32, object, 0x6c) -= 0xcd;
                if (FIELD(s32, object, 0x6c) < -0x3000)
                    FIELD(s32, object, 0x6c) = -0x3000;
            }
        } else if (x < -0xd2000 || x > 0xd2000) {
            FIELD(s32, object, 0x74) = 101;
        }
        FIELD(s32, object, 0x70) = multiply_fx(FIELD(s32, object, 0x70), 0xee1);
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
        if (timer > 30 && (timer & 32) == 0 && (timer & 15) == 0) {
            u8 position[12];
            func_ov042_02203658(position, (u8 *)object + 0x50);
            FIELD(s32, position, 4) += 0xc000;
            FIELD(s32, position, 8) += 0x1c000;
            FIELD(s32, object, 0x84) = 5;
            spawn_shot(object, 1, position);
            func_020a1ec0(FIELD(void *, object, 0x48),
                           (timer & 1) ? 0xeb85 : 0xeb8c);
        }
    } else if (state == 5) {
        FIELD(s32, object, 0x70) += 0xcd;
        if (FIELD(s32, object, 0x70) > 0x3000)
            FIELD(s32, object, 0x70) = 0x3000;
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
        if (FIELD(s32, object, 0x58) > 0x12c000)
            FIELD(s32, object, 0x74) = 101;
    } else if (state == 100) {
        s8 flash = FIELD(s8, object, 0x8b);
        if (flash > 0) {
            FIELD(s8, object, 0x8b) = --flash;
            if (flash == 0)
                FIELD(s32, object, 0x74) = 101;
        }
        void *child = FIELD(void *, object, 0x4c);
        if ((FIELD(s8, object, 0x8b) & 2) == 0)
            FIELD(u16, child, 0x42) |= 4;
        else
            FIELD(u16, child, 0x42) &= (u16)~4;
        if ((FIELD(s8, object, 0x8b) & 3) == 0) {
            u8 position[12];
            func_ov042_02203658(position, (u8 *)object + 0x50);
            FIELD(s32, position, 4) += ((s32)(genrand_int32() & 31) - 16) << 12;
            FIELD(s32, position, 8) += ((s32)(genrand_int32() & 31) - 16) << 12;
            func_ov042_021fda24(
                FIELD(void *, FIELD(void *, object, 0x48), 0x14), 1,
                position, ((s32)FIELD(s8, object, 0x8b) >> 3) & 3);
        }
    }

    if (FIELD(s32, object, 0x84) > 0)
        FIELD(s32, object, 0x84)--;
    u8 display[12];
    func_ov042_021fcf80(display);
    FIELD(s32, display, 4) = FIELD(s32, object, 0x54);
    FIELD(s32, display, 8) = FIELD(s32, object, 0x58);
    func_020a1794(FIELD(void *, object, 0x48), display,
                  (u8 *)FIELD(void *, object, 0x4c) + 0x2c, 0);

    state = FIELD(s32, object, 0x74);
    if (state >= 2 && state < 100) {
        void *owner = FIELD(void *, object, 0x48);
        void *target = FIELD(void *, owner, 8);
        u16 angle = (u16)-func_020ae024(
            FIELD(s32, target, 0x98) - FIELD(s32, object, 0x54),
            FIELD(s32, target, 0x9c) - FIELD(s32, object, 0x58));
        u8 direction = (u8)(((angle + 0x1000) >> 13) & 7);
        if (state == 4)
            direction = 0;
        if (FIELD(s32, object, 0x84) > 0)
            direction = (u8)((direction + 8) & 0xff);
        u8 query[12];
        func_ov042_02203658(query, display);
        s32 damage = func_ov071_02211a10(
            FIELD(void *, target, 0xe8), query, 0x18000, 0, 0);
        if (damage > 0) {
            if (FIELD(s8, object, 0x8b) == 0) {
                func_02072b68(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c),
                              (u8)((direction & 7) + 16));
                FIELD(s8, object, 0x8b) = 30;
            }
            FIELD(s32, object, 0x7c) -= damage;
            if (FIELD(s32, object, 0x7c) <= 0) {
                FIELD(s32, object, 0x74) = 100;
                FIELD(s8, object, 0x8b) = 40;
                func_02072b68(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 26);
                func_020a1ec0(owner, 0xeb83);
            }
        }
        if (FIELD(s8, object, 0x8b) > 0)
            FIELD(s8, object, 0x8b)--;
        if (FIELD(s8, object, 0x8b) <= 0) {
            void *animation = FIELD(void *, FIELD(void *, object, 0x4c), 0x0c);
            if (FIELD(u8, animation, 0x38) != direction)
                func_02072b68(animation, direction);
        }
    }
}
