#include "tingle/types.h"

/*
 * Overlay 42 dual-pool update. This recovered routine advances a 100-record
 * lightweight motion pool and a 48-record presentation pool with independent
 * marker-specific lifetimes, animation completion, transforms, and release.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 numerator, s32 denominator);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" void func_ov042_021fe9e4(void *pool, s32 index);
extern "C" void func_ov042_021fea08(void *pool, s32 index);
extern "C" s16 gFx32CosSinTable[];

static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

static void set_scale(void *presentation, s32 scale)
{
    FIELD(u16, presentation, 0x3c) = (u16)(s16)scale;
    FIELD(u16, presentation, 0x3e) = (u16)(s16)scale;
}

/*
 * Given the pool owner, scan lightweight slots 99..0. Marker zero integrates
 * position +0x4C from velocity +0x4FC and releases outside X [-0xB4000,
 * 0xB4000] or Y [-0x110000,0x104000]. Markers 1 and 7 damp both velocity
 * components by 0x148/4096, add 0x11F to vertical velocity, integrate, and
 * release after 36 and 32 ticks. Markers 2/3/4 simply integrate and release
 * after 20/36/24 ticks; marker 5 lasts two ticks; marker 6 adds 0x444 to its
 * vertical velocity, decrements age, and releases at age four or below.
 *
 * Then scan presentation slots 47..0. Mode zero releases after eight ticks;
 * mode one moves child Y by -0x1800 and releases after 20; mode two waits for
 * its animation-complete flag. Mode three runs a confirmed multi-stage effect:
 * grow toward scale 256, orbit using two sine-table phases until tick 1000,
 * ease along the stored +0x122C vector across ticks 1000..1050, then continue
 * the final vector/scale contraction through tick 1085 before release. During
 * the easing window scale grows from 256 toward 384. Release helpers mutate
 * both free lists and presentation ownership; PRNG state changes when the long
 * effect replaces its initial age with a random value in [50,79]. No return.
 */
extern "C" void func_ov042_021feabc(void *pool)
{
    for (s32 i = 99; i >= 0; --i) {
        s32 marker = FIELD(s32, pool, 0xb3c + i * 4);
        void *position = (u8 *)pool + 0x4c + i * 12;
        void *velocity = (u8 *)pool + 0x4fc + i * 12;
        u16 *age = (u16 *)((u8 *)pool + 0xa74 + i * 2);
        if (marker == 0) {
            func_ov042_021ff2f8(position, velocity);
            s32 x = FIELD(s32, position, 4);
            s32 y = FIELD(s32, position, 8);
            if (x < -0xb4000 || x > 0xb4000 ||
                y < -0x110000 || y > 0x104000)
                func_ov042_021fe9e4(pool, i);
        } else if (marker == 1 || marker == 7) {
            FIELD(s32, velocity, 4) -= multiply_fx(FIELD(s32, velocity, 4), 0x148);
            FIELD(s32, velocity, 8) -= multiply_fx(FIELD(s32, velocity, 8), 0x148);
            FIELD(s32, velocity, 8) += 0x11f;
            func_ov042_021ff2f8(position, velocity);
            (*age)++;
            if (*age >= (marker == 1 ? 36 : 32))
                func_ov042_021fe9e4(pool, i);
        } else if (marker >= 2 && marker <= 4) {
            func_ov042_021ff2f8(position, velocity);
            (*age)++;
            const u16 lifetime[3] = {20, 36, 24};
            if (*age >= lifetime[marker - 2])
                func_ov042_021fe9e4(pool, i);
        } else if (marker == 5) {
            if (++*age >= 2)
                func_ov042_021fe9e4(pool, i);
        } else if (marker == 6) {
            FIELD(s32, velocity, 8) += 0x444;
            (*age)--;
            if (*age <= 4)
                func_ov042_021fe9e4(pool, i);
        }
    }

    for (s32 i = 47; i >= 0; --i) {
        s32 mode = FIELD(s32, pool, 0x14c8 + i * 4);
        u16 *age = (u16 *)((u8 *)pool + 0x1468 + i * 2);
        void *presentation = FIELD(void *, pool, 0xf28 + i * 4);
        if (mode == 0) {
            if (++*age > 8)
                func_ov042_021fea08(pool, i);
            continue;
        }
        if (mode == 1) {
            (*age)++;
            FIELD(s32, presentation, 0x34) -= 0x1800;
            if (*age > 20)
                func_ov042_021fea08(pool, i);
            continue;
        }
        if (mode == 2) {
            void *animation = FIELD(void *, presentation, 0x0c);
            if ((FIELD(u16, animation, 0x24) & 1) != 0)
                func_ov042_021fea08(pool, i);
            continue;
        }
        if (mode != 3)
            continue;

        u16 time = ++*age;
        if (time < 50) {
            s32 scale = time * 18;
            if (scale > 256) {
                scale = 256;
                *age = (u16)((genrand_int32() % 30) + 50);
            }
            set_scale(presentation, scale);
        } else if (time < 1000) {
            u16 phaseX = (u16)(time * 1600);
            u16 phaseY = (u16)(time * 0x8fc);
            FIELD(s32, presentation, 0x30) +=
                gFx32CosSinTable[(phaseX >> 4) * 2];
            FIELD(s32, presentation, 0x34) +=
                gFx32CosSinTable[(phaseY >> 4) * 2 + 1];
        } else if (time < 1025) {
            u16 phase = (u16)((time - 1000) * 0x28f);
            if (phase > 0x4000)
                phase = 0x4000;
            s32 factor = 0x1000 - gFx32CosSinTable[(phase >> 4) * 2];
            void *vector = (u8 *)pool + 0x122c + i * 12;
            FIELD(s32, presentation, 0x30) -=
                multiply_fx(FIELD(s32, vector, 0), factor);
            FIELD(s32, presentation, 0x34) -=
                multiply_fx(FIELD(s32, vector, 4), factor);
        } else if (time < 1050) {
            u16 phase = (u16)((time - 1025) * 0x3c3);
            if (phase > 0x4000)
                phase = 0x4000;
            s32 factor = 0x14cd - gFx32CosSinTable[(phase >> 4) * 2];
            void *vector = (u8 *)pool + 0x122c + i * 12;
            FIELD(s32, presentation, 0x30) +=
                multiply_fx(FIELD(s32, vector, 0), factor);
            FIELD(s32, presentation, 0x34) +=
                multiply_fx(FIELD(s32, vector, 4), factor);
        } else if (time < 1085) {
            u16 elapsed = (u16)(time - 1050);
            u16 phase = (u16)(elapsed * 0x1d4);
            if (phase > 0x4000)
                phase = 0x4000;
            s32 factor = 0x1800 - gFx32CosSinTable[(phase >> 4) * 2];
            void *vector = (u8 *)pool + 0x122c + i * 12;
            FIELD(s32, presentation, 0x30) -=
                multiply_fx(FIELD(s32, vector, 0), factor);
            FIELD(s32, presentation, 0x34) -=
                multiply_fx(FIELD(s32, vector, 4), factor);
            s32 scale = 0x180 - ((elapsed * 0x180) / 35);
            set_scale(presentation, scale);
            if (scale < 24)
                func_ov042_021fea08(pool, i);
        }

        time = *age;
        if (time >= 1000 && time < 1050) {
            s32 scale = 0x100 + (((time - 1000) << 7) / 50);
            if (scale > 0x180)
                scale = 0x180;
            set_scale(presentation, scale);
        }
    }
}
