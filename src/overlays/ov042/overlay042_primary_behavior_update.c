#include "tingle/types.h"

/*
 * Overlay 42 primary actor behavior. This recovered controller interprets
 * three packed movement scripts and dispatches attacks involving the main
 * actor, its five variant actors, beam collision, particles, and looped audio.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u16 data_ov042_0220b19c[];
extern "C" u16 data_ov042_0220b25a[];
extern "C" u16 data_ov042_0220b31c[];
extern "C" void *gSoundContext;
extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 value, s32 modulus);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" s32 func_020ae024(s32 x, s32 y);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *animation, s32 index);
extern "C" void func_020a1ec0(void *owner, u32 effect);
extern "C" void func_020a1f04(void *owner, u32 sequence);
extern "C" void Sound_StopDirectSequence(void *sound, s32 sequence, s32 value);
extern "C" void func_0205943c(void *sound, s32 sequence, s32 parameter,
                               s32 value, s32 arg0, s32 arg1);
extern "C" void func_020a1794(void *owner, const void *position,
                               const void *display, s32 arg);
extern "C" void VecFx32Object_Init(void *object);
extern "C" void VecFx32Object_Destroy(void *object);
extern "C" void func_ov042_021fcf80(void *vector);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" void func_ov042_021fde00(void *effects, s32 angle, const void *position);
extern "C" void func_ov042_021fdd48(void *effects, s32 kind, const void *position);
extern "C" void func_ov042_02209af4(void *variant, s32 state, const void *position);
extern "C" void func_ov042_022051a8(void *pool, s32 kind, const void *position, s32 velocity);
extern "C" void func_ov042_02205d74(void *display, s32 xScale, s32 yScale);
extern "C" void func_ov042_02206fc0(void *out, const void *position, const void *direction);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 category, s32 *extra);
extern "C" void func_ov071_022113fc(void *world, s32 value, const void *position);

/* Multiply two fx32 values with the SDK's usual rounding. */
static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/* Compute a two-dimensional fx32 length through the recovered SDK helper. */
static s32 length_fx(s32 x, s32 y)
{
    return func_020adc40(multiply_fx(x, x) + multiply_fx(y, y));
}

/* Return the animation object referenced by a scene display wrapper. */
static void *animation_of(void *display)
{
    return FIELD(void *, display, 0xc);
}

/* Select an animation and optionally clear its completion/hold bit. */
static void set_animation(void *display, s32 animation, s32 clearHold)
{
    void *object = animation_of(display);
    GraphicsSpriteState_SetAnimationIndex(object, animation);
    if (clearHold)
        FIELD(u16, object, 0x24) &= ~2;
}

/* Start one variant actor and the confirmed 0xB503 presentation effect. */
static void start_variant(void *scene, s32 slot, s32 state)
{
    func_ov042_02209af4(FIELD(void *, scene, 0x8c + slot * 4), state,
                         (u8 *)scene + 0xa4);
    func_020a1ec0(FIELD(void *, scene, 0x48), 0xb503);
}

/* End an action and restore the primary and secondary display controls. */
static void finish_action(void *scene)
{
    void *primary = FIELD(void *, scene, 0x4c);
    set_animation(primary, 0, 0);
    FIELD(u16, animation_of(primary), 0x24) |= 2;
    FIELD(u16, FIELD(void *, scene, 0x50), 0x42) |= 4;
    FIELD(s32, scene, 0x20c) = 0;
    FIELD(s32, scene, 0xc0) = 0;
}

/*
 * Advance the primary actor's scripted movement and attack state. The scene is
 * both input and output; it owns script cursor +0xBC, delay +0xC0, target token
 * fields +0xC8/+0xCC, action timer +0xD0, motion +0xA4..+0xB8, beam state
 * +0x20C..+0x220, delayed effect state +0x22C..+0x238, and sound flags +0x1EC.
 * Packed script low nibbles select one of thirteen fixed points and upper bits
 * select actions. It returns nothing and may alter animation, collision-world,
 * particle, sound, and presentation SDK state. Some action names are inferred;
 * offsets, thresholds, and confirmed effect identifiers remain explicit.
 */
extern "C" void func_ov042_02205d80(void *scene)
{
    static const s32 points[13][2] = {
        {0, -80}, {-10, -86}, {10, -86}, {0, -100}, {90, -110},
        {-110, -110}, {110, -110}, {-100, -20}, {70, -20},
        {-60, -60}, {0, -60}, {80, -60}, {90, -110}
    };
    const u16 *script = data_ov042_0220b19c;
    if (FIELD(s32, scene, 0x150) == 1)
        script = data_ov042_0220b25a;
    else if (FIELD(s32, scene, 0x150) == 2)
        script = data_ov042_0220b31c;

    --FIELD(s32, scene, 0xc0);
    if (FIELD(s32, scene, 0xc0) <= 0) {
        u16 token = script[FIELD(s32, scene, 0xbc)];
        s32 point = token & 0xf;
        FIELD(s32, scene, 0xc8) = point;
        FIELD(s32, scene, 0xcc) = token >> 4;
        FIELD(s32, scene, 0xd0) = 0;
        FIELD(s32, scene, 0x158) = points[point][0] << 12;
        FIELD(s32, scene, 0x15c) = points[point][1] << 12;
        FIELD(s32, scene, 0xc0) = 20000;
        ++FIELD(s32, scene, 0xbc);
        if (script[FIELD(s32, scene, 0xbc)] == 0xffff)
            FIELD(s32, scene, 0xbc) = 1;
        if (FIELD(s32, FIELD(void *, scene, 0x48), 0x1c8) == 5 &&
            FIELD(s32, scene, 0xbc) >= 5)
            FIELD(s32, scene, 0xbc) = 1;
    }

    s32 dx = FIELD(s32, scene, 0x158) - FIELD(s32, scene, 0xa8);
    s32 dy = FIELD(s32, scene, 0x15c) - FIELD(s32, scene, 0xac);
    s32 distance = length_fx(dx, dy);
    FIELD(s32, scene, 0xb4) -= multiply_fx(FIELD(s32, scene, 0xb4), 0x19a);
    FIELD(s32, scene, 0xb8) -= multiply_fx(FIELD(s32, scene, 0xb8), 0x19a);

    if (FIELD(s32, scene, 0xd0) == 0) {
        s32 strength = FIELD(s32, scene, 0xcc) == 15 ? 0x28f : 0x333;
        FIELD(s32, scene, 0xb4) += multiply_fx(func_020adc90(dx, distance), strength);
        FIELD(s32, scene, 0xb8) += multiply_fx(func_020adc90(dy, distance), strength);
        func_ov042_021ff2f8((u8 *)scene + 0xa4, (u8 *)scene + 0xb0);
        if (distance <= 0x5000) {
            s32 action = FIELD(s32, scene, 0xcc);
            if (action == 0) {
                FIELD(s32, scene, 0xc0) = 0;
            } else {
                FIELD(s32, scene, 0xd0) = 1;
                FIELD(u16, animation_of(FIELD(void *, scene, 0x4c)), 0x24) |= 2;
                if (action == 1 || action == 2) set_animation(FIELD(void *, scene, 0x4c), 12, 1);
                else if (action == 3 || action == 6) set_animation(FIELD(void *, scene, 0x4c), 13, 1);
                else if (action == 4) {
                    set_animation(FIELD(void *, scene, 0x4c), 2, 0);
                    func_020a1ec0(FIELD(void *, scene, 0x48), 0xb509);
                } else if (action == 5) set_animation(FIELD(void *, scene, 0x4c), 4, 0);
                else if (action == 15) set_animation(FIELD(void *, scene, 0x4c), 14, 0);
            }
        }
    } else {
        s32 tick = ++FIELD(s32, scene, 0xd0);
        s32 action = FIELD(s32, scene, 0xcc);
        s32 done = 0;
        if (action >= 1 && action <= 3) {
            if (tick == 2) {
                start_variant(scene, 0, action == 1 ? 6 : action + 2);
                FIELD(s32, scene, 0x230) = action;
                FIELD(s32, scene, 0x22c) = 1;
            }
            done = tick == 60;
        } else if (action == 4) {
            /* Confirmed beam/charge attack begins at tick 155. */
            if (tick == 147) set_animation(FIELD(void *, scene, 0x4c), 10, 0);
            if (tick == 155) {
                FIELD(s32, scene, 0x20c) = 0x1000;
                FIELD(s32, scene, 0x210) = 0x3000;
                FIELD(s32, scene, 0x220) = 0x1000;
                set_animation(FIELD(void *, scene, 0x4c), 3, 0);
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb505);
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb506);
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb50b);
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb50a);
            }
            if (tick >= 155) {
                void *world = FIELD(void *, FIELD(void *, scene, 0x48), 8);
                s32 beamDx = FIELD(s32, world, 0x98) - FIELD(s32, scene, 0xa8);
                s32 beamDy = FIELD(s32, world, 0x9c) - (FIELD(s32, scene, 0xac) + 0x28000);
                s32 beamLength = length_fx(beamDx, beamDy);
                s32 nx = func_020adc90(beamDx, beamLength);
                s32 ny = func_020adc90(beamDy, beamLength);
                FIELD(s32, scene, 0x224) = multiply_fx(FIELD(s32, scene, 0x20c),
                                                       func_020adc90(FIELD(s32, scene, 0x20c), beamLength) - 0x800) * 2;
                if (FIELD(s32, scene, 0x224) < 0)
                    FIELD(s32, scene, 0x224) = -FIELD(s32, scene, 0x224);
                FIELD(s32, scene, 0x20c) += FIELD(s32, scene, 0x210);
                if (FIELD(s32, scene, 0x20c) < 0x1000)
                    FIELD(s32, scene, 0x20c) = -1;
                if (FIELD(s32, scene, 0x20c) >= 0) {
                    FIELD(s32, scene, 0x218) = FIELD(s32, scene, 0xa8) + multiply_fx(nx, FIELD(s32, scene, 0x20c));
                    FIELD(s32, scene, 0x21c) = FIELD(s32, scene, 0xac) + 0x28000 + multiply_fx(ny, FIELD(s32, scene, 0x20c));
                    s32 query[3], extra = 0;
                    func_ov042_02203658(query, (u8 *)scene + 0x214);
                    s32 hit = func_ov071_02211a10(FIELD(void *, world, 0xe8), query,
                                                   0x28000, 3, &extra);
                    if (hit) {
                        FIELD(s32, scene, 0x220) += 0x7b;
                        if (FIELD(s32, scene, 0x220) > 0x1800) FIELD(s32, scene, 0x220) = 0x1800;
                        FIELD(s32, scene, 0x244) = 6;
                    } else {
                        FIELD(s32, scene, 0x220) -= 0x31;
                        if (FIELD(s32, scene, 0x220) < 0x1000) FIELD(s32, scene, 0x220) = 0x1000;
                    }
                    func_ov042_02205d74(FIELD(void *, scene, 0x50),
                                         FIELD(s32, scene, 0x220) >> 4,
                                         FIELD(s32, scene, 0x220) >> 4);
                }
            }
            done = tick >= 9939;
        } else if (action == 5) {
            if (tick == 5) start_variant(scene, 0, 0);
            if (tick == 20) start_variant(scene, 1, 1);
            if (tick == 35) start_variant(scene, 2, 2);
            if (tick == 50) start_variant(scene, 3, 3);
            done = tick >= 50;
        } else if (action == 6) {
            if (tick == 5) start_variant(scene, 4, 7);
            done = tick >= 30;
        } else if (action == 14) {
            if (tick == 1) set_animation(FIELD(void *, scene, 0x4c), 14, 0);
            if (tick == 30) set_animation(FIELD(void *, scene, 0x4c), 15, 0);
            done = tick > 100;
        } else if (action == 15) {
            s32 mode = FIELD(s32, scene, 0x150);
            if (mode == 0) {
                if (tick == 2) {
                    set_animation(FIELD(void *, scene, 0x54), 0, 0);
                    FIELD(u16, animation_of(FIELD(void *, scene, 0x54)), 0x24) |= 2;
                    FIELD(u16, FIELD(void *, scene, 0x54), 0x42) &= ~4;
                } else if (tick == 60) {
                    set_animation(FIELD(void *, scene, 0x4c), 15, 0);
                    func_020a1ec0(FIELD(void *, scene, 0x48), 0xb502);
                } else if (tick == 200) {
                    set_animation(FIELD(void *, scene, 0x54), 1, 1);
                } else if (tick > 200 &&
                           (FIELD(u16, animation_of(FIELD(void *, scene, 0x54)), 0x24) & 1)) {
                    FIELD(u16, FIELD(void *, scene, 0x54), 0x42) |= 4;
                    done = 1;
                }
            } else {
                if (tick == 2) set_animation(FIELD(void *, scene, 0x4c), mode == 1 ? 18 : 19, 0);
                done = tick > 100;
            }
        }
        if (done)
            finish_action(scene);
    }

    /* Delayed variant attacks feed a 240-frame debris/effect presentation. */
    if (FIELD(s32, scene, 0x22c) && ++FIELD(s32, scene, 0x22c) == 90) {
        FIELD(s32, scene, 0x238) = FIELD(s32, scene, 0x230);
        FIELD(s32, scene, 0x234) = 1;
        FIELD(s32, scene, 0x22c) = 0;
        Sound_StopDirectSequence(gSoundContext, 0xa4, 0);
        Sound_StopDirectSequence(gSoundContext, 0xa5, 0);
        Sound_StopDirectSequence(gSoundContext, 0xcd, 0);
    }
    if (FIELD(s32, scene, 0x234)) {
        s32 tick = ++FIELD(s32, scene, 0x234);
        s32 kind = FIELD(s32, scene, 0x238);
        if (tick == 30)
            func_020a1f04(FIELD(void *, scene, 0x48), kind == 1 ? 0xcd : kind + 0xa2);
        if (tick > 30) {
            s32 position[3];
            func_ov042_021fcf80(position);
            position[1] = ((s32)(genrand_int32() & 0xf) - 7) * 0x1000;
            position[2] = ((tick % 9) + 5) * 21 * 0x1000;
            func_ov042_021fdd48(FIELD(void *, FIELD(void *, scene, 0x48), 0x14), 0, position);
        }
        if (tick >= 240) {
            FIELD(s32, scene, 0x234) = 0;
            Sound_StopDirectSequence(gSoundContext, 0xa4, 0);
            Sound_StopDirectSequence(gSoundContext, 0xa5, 0);
            Sound_StopDirectSequence(gSoundContext, 0xcd, 0);
        }
    }

    /* Maintain looped channels while the corresponding variants are active. */
    s32 active = 0;
    for (s32 i = 0; i < 4; ++i)
        active += FIELD(s32, FIELD(void *, scene, 0x8c + i * 4), 0x74) == 2;
    if (active == 0 && (FIELD(u32, scene, 0x1ec) & 1)) {
        Sound_StopDirectSequence(gSoundContext, 0xea, 0);
        FIELD(u32, scene, 0x1ec) &= ~1;
    } else if (active > 0 && !(FIELD(u32, scene, 0x1ec) & 1)) {
        func_020a1f04(FIELD(void *, scene, 0x48), 0xea);
        FIELD(u32, scene, 0x1ec) |= 1;
    }
    active = FIELD(s32, FIELD(void *, scene, 0x9c), 0x74) == 2;
    if (!active && (FIELD(u32, scene, 0x1ec) & 2)) {
        Sound_StopDirectSequence(gSoundContext, 0xf0, 0);
        FIELD(u32, scene, 0x1ec) &= ~2;
    } else if (active && !(FIELD(u32, scene, 0x1ec) & 2)) {
        func_020a1f04(FIELD(void *, scene, 0x48), 0xf0);
        FIELD(u32, scene, 0x1ec) |= 2;
    }
}
