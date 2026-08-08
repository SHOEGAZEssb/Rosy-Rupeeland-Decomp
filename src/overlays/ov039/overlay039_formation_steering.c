#include "tingle/types.h"

/*
 * Overlay 39 formation-target steering. This recovered routine selects one of
 * two eight-point paths, derives normalized desired velocity toward the active
 * point, eases current velocity toward it, and advances the path on arrival.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039Vector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039Vector;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(Overlay039Vector *vector, s32 x, s32 y, s32 z);
extern void func_02004fe0(void *object);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *object);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_020adc40(s32 squaredDistance);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void func_ov039_021ff330(void *scene, s32 mode);
#ifdef __cplusplus
}
#endif

static s32 fixedMultiply(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

static s32 approachVelocity(s32 current, s32 desired, s32 negativeThreshold,
                            s32 positiveThreshold)
{
    const s32 step = 0x708;
    if (desired < negativeThreshold) {
        current += step;
    } else if (desired > positiveThreshold) {
        current -= step;
    } else if (current > 0) {
        current -= step;
        if (current < 0) current = 0;
    } else {
        current += step;
        if (current > 0) current = 0;
    }
    if (current > 0x3fff) current = 0x3fff;
    if (current < -0x4000) current = -0x4000;
    return current;
}

/*
 * Construct two temporary paths of eight fixed-point vectors. Path A is
 * [(0x28000,0x1E000),(0xF000,0),(-0x28000,0x1E000),(-0xF000,0),
 * (0x28000,0x28000),(-0xA000,0xA000),(-0x28000,0x28000),(0xA000,0xA000)];
 * path B is [(0xA000,0x50000),(0x46000,0x50000),(0x3C000,0x5000),
 * (-0xA000,0),(0xA000,0x50000),(-0x46000,0x50000),(-0x3C000,0),
 * (-0xA000,0x5000)]. All z values are 0x1000. Select A when signed +0x1CA8
 * divided by ten is at least two, otherwise B.
 *
 * When +0x1CC0 equals one, copy path index +0x1CC2 into a temporary transform,
 * offset it by (0x200000,0x118000), and compute the delta from scene +0x30/+0x34.
 * If distance exceeds speed +0x1CC4, store the normalized speed-limited delta
 * at +0x1D94/+0x1D98. Otherwise zero that pair, advance +0x1CC2 modulo eight,
 * clear +0x1CC0, and select scene mode four. This path also clears +0x1CA0.
 *
 * Ease +0x1C98 toward the x desired velocity using thresholds -3/+3 and
 * +0x1C9C toward y using -0xD2/+0xD2, in steps of 0x708, approaching zero when
 * desired velocity is inside the dead zone. Clamp both to [-0x4000,0x3FFF].
 * Returns no value; scene target/current velocity, formation index/mode, and
 * temporary SDK-object state change. Exact fallback retains compiler-specific
 * construction/destruction order.
 */
extern "C" void func_ov039_021fdb9c(void *scene)
{
    Overlay039Vector pathA[8];
    Overlay039Vector pathB[8];
    const s32 ax[8] = {0x28000, 0xf000, -0x28000, -0xf000,
                       0x28000, -0xa000, -0x28000, 0xa000};
    const s32 ay[8] = {0x1e000, 0, 0x1e000, 0,
                       0x28000, 0xa000, 0x28000, 0xa000};
    const s32 bx[8] = {0xa000, 0x46000, 0x3c000, -0xa000,
                       0xa000, -0x46000, -0x3c000, -0xa000};
    const s32 by[8] = {0x50000, 0x50000, 0x5000, 0,
                       0x50000, 0x50000, 0, 0x5000};
    for (s32 i = 0; i < 8; i++) {
        func_0200500c(&pathA[i], ax[i], ay[i], 0x1000);
        func_0200500c(&pathB[i], bx[i], by[i], 0x1000);
    }

    Overlay039Vector *path =
        func_020befec(FIELD(s16, scene, 0x1ca8), 10) >= 2 ? pathA : pathB;
    if (FIELD(u16, scene, 0x1cc0) == 1) {
        Overlay039Vector selected;
        Overlay039Vector scratch;
        func_02004fe0(&selected);
        func_02004fe0(&scratch);
        func_020050a4(&selected, &path[FIELD(u16, scene, 0x1cc2)]);
        selected.x_04 += 0x200000;
        selected.y_08 += 0x118000;
        s32 dx = selected.x_04 - FIELD(s32, scene, 0x30);
        s32 dy = selected.y_08 - FIELD(s32, scene, 0x34);
        s32 distance = func_020adc40(fixedMultiply(dx, dx) +
                                     fixedMultiply(dy, dy));
        s32 speed = FIELD(s32, scene, 0x1cc4);
        if (distance > speed) {
            FIELD(s32, scene, 0x1d94) =
                fixedMultiply(func_020adc90(dx, distance), speed);
            FIELD(s32, scene, 0x1d98) =
                fixedMultiply(func_020adc90(dy, distance), speed);
        } else {
            FIELD(s32, scene, 0x1d94) = 0;
            FIELD(s32, scene, 0x1d98) = 0;
            FIELD(u16, scene, 0x1cc2) = (FIELD(u16, scene, 0x1cc2) + 1) & 7;
            FIELD(u16, scene, 0x1cc0) = 0;
            func_ov039_021ff330(scene, 4);
        }
        FIELD(u16, scene, 0x1ca0) = 0;
        func_02005058(&scratch);
        func_02005058(&selected);
    }

    s32 currentX = FIELD(s32, scene, 0x1c98);
    s32 desiredX = FIELD(s32, scene, 0x1d94);
    if (desiredX >= -3 && desiredX <= 3 && currentX != 0) {
        FIELD(u16, scene, 0x1ca0) = 0;
    }
    FIELD(s32, scene, 0x1c98) = approachVelocity(currentX, desiredX, -3, 3);
    FIELD(s32, scene, 0x1c9c) =
        approachVelocity(FIELD(s32, scene, 0x1c9c),
                         FIELD(s32, scene, 0x1d98), -0xd2, 0xd2);

    for (s32 i = 7; i >= 0; i--) func_02005058(&pathB[i]);
    for (s32 i = 7; i >= 0; i--) func_02005058(&pathA[i]);
}
