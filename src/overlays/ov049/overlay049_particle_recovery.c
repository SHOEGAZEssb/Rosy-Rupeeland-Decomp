#include "tingle/types.h"

/*
 * Overlay 49 particle/effect behavior. These recovered routines seed, burst,
 * transform, render, randomize, and step point-based effect records. Exact
 * assembly retains fixed-point arithmetic, random modulo sequences, and SDK
 * call ordering.
 */

/*
 * Find the last idle record whose cooldown exceeds 60 frames, copy its center
 * into `point`, arm it, reset its timer, and seed the cooldown from the RNG.
 * Return one when a record is acquired, otherwise zero. System storage, point,
 * and global RNG state can change; no hardware state changes directly.
 */
extern "C" u32 genrand_int32(void);

static s16 *particle_half(void *system, s32 offset, s32 index)
{
    return (s16 *)((u8 *)system + offset + index * 2);
}

static u8 *particle_record(void *system, s32 index)
{
    return (u8 *)system + index * 0x3c;
}

static s32 particle_idle(void *system, s32 index)
{
    return *particle_half(system, 0x644, index) == 0 &&
           *particle_half(system, 0x66c, index) == 0;
}

extern "C" s32 func_ov049_0220c254(void *system, void *point)
{
    for (s32 index = 9; index >= 0; --index) {
        u8 *record = particle_record(system, index);
        if (particle_idle(system, index) &&
            *particle_half(system, 0x694, index) > 0x3c) {
            *(s32 *)((u8 *)point + 4) = *(s32 *)(record + 0x20);
            *(s32 *)((u8 *)point + 8) = *(s32 *)(record + 0x24);
            *particle_half(system, 0x644, index) = 1;
            *particle_half(system, 0x66c, index) = 0;
            *particle_half(system, 0x694, index) = (s16)genrand_int32();
            return 1;
        }
    }
    return 0;
}

/*
 * Arm every idle record strictly inside a square around `point`, using a
 * 0x10000 radius for mode one and 0x28000 otherwise. Each timer receives a
 * random value from one through eight. Play the selector-specific sound once
 * when any record is armed and return whether that happened.
 */
extern "C" void *gSoundContext;
extern "C" void Sound_Play(void *, s32, s32);

extern "C" s32 func_ov049_0220c2dc(void *system, const void *point, s32 mode)
{
    s32 radius = mode == 1 ? 0x10000 : 0x28000;
    s32 armed = 0;
    for (s32 index = 9; index >= 0; --index) {
        u8 *record = particle_record(system, index);
        s32 dx = *(const s32 *)((const u8 *)point + 4) -
                 *(s32 *)(record + 0x20);
        s32 dy = *(const s32 *)((const u8 *)point + 8) -
                 *(s32 *)(record + 0x24);
        if (particle_idle(system, index) && dx < radius && dx > -radius &&
            dy < radius && dy > -radius) {
            *particle_half(system, 0x66c, index) =
                (s16)((genrand_int32() & 7) + 1);
            armed = 1;
        }
    }
    if (armed) {
        if (*(s32 *)system == 0)
            Sound_Play(gSoundContext, 0x63, 0xa);
        else
            Sound_Play(gSoundContext, 0x1c5, 4);
    }
    return armed;
}

/*
 * Return the index of the nearest idle record to `point` whose fixed-point
 * distance is below `limit`, or -1 when none qualify. The square root helper
 * is the only SDK/runtime call; system and point storage remain unchanged.
 */
extern "C" s32 func_020adc40(s32);

static s32 square_fx(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

extern "C" s32 func_ov049_0220c3d8(void *system, const void *point, s32 limit)
{
    s32 nearest = -1;
    for (s32 index = 9; index >= 0; --index) {
        u8 *record = particle_record(system, index);
        if (particle_idle(system, index)) {
            s32 dx = *(const s32 *)((const u8 *)point + 4) -
                     *(s32 *)(record + 0x20);
            s32 dy = *(const s32 *)((const u8 *)point + 8) -
                     *(s32 *)(record + 0x24);
            s32 squared = (s32)((u32)square_fx(dx) + (u32)square_fx(dy));
            s32 distance = func_020adc40(squared);
            if (distance < limit) {
                limit = distance;
                nearest = index;
            }
        }
    }
    return nearest;
}

/*
 * Resolve idle records inside the supplied X/Y radii away from `point`. The
 * normalized dominant axis selects which component moves; five stored trail
 * points receive the signed remaining penetration. System point coordinates
 * change, the ratio helper is called, and no direct hardware state changes.
 */
extern "C" s32 func_020adc90(s32, s32);

extern "C" void func_ov049_0220c48c(void *system, const void *point,
                                     s32 radiusX, s32 radiusY)
{
    for (s32 index = 9; index >= 0; --index) {
        u8 *record = particle_record(system, index);
        if (particle_idle(system, index)) {
            s32 dx = *(s32 *)(record + 0x20) -
                     *(const s32 *)((const u8 *)point + 4);
            s32 dy = *(s32 *)(record + 0x24) -
                     (*(const s32 *)((const u8 *)point + 8) + 0xa000);
            if (dx > -radiusX && dx < radiusX &&
                dy > -radiusY && dy < radiusY) {
                s32 absX = dx < 0 ? -dx : dx;
                s32 absY = dy < 0 ? -dy : dy;
                s32 ratioX = func_020adc90(absX, radiusX);
                s32 ratioY = func_020adc90(absY, radiusY);
                if (ratioX <= ratioY)
                    absX = 0;
                else
                    absY = 0;
                s32 moveX = radiusX - absX;
                s32 moveY = radiusY - absY;
                if (dx < 0) moveX = -moveX;
                else if (dx == 0) moveX = 0;
                if (dy < 0) moveY = -moveY;
                else if (dy == 0) moveY = 0;
                for (s32 pointIndex = 4; pointIndex >= 0; --pointIndex) {
                    u8 *trail = record + pointIndex * 0xc;
                    *(s32 *)(trail + 8) += moveX;
                    *(s32 *)(trail + 0xc) += moveY;
                }
            }
        }
    }
}

/*
 * Randomize an effect record's offset-derived direction and timer fields using
 * genrand_int32. Effect and RNG state change; nothing is returned and no SDK
 * rendering or hardware effect occurs directly.
 */
extern "C" void func_ov049_0220c67c(void *system)
{
    for (s32 index = 9; index >= 0; --index) {
        if (particle_idle(system, index))
            *particle_half(system, 0x66c, index) =
                (s16)((genrand_int32() & 7) + 1);
    }
}

/*
 * Expand the last negative-state record into five trail points around `point`
 * at `angle`, copy those points into the secondary array, initialize their
 * timers/angles, clear the record state, and choose a 200..295-frame cooldown.
 * At most one record is expanded. System and RNG state change; no MMIO occurs.
 */
extern "C" const s16 data_020c9670[];
extern "C" s32 func_020bf1f8(s32, s32);
extern "C" void func_ov049_0220c23c(void *, const void *);

static s32 multiply_fx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

extern "C" void func_ov049_0220c6cc(void *system, const void *point, s32 angle)
{
    for (s32 index = 9; index >= 0; --index) {
        if (*particle_half(system, 0x644, index) < 0) {
            s32 tableIndex = (angle >> 4) * 2;
            s32 sine = data_020c9670[tableIndex];
            s32 cosine = data_020c9670[tableIndex + 1];
            u8 *record = particle_record(system, index);
            for (s32 pointIndex = 4; pointIndex >= 0; --pointIndex) {
                s32 distance = (-9 * pointIndex) * 0x1000;
                u8 *trail = record + pointIndex * 0xc;
                u8 *secondary = (u8 *)system + 0x25c + index * 0x3c +
                                pointIndex * 0xc;
                u8 *source = (u8 *)system + 4 + index * 0x3c +
                             pointIndex * 0xc;
                *(s32 *)(trail + 8) =
                    *(const s32 *)((const u8 *)point + 4) + pointIndex * 100 +
                    multiply_fx(cosine, distance);
                *(s32 *)(trail + 0xc) =
                    *(const s32 *)((const u8 *)point + 8) +
                    multiply_fx(sine, distance);
                func_ov049_0220c23c(secondary, source);
                *(s32 *)((u8 *)system + 0x57c + index * 0x14 +
                         pointIndex * 4) = 0xf;
                *(s32 *)((u8 *)system + 0x4b4 + index * 0x14 +
                         pointIndex * 4) = angle;
            }
            *particle_half(system, 0x66c, index) = 0;
            *particle_half(system, 0x658, index) = 0;
            *particle_half(system, 0x644, index) = 0;
            *particle_half(system, 0x680, index) =
                (s16)(func_020bf1f8((s32)genrand_int32(), 0x14) * 5 + 0xc8);
            *particle_half(system, 0x694, index) = 0;
            break;
        }
    }
}
