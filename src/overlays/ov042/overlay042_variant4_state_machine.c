#include "tingle/types.h"

/*
 * Overlay 42 variant-4 state machine. This recovered update controls mirrored
 * target pursuit, subtype-dependent projectile patterns, waypoint traversal,
 * exit motion, death flashing, burst emission, and presentation placement.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 numerator, s32 denominator);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_020a1794(void *scene, const void *position,
                                void *destination, s32 unused);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" void func_ov042_0220368c(void *destination, const void *first,
                                      const void *second);
extern "C" void func_ov042_021fda24(void *pool, s32 type,
                                      const void *position, s32 variant);
extern "C" void func_ov042_021fdd48(void *pool, s32 type,
                                      const void *position);
extern "C" void func_ov042_022051a8(void *pool, s32 subtype,
                                      const void *position, u16 angle);
extern "C" s32 func_ov071_02210440(void *scene, const void *position,
                                     s32 radius, s32 kind);
extern "C" u16 data_ov042_0220b3e8[];

static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

static s32 length_fx(s32 x, s32 y)
{
    return func_020adc40(multiply_fx(x, x) + multiply_fx(y, y));
}

static void add_normalized(void *velocity, s32 x, s32 y, s32 divisor)
{
    s32 length = length_fx(x, y) * divisor;
    FIELD(s32, velocity, 4) += func_020adc90(x, length);
    FIELD(s32, velocity, 8) += func_020adc90(y, length);
}

static void damp(void *object, s32 xFactor, s32 yFactor)
{
    FIELD(s32, object, 0x6c) -= multiply_fx(FIELD(s32, object, 0x6c), xFactor);
    FIELD(s32, object, 0x70) -= multiply_fx(FIELD(s32, object, 0x70), yFactor);
}

static void spawn_pool_shot(void *object, s32 subtype, u16 angle)
{
    void *owner = FIELD(void *, object, 0x48);
    func_ov042_022051a8(
        FIELD(void *, FIELD(void *, owner, 0x0c), 0xa0), subtype,
        (u8 *)object + 0x50, angle);
}

/*
 * Increment timer +0x80 and derive a mirror selector: subtypes 4 and 6 use the
 * negative/left route, all others the positive/right route. States 1 and 10
 * accelerate toward +0x5C with inverse distance*3, integrate, query radius
 * 0x10000, and transition based on subtype and proximity. State 2 emits a
 * jittered primary-pool record every second tick; subtypes below four fire a
 * three-angle subtype-one volley every 32 ticks, while higher subtypes fire a
 * rotating four-angle subtype-six volley every 13 ticks and continue pursuing
 * the owner with distinct X/Y damping. It exits after 80 or 200 ticks.
 *
 * State 4 shrinks for 60 ticks. States 5..7 traverse three mirrored confirmed
 * waypoints with inverse distance*6, damping 0x7B, and automatic transitions
 * on crossing each boundary. State 8 fixes X to +/-0x78000 and descends; state
 * 9 moves right at 0x6000 with fixed Y. State 100 flashes for +0x8B ticks and
 * emits a randomized burst every fourth tick before entering 101. Display
 * position is owner-relative only in state zero. PRNG, collision, projectile,
 * presentation, and burst-pool state can change; no value is returned.
 */
extern "C" void func_ov042_02209cd8(void *object)
{
    s32 timer = ++FIELD(s32, object, 0x80);
    u8 subtype = FIELD(u8, object, 0x8a);
    bool positiveRoute = subtype != 4 && subtype != 6;
    s32 state = FIELD(s32, object, 0x74);

    if (state == 1 || state == 10) {
        if (state == 10) {
            void *target = FIELD(void *, FIELD(void *, object, 0x48), 8);
            func_ov042_021fda0c((u8 *)object + 0x5c, (u8 *)target + 0x94);
        }
        u8 difference[12];
        func_ov042_0220368c(difference, (u8 *)object + 0x5c,
                            (u8 *)object + 0x50);
        s32 dx = FIELD(s32, difference, 4);
        s32 dy = FIELD(s32, difference, 8);
        s32 distance = length_fx(dx, dy);
        add_normalized((u8 *)object + 0x68, dx, dy, 3);
        if (state == 10 && subtype == 7 && timer > 2) {
            FIELD(s32, object, 0x74) = 2;
            FIELD(s32, object, 0x80) = 0;
            if (dx < 0)
                FIELD(u16, object, 0x88) = 1;
        } else if (state != 10 && distance / 3 < 0x4000) {
            FIELD(s32, object, 0x74) = subtype < 4 ? 2 : 10;
            FIELD(s32, object, 0x80) = 0;
        }
        if (subtype < 4)
            damp(object, 0x19a, 0x148);
        else if (state == 10)
            damp(object, 0x5ec, 0x5ec);
        else
            damp(object, 0x214, 0x214);
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
        u8 query[12];
        func_ov042_02203658(query, (u8 *)object + 0x50);
        func_ov071_02210440(FIELD(void *, FIELD(void *, object, 0x48), 8),
                            query, 0x10000, 0);
    } else if (state == 2) {
        if ((timer & 1) == 0) {
            u8 position[12];
            func_ov042_021fcf80(position);
            FIELD(s32, position, 4) = FIELD(s32, object, 0x54) +
                ((s32)(genrand_int32() % 26) - 13) * 0x1000;
            FIELD(s32, position, 8) = FIELD(s32, object, 0x58) +
                ((s32)(genrand_int32() % 26) - 13) * 0x1000;
            u8 query[12];
            func_ov042_02203658(query, position);
            void *owner = FIELD(void *, object, 0x48);
            func_ov071_02210440(FIELD(void *, owner, 8), query, 0x20000, 0);
            func_ov042_021fdd48(FIELD(void *, owner, 0x14), 0, position);
        }
        s32 lifetime = 80;
        if (subtype < 4) {
            if ((timer & 31) == 1) {
                u16 center = data_ov042_0220b3e8[subtype];
                spawn_pool_shot(object, 1, (u16)(center - 2000));
                spawn_pool_shot(object, 1, center);
                spawn_pool_shot(object, 1, (u16)(center + 2000));
            }
        } else {
            lifetime = 200;
            if (timer % 13 == 0) {
                s32 phase = timer * 180;
                if (FIELD(u16, object, 0x88) != 0)
                    phase = -phase;
                spawn_pool_shot(object, 6, (u16)(phase + 0x4000));
                spawn_pool_shot(object, 6, (u16)(phase + 0x8000));
                spawn_pool_shot(object, 6, (u16)(phase + 0xc000));
                spawn_pool_shot(object, 6, (u16)phase);
            }
            void *target = FIELD(void *, FIELD(void *, object, 0x48), 8);
            func_ov042_021fda0c((u8 *)object + 0x5c, (u8 *)target + 0x94);
            s32 dx = FIELD(s32, object, 0x60) - FIELD(s32, object, 0x54);
            s32 dy = FIELD(s32, object, 0x64) - FIELD(s32, object, 0x58);
            add_normalized((u8 *)object + 0x68, dx, dy, 6);
            damp(object, 0x852, 0x68f);
            func_ov042_021ff2f8((u8 *)object + 0x50,
                                (u8 *)object + 0x68);
        }
        if (timer > lifetime)
            FIELD(s32, object, 0x74) = 101;
    } else if (state == 4) {
        s16 scale = (s16)(0x100 - timer * 4);
        void *presentation = FIELD(void *, object, 0x4c);
        FIELD(u16, presentation, 0x3c) = (u16)scale;
        FIELD(u16, presentation, 0x3e) = (u16)scale;
        if (timer > 60) {
            FIELD(u16, presentation, 0x42) |= 4;
            FIELD(s32, object, 0x74) = 101;
        }
    } else if (state >= 5 && state <= 7) {
        s32 routeX = positiveRoute ? 0x64000 : -0x64000;
        s32 targetY = 0x64000;
        if (state == 6)
            targetY = -0x46000;
        u8 target[12];
        func_ov042_021fcf80(target);
        FIELD(s32, target, 4) = routeX;
        FIELD(s32, target, 8) = targetY;
        u8 difference[12];
        func_ov042_0220368c(difference, target, (u8 *)object + 0x50);
        if (state == 5 && ((!positiveRoute && FIELD(s32, object, 0x54) < 0) ||
                           (positiveRoute && FIELD(s32, object, 0x54) > 0)))
            FIELD(s32, object, 0x74)++;
        if (state == 6 && ((!positiveRoute && FIELD(s32, object, 0x54) < -0x5a000) ||
                           (positiveRoute && FIELD(s32, object, 0x54) > 0x5a000)))
            FIELD(s32, object, 0x74)++;
        if (state == 7 && FIELD(s32, object, 0x58) > 0x46000) {
            FIELD(s32, object, 0x74)++;
            if (subtype == 6) {
                FIELD(s32, object, 0x54) = -0xbe000;
                FIELD(s32, object, 0x74)++;
            }
        }
        add_normalized((u8 *)object + 0x68,
                       FIELD(s32, difference, 4), FIELD(s32, difference, 8), 6);
        damp(object, 0x7b, 0x7b);
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
    } else if (state == 8) {
        FIELD(s32, object, 0x54) = positiveRoute ? 0x78000 : -0x78000;
        FIELD(s32, object, 0x58) += 0x4000;
        if (FIELD(s32, object, 0x58) > 0x12c000)
            FIELD(s32, object, 0x74) = 101;
    } else if (state == 9) {
        FIELD(s32, object, 0x54) += 0x6000;
        FIELD(s32, object, 0x58) = 0x64000;
        if (FIELD(s32, object, 0x54) > 0xfa000)
            FIELD(s32, object, 0x74) = 101;
    } else if (state == 100) {
        s8 flash = FIELD(s8, object, 0x8b);
        if (flash > 0) {
            FIELD(s8, object, 0x8b) = --flash;
            if (flash == 0)
                FIELD(s32, object, 0x74) = 101;
        }
        void *presentation = FIELD(void *, object, 0x4c);
        if ((FIELD(s8, object, 0x8b) & 2) == 0)
            FIELD(u16, presentation, 0x42) |= 4;
        else
            FIELD(u16, presentation, 0x42) &= (u16)~4;
        if ((FIELD(s8, object, 0x8b) & 3) == 0) {
            u8 position[12];
            func_ov042_021fcf80(position);
            func_ov042_021fda0c(position, (u8 *)object + 0x50);
            FIELD(s32, position, 4) += ((s32)(genrand_int32() & 31) - 16) << 12;
            FIELD(s32, position, 8) += ((s32)(genrand_int32() & 63) - 32) << 12;
            func_ov042_021fda24(
                FIELD(void *, FIELD(void *, object, 0x48), 0x14), 1,
                position, ((s32)FIELD(s8, object, 0x8b) >> 3) & 3);
        }
    }

    u8 display[12];
    func_ov042_021fcf80(display);
    if (FIELD(s32, object, 0x74) == 0) {
        void *ownerState = FIELD(void *, FIELD(void *, object, 0x48), 0x0c);
        func_ov042_021fda0c(display, (u8 *)ownerState + 0x160);
        func_ov042_021ff2f8(display, (u8 *)object + 0x50);
    } else {
        func_ov042_021fda0c(display, (u8 *)object + 0x50);
    }
    func_020a1794(FIELD(void *, object, 0x48), display,
                  (u8 *)FIELD(void *, object, 0x4c) + 0x2c, 0);
}
