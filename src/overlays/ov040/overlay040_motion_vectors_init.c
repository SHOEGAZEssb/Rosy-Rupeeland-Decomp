#include "tingle/types.h"

/*
 * Overlay 40 motion-vector initialization. This recovered helper seeds four
 * scene vectors, derives normalized fixed-point motion from existing fields,
 * and invokes the three update stages that consume the resulting state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void *func_020050a4(void *destination, const void *source);
extern void func_02005058(void *vector);
extern s32 func_020adc40(s32 squaredDistance);
extern s32 func_020adc90(s32 component, s32 magnitude);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_020beb18(s32 angle);
extern s32 func_020be8c0(s32 left, s32 right);
extern s32 func_020beb6c(s32 left, s32 right);
extern s32 func_020beae4(void);
extern void func_ov040_021fd724(void *record);
extern void func_ov040_021fd740(void *record);
extern void __register_global_object(void *object, void (*destructor)(void *),
                                     void *chain);
extern void func_ov040_021fe18c(void *destination, const void *source);
extern void func_ov040_022005d4(void *destination, const void *source);
extern void func_ov040_02200378(void *scene);
extern void func_ov040_022005f8(void *scene);
extern void func_ov040_022009e8(void *scene);
extern u32 data_ov040_02207dc0[];
extern u8 data_ov040_02207de0[];
extern u8 data_ov040_02207e04[];
extern const s32 data_ov040_02203810[];
extern u8 data_ov040_02207df8[];
extern u8 data_ov040_02207dec[];
#ifdef __cplusplus
}
#endif

/* Multiply two signed 20.12 fixed-point values with the retail rounding bias. */
static s32 fx_mul(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/*
 * Initialize motion state in scene; the second through fourth inputs are
 * accepted for the caller-facing constructor contract but are not inspected.
 * Writes vectors +0x1A4/+0x1B4/+0x204/+0x244, derived vectors at +0x1C8 and
 * +0x1D8, scaled coordinates +0x218, and then updates dependent scene state.
 * Returns no value. Vector helpers may update their embedded SDK state.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov040_02200128(void *scene, s32 unused1, s32 unused2, s32 unused3)
{
    s32 vector[4];
    s32 x;
    s32 y;
    s32 magnitude;

    (void)unused1;
    (void)unused2;
    (void)unused3;

    func_0200500c(vector, 0, 0x32000, 0xa000);
    func_020050a4((u8 *)scene + 0x1a4, vector);
    func_02005058(vector);
    func_0200500c(vector, 0, 0x32000, 0xa000);
    func_020050a4((u8 *)scene + 0x1b4, vector);
    func_02005058(vector);
    func_0200500c(vector, 0, 0x10000, 0xa000);
    func_020050a4((u8 *)scene + 0x204, vector);
    func_02005058(vector);
    func_0200500c(vector, 0, -0x38000, -0x5000);
    func_020050a4((u8 *)scene + 0x244, vector);
    func_02005058(vector);

    FIELD(s32, scene, 0x1d8) = -FIELD(s32, scene, 0x11c);
    FIELD(s32, scene, 0x1dc) = FIELD(s32, scene, 0x118);
    FIELD(s32, scene, 0x1e0) = 0x19000;

    x = FIELD(s32, scene, 0xfc);
    y = -FIELD(s32, scene, 0xf8);
    magnitude = func_020adc40(fx_mul(x, x) + fx_mul(y, y));
    FIELD(s32, scene, 0x1c8) = fx_mul(func_020adc90(x, magnitude), 0x32000);
    FIELD(s32, scene, 0x1cc) = fx_mul(func_020adc90(y, magnitude), 0x32000);
    FIELD(s32, scene, 0x1d0) = 0x19000;

    /* 0x385 is a confirmed scale constant; its physical unit is not known. */
    FIELD(s32, scene, 0x218) = fx_mul(0x385, FIELD(s32, scene, 0xb8));
    FIELD(s32, scene, 0x21c) = fx_mul(0x385, FIELD(s32, scene, 0xbc));
    FIELD(s32, scene, 0x220) = -0x1000;

    func_ov040_02200378(scene);
    func_ov040_022005f8(scene);
    func_ov040_022009e8(scene);
}

/* Clamp one position component and cancel its associated velocity on impact. */
static void clamp_position(void *scene, u32 positionOffset, u32 velocityOffset)
{
    s32 position = FIELD(s32, scene, positionOffset);

    if (position > 0x2000) {
        FIELD(s32, scene, positionOffset) = 0x2000;
        FIELD(s32, scene, velocityOffset) = 0;
    }
    if (FIELD(s32, scene, positionOffset) < -0x2000) {
        FIELD(s32, scene, positionOffset) = -0x2000;
        FIELD(s32, scene, velocityOffset) = 0;
    }
}

/*
 * Advance the scene's damped two-axis displacement. The routine reads source
 * direction +0xB8/+0xBC, writes a normalized vector at +0x1E8, maintains a
 * lazily registered previous-position record, damps velocities +0x8B0/+0x8B4,
 * clamps positions +0x880/+0x884, copies the resulting vector, and updates the
 * display coordinates at +0x3E8/+0x3EC. Returns no value. Registration mutates
 * the overlay-global destructor chain on the first call.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov040_02200378(void *scene)
{
    s32 x = FIELD(s32, scene, 0xb8);
    s32 y = FIELD(s32, scene, 0xbc);
    s32 magnitude = func_020adc40(fx_mul(x, x) + fx_mul(y, y));

    FIELD(s32, scene, 0x1e8) = func_020adc90(x, magnitude) * -0x28;
    FIELD(s32, scene, 0x1ec) = func_020adc90(y, magnitude) * -0x28;
    FIELD(s32, scene, 0x1f0) = -0xa000;

    /* The flag and previous coordinates occupy confirmed offsets in a global. */
    if ((data_ov040_02207dc0[3] & 1) == 0) {
        func_ov040_021fd724(data_ov040_02207de0);
        __register_global_object(data_ov040_02207de0,
                                 func_ov040_021fd740,
                                 data_ov040_02207e04);
        data_ov040_02207dc0[3] |= 1;
    }

    FIELD(s32, scene, 0x8b0) -=
        (FIELD(s32, scene, 0xb8) - (s32)data_ov040_02207dc0[9]) >> 4;
    FIELD(s32, scene, 0x8b4) -=
        (FIELD(s32, scene, 0xbc) - (s32)data_ov040_02207dc0[10]) >> 4;
    data_ov040_02207dc0[9] = FIELD(u32, scene, 0xb8);
    data_ov040_02207dc0[10] = FIELD(u32, scene, 0xbc);

    /* 0xFD7 is the confirmed per-frame damping factor (about 0.99 in fx32). */
    FIELD(s32, scene, 0x8b0) = fx_mul(FIELD(s32, scene, 0x8b0), 0xfd7);
    FIELD(s32, scene, 0x8b4) = fx_mul(FIELD(s32, scene, 0x8b4), 0xfd7);
    FIELD(s32, scene, 0x8b0) += FIELD(s32, scene, 0x880) > 0 ? -0xa4 : 0xa4;
    FIELD(s32, scene, 0x8b4) += FIELD(s32, scene, 0x884) > 0 ? -0xa4 : 0xa4;

    clamp_position(scene, 0x880, 0x8b0);
    clamp_position(scene, 0x884, 0x8b4);
    func_ov040_022005d4((u8 *)scene + 0x87c, (u8 *)scene + 0x8ac);

    FIELD(s32, scene, 0x3ec) = FIELD(s32, scene, 0x880) - 0x5000;
    /* The retail sequence multiplies by 0x19A, rounds, then adds 0x19A. */
    FIELD(s32, scene, 0x3e8) = fx_mul(0x19a, FIELD(s32, scene, 0x884)) + 0x19a;
}

/* Clamp a body component to its table-provided symmetric limit. */
static void clamp_body(void *body, u32 positionOffset, u32 velocityOffset,
                       s32 limit)
{
    if (FIELD(s32, body, positionOffset) > limit) {
        FIELD(s32, body, positionOffset) = limit;
        FIELD(s32, body, velocityOffset) = 0;
    }
    if (FIELD(s32, body, positionOffset) < -limit) {
        FIELD(s32, body, positionOffset) = -limit;
        FIELD(s32, body, velocityOffset) = 0;
    }
}

/*
 * Advance the pair of bounded secondary bodies at +0x864 and +0x870. Inputs
 * come from direction +0xB8/+0xBC and confirmed limit constants in overlay
 * rodata. The function writes normalized vectors +0x228/+0x238, two four-word
 * presentation records +0x5E4/+0x5F4, damped body velocities, and projected
 * coordinates +0x418..+0x428. Returns no value. Its first call registers the
 * address-derived global record used to retain the previous direction.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov040_022005f8(void *scene)
{
    s32 x = FIELD(s32, scene, 0xb8);
    s32 y = FIELD(s32, scene, 0xbc);
    s32 magnitude = func_020adc40(fx_mul(x, x) + fx_mul(y, y));
    s32 normalizedX = func_020adc90(x, magnitude);
    s32 normalizedY = func_020adc90(y, magnitude);
    s32 limits[4];
    s32 record[4];
    s32 deltaX;
    s32 deltaY;
    s32 phase;
    s32 i;

    limits[0] = FIELD(s32, data_ov040_02203810, 0x14);
    limits[1] = FIELD(s32, data_ov040_02203810, 0x18);
    limits[2] = FIELD(s32, data_ov040_02203810, 0x1c);
    limits[3] = FIELD(s32, data_ov040_02203810, 0x20);

    FIELD(s32, scene, 0x238) = normalizedX << 3;
    FIELD(s32, scene, 0x23c) = normalizedY << 3;
    FIELD(s32, scene, 0x240) = 0xa000;
    FIELD(s32, scene, 0x228) = normalizedX << 3;
    FIELD(s32, scene, 0x22c) = normalizedY << 3;
    FIELD(s32, scene, 0x230) = 0xa000;

    data_ov040_02207dc0[4]++;
    /* Inference: the two division-helper calls reduce the counter to phase 0..2. */
    phase = (data_ov040_02207dc0[4] % 6) % 3;
    for (i = 0; i < 2; i++) {
        s32 angle = (phase * 8 + 0x20) << 12;
        s32 trig = func_020beb18(angle);
        if (phase * 8 + 0x20 > 0)
            func_020be8c0(0x3f000000, trig);
        else
            func_020beb6c(trig, 0x3f000000);
        record[0] = func_020beae4();
        record[1] = 0xa8000;
        record[2] = 0x8000;
        record[3] = 0x8000;
        func_ov040_021fe18c((u8 *)scene + 0x5e4 + i * 0x10, record);
    }

    if ((data_ov040_02207dc0[2] & 1) == 0) {
        func_ov040_021fd724(data_ov040_02207df8);
        __register_global_object(data_ov040_02207df8,
                                 func_ov040_021fd740,
                                 data_ov040_02207dec);
        data_ov040_02207dc0[2] |= 1;
    }

    deltaX = (FIELD(s32, scene, 0xb8) - (s32)data_ov040_02207dc0[15]) >> 4;
    deltaY = (FIELD(s32, scene, 0xbc) - (s32)data_ov040_02207dc0[16]) >> 4;
    FIELD(s32, scene, 0x898) -= deltaX;
    FIELD(s32, scene, 0x89c) -= deltaY;
    FIELD(s32, scene, 0x8a4) -= deltaX;
    FIELD(s32, scene, 0x8a8) -= deltaY;
    data_ov040_02207dc0[15] = FIELD(u32, scene, 0xb8);
    data_ov040_02207dc0[16] = FIELD(u32, scene, 0xbc);

    for (i = 1; i >= 0; i--) {
        u8 *body = (u8 *)scene + i * 0x0c;
        FIELD(s32, body, 0x898) = fx_mul(FIELD(s32, body, 0x898), 0xfd7);
        FIELD(s32, body, 0x89c) = fx_mul(FIELD(s32, body, 0x89c), 0xfd7);
        FIELD(s32, body, 0x898) += FIELD(s32, body, 0x868) > 0 ? -0xa4 : 0xa4;
        FIELD(s32, body, 0x89c) += FIELD(s32, body, 0x86c) > 0 ? -0xa4 : 0xa4;
        clamp_body(body, 0x868, 0x898, limits[i + 2]);
        clamp_body(body, 0x86c, 0x89c, limits[i]);
        func_ov040_022005d4(body + 0x864, body + 0x894);
    }

    FIELD(s32, scene, 0x41c) = FIELD(s32, scene, 0x868) - 0x5000;
    FIELD(s32, scene, 0x428) = FIELD(s32, scene, 0x874) + 0x16000;
    FIELD(s32, scene, 0x418) = fx_mul(0x19a, FIELD(s32, scene, 0x86c)) - 0x333;
    FIELD(s32, scene, 0x424) = fx_mul(0x19a, FIELD(s32, scene, 0x878)) - 0x333;
}
