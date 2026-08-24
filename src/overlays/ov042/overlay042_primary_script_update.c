#include "tingle/types.h"

/*
 * Overlay 42 primary encounter scripting. This recovered controller consumes
 * one of three packed scripts, steers the primary anchor through fixed
 * waypoints, and advances a large offset-derived action substate machine.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 numerator, s32 denominator);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_020a1ec0(void *owner, u32 effect);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" u16 data_ov042_0220adce[];
extern "C" u16 data_ov042_0220aec4[];
extern "C" u16 data_ov042_0220af9c[];
extern "C" s16 gFx32CosSinTable[];

static s32 multiply_fx(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

static s32 length_fx(s32 x, s32 y)
{
    return func_020adc40(multiply_fx(x, x) + multiply_fx(y, y));
}

static void set_target(void *scene, s32 x, s32 y)
{
    FIELD(s32, scene, 0x158) = x << 12;
    FIELD(s32, scene, 0x15c) = y << 12;
}

/*
 * Given the primary scene, select data_ov042_0220adce for mode +0x150 zero,
 * data_ov042_0220aec4 for mode one, or data_ov042_0220af9c for mode two. Each
 * halfword stores waypoint index in its low nibble and an action code in its
 * upper 12 bits; 0xFFFF wraps. Nine fixed waypoint pairs range from (-60,-160)
 * through (70,-10). Countdown +0xC0 normally reloads to 9999 and advances
 * cursor +0xBC, with owner state +0x1C8==7 restricting the first four entries.
 * Override +0x1E8 can replace zero-code entries with codes 2, 13, or 14 and
 * can force waypoint eight.
 *
 * While action timer +0xD0 is zero, damp velocity +0xB0 by 0x19A and steer
 * anchor +0xA4 toward +0x158/+0x15C. Codes below 14 use normalized strength
 * 0x4CD; codes 14/15 use 0x3D7. On reaching distance 0x7000, zero/15 resume the
 * script while other codes enter the action sequencer and initialize the
 * offset-derived fields +0x1CC..+0x1E0. Codes 1..12 select additional fixed
 * targets and branch selectors; code 13 starts a 110-tick special action and
 * confirmed effect 0xB582.
 *
 * The active sequencer uses +0xD8 as its major branch. Branch zero repeatedly
 * raises +0x1D4, writes impulse +0x1D8/+0x1DC, and plays effect 0xB585 before
 * returning to script motion. Branch one performs approach, jump, jitter,
 * falling/bounce, and recovery windows, with mode-dependent vertical impulses
 * and effects 0xB582/0xB583. Branch two runs a 131-tick cosine-driven descent,
 * updates +0x1D0/+0x1D4/+0x1D8/+0x1DC, and plays 0xB585 periodically. Later
 * branches damp +0x1CC and resume after 20 ticks. Exact higher-level meanings
 * of these offset fields remain inferred; confirmed writes and thresholds are
 * represented below. PRNG, audio/effect, anchor, and script state change.
 */
extern "C" void func_ov042_02201234(void *scene)
{
    static const s32 waypoints[9][2] = {
        {0, -140}, {-10, -150}, {10, -150}, {-60, -160},
        {70, -160}, {-60, -10}, {70, -10}, {0, -130}, {0, -80}
    };
    const u16 *script = data_ov042_0220adce;
    s32 mode = FIELD(s32, scene, 0x150);
    if (mode == 1)
        script = data_ov042_0220aec4;
    else if (mode == 2)
        script = data_ov042_0220af9c;

    if (--FIELD(s32, scene, 0xc0) <= 0) {
        if (FIELD(s32, scene, 0xdc) != 0) {
            FIELD(s32, scene, 0xdc) = 0;
            FIELD(s32, scene, 0xbc) = 0;
        }
        s32 cursor = FIELD(s32, scene, 0xbc);
        u16 token = script[cursor];
        FIELD(s32, scene, 0xc8) = token & 15;
        FIELD(s32, scene, 0xcc) = token >> 4;
        FIELD(s32, scene, 0xd0) = 0;

        s32 overrideState = FIELD(s32, scene, 0x1e8);
        if (overrideState != 0 && FIELD(s32, scene, 0xcc) == 0) {
            FIELD(s32, scene, 0xbc)--;
            FIELD(s32, scene, 0xc8) = 8;
            if (overrideState == 1) {
                FIELD(s32, scene, 0x1e8) = 2;
            } else if (overrideState == 3) {
                FIELD(s32, scene, 0xcc) = 13;
            } else if (overrideState == 4) {
                FIELD(s32, scene, 0xcc) = 14;
            } else if (overrideState == 5) {
                FIELD(s32, scene, 0xc8) = 0;
                FIELD(s32, scene, 0xcc) = 0;
                FIELD(s32, scene, 0x1e8) = 0;
            }
        }

        s32 code = FIELD(s32, scene, 0xcc);
        if (code == 0 || code == 15) {
            s32 waypoint = FIELD(s32, scene, 0xc8);
            set_target(scene, waypoints[waypoint][0], waypoints[waypoint][1]);
        } else {
            func_ov042_021fda0c((u8 *)scene + 0x154,
                                (u8 *)scene + 0xa4);
        }
        FIELD(s32, scene, 0xc0) = 9999;
        cursor = ++FIELD(s32, scene, 0xbc);
        if (script[cursor] == 0xffff)
            FIELD(s32, scene, 0xbc) = 0;
        if (FIELD(s32, FIELD(void *, scene, 0x48), 0x1c8) == 7 &&
            FIELD(s32, scene, 0xbc) >= 4)
            FIELD(s32, scene, 0xbc) = 0;
    }

    s32 dx = FIELD(s32, scene, 0x158) - FIELD(s32, scene, 0xa8);
    s32 dy = FIELD(s32, scene, 0x15c) - FIELD(s32, scene, 0xac);
    s32 distance = length_fx(dx, dy);
    FIELD(s32, scene, 0xb4) -= multiply_fx(FIELD(s32, scene, 0xb4), 0x19a);
    FIELD(s32, scene, 0xb8) -= multiply_fx(FIELD(s32, scene, 0xb8), 0x19a);

    if (FIELD(s32, scene, 0xd0) == 0) {
        if (distance > 0) {
            s32 strength = FIELD(s32, scene, 0xcc) >= 14 ? 0x3d7 : 0x4cd;
            FIELD(s32, scene, 0xb4) +=
                multiply_fx(func_020adc90(dx, distance), strength);
            FIELD(s32, scene, 0xb8) +=
                multiply_fx(func_020adc90(dy, distance), strength);
            func_ov042_021ff2f8((u8 *)scene + 0xa4,
                                (u8 *)scene + 0xb0);
        }
        if (distance > 0x7000)
            return;

        s32 code = FIELD(s32, scene, 0xcc);
        if (code == 0 || code == 15) {
            FIELD(s32, scene, 0xc0) = 0;
            if (FIELD(s32, scene, 0x1e8) >= 2)
                FIELD(s32, scene, 0x1e8)++;
            return;
        }

        FIELD(s32, scene, 0xd0) = 1;
        FIELD(s32, scene, 0x1d4) = 0;
        FIELD(s32, scene, 0x1e0) = 0;
        FIELD(s32, scene, 0xd8) = 0;
        s32 phase = code - 1;
        if (phase <= 1) {
            set_target(scene, waypoints[phase + 3][0], waypoints[phase + 3][1]);
            FIELD(s32, scene, 0x1d0) = phase;
        } else if (phase == 2) {
            set_target(scene, waypoints[4][0], waypoints[4][1]);
            FIELD(s32, scene, 0x1d0) = 0;
        } else if (phase == 3) {
            set_target(scene, waypoints[3][0], waypoints[3][1]);
            FIELD(s32, scene, 0x1d0) = 1;
        } else if (phase >= 4 && phase <= 7) {
            s32 waypoint = phase - 1;
            set_target(scene, waypoints[waypoint][0], waypoints[waypoint][1]);
            FIELD(s32, scene, 0x1d0) = (phase - 4) & 1;
            if (phase >= 6)
                FIELD(s32, scene, 0xd8) = phase >= 8 ? 1 : 0;
        } else if (phase >= 8 && phase <= 11) {
            s32 waypoint = phase - 5;
            set_target(scene, waypoints[waypoint][0], waypoints[waypoint][1]);
            FIELD(s32, scene, 0xd8) = 1;
        } else if (phase == 12) {
            func_020a1ec0(FIELD(void *, scene, 0x48), 0xb582);
            FIELD(s32, scene, 0xd0) = 110;
            FIELD(s32, scene, 0xd8) = 1;
            if (FIELD(s32, scene, 0xc8) == 8) {
                FIELD(s32, scene, 0x1e0) = 1;
                FIELD(s32, scene, 0x1cc) = 40;
            }
        }
        return;
    }

    s32 branch = FIELD(s32, scene, 0xd8);
    s32 code = FIELD(s32, scene, 0xcc);
    if (branch == 0) {
        s32 phase = code - 1;
        s32 interval = (phase == 7 || phase == 8) ? 13 : 0;
        s32 timer = ++FIELD(s32, scene, 0xd0);
        if (timer >= interval) {
            if (FIELD(s32, scene, 0x1d4) == 0 ||
                FIELD(s32, scene, 0x1d4) == 15)
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb585);
            FIELD(s32, scene, 0x1d4)++;
            FIELD(s32, scene, 0x1d8) = 4000;
            FIELD(s32, scene, 0x1dc) = 1024;
        }
        if (timer == interval + 40) {
            FIELD(s32, scene, 0x1d4) = 0;
            if (phase == 7 || phase == 8) {
                FIELD(s32, scene, 0xd0) = 0;
                FIELD(s32, scene, 0x1cc) = 0;
                FIELD(s32, scene, 0xc0) = 0;
                FIELD(s32, scene, 0xd8) = 0;
            } else {
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb582);
                FIELD(s32, scene, 0xd0) = 70;
                FIELD(s32, scene, 0xd8)++;
            }
        }
        return;
    }

    if (branch == 1) {
        s32 phase = code - 1;
        s32 base = 70;
        if (phase <= 1)
            base -= mode * 7;
        else if (phase <= 3)
            base += 30 - mode * 6;
        else if (phase <= 5)
            base += 18;
        else if (phase >= 8 && phase <= 12)
            base -= 15;

        s32 timer = FIELD(s32, scene, 0xd0);
        if (timer < base + 35) {
            FIELD(s32, scene, 0xd0) = ++timer;
            if (timer == base + 35)
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb582);
            FIELD(s32, scene, 0xb4) = multiply_fx(dx, 0x19a);
            FIELD(s32, scene, 0xb8) = multiply_fx(dy, 0x19a);
            func_ov042_021ff2f8((u8 *)scene + 0xa4,
                                (u8 *)scene + 0xb0);
            if (timer >= base && FIELD(s32, scene, 0x1cc) < 30)
                FIELD(s32, scene, 0x1cc) += 2;
        } else if (timer < base + 50) {
            if (FIELD(s32, scene, 0x1e0) != 0)
                FIELD(s32, scene, 0xb8) += 0x1d9a;
            else if (mode == 2)
                FIELD(s32, scene, 0xb8) += 0x1ae1;
            else if (mode == 1)
                FIELD(s32, scene, 0xb8) += 0x1000;
            else
                FIELD(s32, scene, 0xb8) += 0xd48;
            FIELD(s32, scene, 0xb4) = 0;
            func_ov042_021ff2f8((u8 *)scene + 0xa4,
                                (u8 *)scene + 0xb0);
            if (FIELD(s32, scene, 0xac) >
                (FIELD(s32, scene, 0x1e0) ? 0xd2000 : 0xb4000)) {
                FIELD(s32, scene, 0xd0) = base + 50;
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb583);
            }
        } else if (timer < base + 70) {
            FIELD(s32, scene, 0xa8) = FIELD(s32, scene, 0x158) +
                ((s32)(genrand_int32() % 10) - 5) * 0x1000;
            FIELD(s32, scene, 0xac) =
                (FIELD(s32, scene, 0x1e0) ? 0xd2000 : 0xb4000) +
                ((s32)(genrand_int32() % 10) - 5) * 0x1000;
            FIELD(s32, scene, 0xd0)++;
        } else if (timer == base + 70) {
            if (FIELD(s32, scene, 0x1cc) > 0)
                FIELD(s32, scene, 0x1cc)--;
            if (FIELD(s32, scene, 0x1e0) == 0) {
                FIELD(s32, scene, 0xb4) +=
                    FIELD(s32, scene, 0xa8) > 0 ? -0x333 : 0x333;
                FIELD(s32, scene, 0xb8) -= 0xb33;
                func_ov042_021ff2f8((u8 *)scene + 0xa4,
                                    (u8 *)scene + 0xb0);
                if (FIELD(s32, scene, 0xac) < -0x6e000)
                    FIELD(s32, scene, 0xd0)++;
            } else {
                FIELD(s32, scene, 0xa8) = FIELD(s32, scene, 0x158) +
                    ((s32)(genrand_int32() % 10) - 5) * 3000;
                FIELD(s32, scene, 0xac) -= 0xccd;
                if (FIELD(s32, scene, 0xac) < 0xa5000)
                    FIELD(s32, scene, 0x1e0) = 0;
            }
        } else {
            func_ov042_021ff2f8((u8 *)scene + 0xa4,
                                (u8 *)scene + 0xb0);
            if (++FIELD(s32, scene, 0xd0) > base + 80) {
                FIELD(s32, scene, 0xc0) = 0;
                if (FIELD(s32, scene, 0x1e8) == 4)
                    FIELD(s32, scene, 0x1e8)++;
            }
        }
        return;
    }

    if (branch == 2) {
        s32 timer = ++FIELD(s32, scene, 0xd0);
        if (timer < 131) {
            u16 phase = (u16)(timer * 0x1ddc + 0x8000);
            s16 cosine = gFx32CosSinTable[((phase >> 4) * 2) + 1];
            FIELD(s32, scene, 0xac) -=
                multiply_fx(cosine + 0x1000, 0x1ccd);
            FIELD(s32, scene, 0x1d4)++;
            FIELD(s32, scene, 0x1d0) = 2;
            FIELD(s32, scene, 0x1d8) = 0x1ddc;
            FIELD(s32, scene, 0x1dc) = 0x800;
            FIELD(s32, scene, 0x1cc) = 0;
            if (timer % 44 == 11)
                func_020a1ec0(FIELD(void *, scene, 0x48), 0xb585);
        } else {
            FIELD(s32, scene, 0xc0) = 0;
            if (FIELD(s32, scene, 0x1e8) == 3)
                FIELD(s32, scene, 0x1e8)++;
        }
        return;
    }

    if (FIELD(s32, scene, 0x1cc) > 0) {
        FIELD(s32, scene, 0x1cc) -= 2;
        if (FIELD(s32, scene, 0x1cc) < 0)
            FIELD(s32, scene, 0x1cc) = 0;
    }
    FIELD(s32, scene, 0xb4) += multiply_fx(dx, 0x29);
    FIELD(s32, scene, 0xb8) += multiply_fx(dy, 0x29);
    func_ov042_021ff2f8((u8 *)scene + 0xa4, (u8 *)scene + 0xb0);
    if (++FIELD(s32, scene, 0xd0) > 20)
        FIELD(s32, scene, 0xc0) = 0;
}
