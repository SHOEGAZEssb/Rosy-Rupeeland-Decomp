#include "tingle/types.h"

/*
 * Overlay 42 variant-3 state machine. This recovered update drives a staged
 * moving attacker, its periodic projectiles, damage response, death motion,
 * flashing, animation, and presentation position.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, u8 index);
extern "C" void func_020a1794(void *scene, const void *position,
                                void *destination, s32 unused);
extern "C" void func_020a1ec0(void *scene, u32 effect);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_021ff2f8(void *destination, const void *source);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" void func_ov042_021fda24(void *pool, s32 type,
                                      const void *position, s32 variant);
extern "C" void func_ov042_022051a8(void *pool, s32 subtype,
                                      const void *position, u16 angle);
extern "C" void func_ov042_021fe41c(void *pool, const void *position);
extern "C" void func_ov042_02209944(void *destination, const void *source);
extern "C" void func_ov042_02200afc(void *destination, const void *owner);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 kind, s32 flags);
extern "C" s16 gFx32CosSinTable[];
extern "C" s32 data_ov042_0220b6e4[];
extern "C" s32 data_ov042_0220b6e8[];

static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

static s32 vector_length(s32 x, s32 y)
{
    return func_020adc40(multiply_fx(x, x) + multiply_fx(y, y));
}

static void enter_fall(void *object)
{
    FIELD(s32, object, 0x78) = 5;
    void *ownerState = FIELD(void *, FIELD(void *, object, 0x48), 0x0c);
    func_ov042_02209944((u8 *)object + 0x50, (u8 *)ownerState + 0xa4);
    u8 subtype = FIELD(u8, object, 0x8e);
    FIELD(s32, object, 0x60) = data_ov042_0220b6e4[subtype * 2] << 12;
    FIELD(s32, object, 0x64) = data_ov042_0220b6e8[subtype * 2] << 12;
}

/*
 * Increment timer +0x84 and dispatch state +0x78. State 2 damps and integrates
 * velocity +0x68 toward target +0x5C, then copies that target and enters state
 * 3. State 3 oscillates +0x60 using the cosine table and phase +0x70 until the
 * phase exceeds 0x8000. State 4 advances angle +0x8C, applies a growing sine
 * displacement, emits subtype-2 pool records and secondary bursts every eight
 * ticks, increments owner counter +0x1EC, and after 400 ticks enters state 5.
 * State 5 derives a velocity from target-current with factor 0x11F, integrates
 * it, and returns to state zero after passing the target. State 100 flashes,
 * jitters a burst every four ticks, and advances to 101 when its counter ends.
 *
 * The displayed position normally follows +0x50; states zero and five also add
 * the owner-derived offset from func_ov042_02200afc. Active states 2..4 accept
 * radius-0x18000 collision damage, select animation two during a 30-tick hit
 * flash, and on depletion enter state 5, select animation three, and dispatch
 * effect 0xEB86. Geometry/presentation, animation, audio/effect, PRNG, collision,
 * and particle-pool state can change. No value is returned.
 */
extern "C" void func_ov042_02209360(void *object)
{
    s32 timer = ++FIELD(s32, object, 0x84);
    s32 state = FIELD(s32, object, 0x78);
    if (state == 2) {
        s32 dx = FIELD(s32, object, 0x60) - FIELD(s32, object, 0x54);
        s32 dy = FIELD(s32, object, 0x64) - FIELD(s32, object, 0x58);
        (void)vector_length(dx, dy);
        FIELD(s32, object, 0x6c) -= multiply_fx(FIELD(s32, object, 0x6c), 0x52);
        FIELD(s32, object, 0x70) -= multiply_fx(FIELD(s32, object, 0x70), 0x52);
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
        if (FIELD(s32, object, 0x58) > FIELD(s32, object, 0x64)) {
            func_ov042_021fda0c((u8 *)object + 0x50, (u8 *)object + 0x5c);
            FIELD(s32, object, 0x78)++;
            FIELD(s32, object, 0x84) = 0;
            FIELD(s32, object, 0x6c) =
                FIELD(s32, object, 0x60) - FIELD(s32, object, 0x74);
            FIELD(s32, object, 0x70) = 0;
        }
    } else if (state == 3) {
        s32 phase = FIELD(s32, object, 0x70);
        s16 cosine = gFx32CosSinTable[((phase >> 4) * 2) + 1];
        s32 amplitude = (cosine + 0x1000) / 2;
        FIELD(s32, object, 0x60) = FIELD(s32, object, 0x74) +
            multiply_fx(amplitude, FIELD(s32, object, 0x6c));
        FIELD(s32, object, 0x70) = phase + 0x190;
        FIELD(s32, object, 0x84) = 0;
        if (FIELD(s32, object, 0x70) > 0x8000)
            FIELD(s32, object, 0x78)++;
    }
    state = FIELD(s32, object, 0x78);
    if (state == 4) {
        FIELD(u16, object, 0x8c) += 250;
        s32 growth = timer / 2;
        if (growth > 49)
            growth = 49;
        s16 sine = gFx32CosSinTable[(FIELD(u16, object, 0x8c) >> 4) * 2];
        FIELD(s32, object, 0x54) = FIELD(s32, object, 0x60) + growth * sine;
        s32 emission = ++FIELD(s32, object, 0x88);
        if ((emission & 7) == 1) {
            u8 position[12];
            func_ov042_02203658(position, (u8 *)object + 0x50);
            FIELD(s32, position, 8) += 0x20000;
            void *owner = FIELD(void *, object, 0x48);
            func_ov042_022051a8(
                FIELD(void *, FIELD(void *, owner, 0x0c), 0xa0),
                2, position, 0);
            func_ov042_021fe41c(FIELD(void *, owner, 0x14), position);
        }
        if (timer > 400)
            enter_fall(object);
        void *ownerState = FIELD(void *, FIELD(void *, object, 0x48), 0x0c);
        FIELD(s32, ownerState, 0x1ec)++;
    } else if (state == 5) {
        s32 dx = FIELD(s32, object, 0x60) - FIELD(s32, object, 0x54);
        s32 dy = FIELD(s32, object, 0x64) - FIELD(s32, object, 0x58);
        (void)vector_length(dx, dy);
        FIELD(s32, object, 0x6c) = multiply_fx(dy, 0x11f);
        FIELD(s32, object, 0x70) = multiply_fx(dx, 0x11f) - 0x1000;
        func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)object + 0x68);
        if (dx >= 0) {
            func_ov042_021fda0c((u8 *)object + 0x50, (u8 *)object + 0x5c);
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 0);
            FIELD(s32, object, 0x78) = 0;
        }
    } else if (state == 100) {
        s8 flash = FIELD(s8, object, 0x8f);
        if (flash > 0) {
            FIELD(s8, object, 0x8f) = --flash;
            if (flash == 0)
                FIELD(s32, object, 0x78) = 101;
        }
        void *child = FIELD(void *, object, 0x4c);
        if ((FIELD(s8, object, 0x8f) & 2) == 0)
            FIELD(u16, child, 0x42) |= 4;
        else
            FIELD(u16, child, 0x42) &= (u16)~4;
        if ((FIELD(s8, object, 0x8f) & 3) == 0) {
            u8 position[12];
            func_ov042_021fcf80(position);
            func_ov042_021fda0c(position, (u8 *)object + 0x50);
            FIELD(s32, position, 4) += ((s32)(genrand_int32() & 31) - 16) << 12;
            FIELD(s32, position, 8) += ((s32)(genrand_int32() & 63) - 32) << 12;
            func_ov042_021fda24(
                FIELD(void *, FIELD(void *, object, 0x48), 0x14), 1,
                position, ((s32)FIELD(s8, object, 0x8f) >> 3) & 3);
        }
    }

    u8 display[12];
    func_ov042_021fcf80(display);
    func_ov042_021fda0c(display, (u8 *)object + 0x50);
    state = FIELD(s32, object, 0x78);
    if (state == 0 || state == 5) {
        u8 offset[12];
        func_ov042_02200afc(offset, FIELD(void *, object, 0x48));
        func_ov042_021ff2f8(display, offset);
    }
    func_020a1794(FIELD(void *, object, 0x48), display,
                  (u8 *)FIELD(void *, object, 0x4c) + 0x2c, 0);

    state = FIELD(s32, object, 0x78);
    if (state >= 2 && state < 100 && state != 5) {
        u8 query[12];
        func_ov042_02203658(query, display);
        void *owner = FIELD(void *, object, 0x48);
        s32 damage = func_ov071_02211a10(
            FIELD(void *, FIELD(void *, owner, 8), 0xe8), query,
            0x18000, 0, 0);
        if (damage > 0) {
            if (FIELD(s8, object, 0x8f) == 0) {
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 2);
                FIELD(s8, object, 0x8f) = 30;
            }
            FIELD(s32, object, 0x80) -= damage;
            if (FIELD(s32, object, 0x80) <= 0) {
                enter_fall(object);
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 3);
                func_020a1ec0(owner, 0xeb86);
            }
        }
        if (FIELD(s8, object, 0x8f) > 0) {
            FIELD(s8, object, 0x8f)--;
            if (FIELD(s8, object, 0x8f) == 0)
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, object, 0x4c), 0x0c), 1);
        }
    }
}
