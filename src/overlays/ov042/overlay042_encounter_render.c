#include "tingle/graphics_3d_presentation.h"
#include "tingle/types.h"

/*
 * Overlay 42 encounter rendering. This recovered draw callback submits scene
 * displays, generates the mode-two ribbon/particle geometry, draws all child
 * actor families, and performs the encounter's screen-brightness transition.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s16 gFx32CosSinTable[];
extern "C" u16 data_ov042_0220ad98[];
extern "C" s32 data_ov042_0220acd8[];
extern "C" s32 data_ov042_0220ad68[];
extern "C" s32 data_ov042_0220af24[];
extern "C" s32 data_ov042_0220b564[];
extern "C" u16 data_ov042_0220b6e0[];
extern "C" u8 gDisplayBrightnessPair[];
extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 value, s32 modulus);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_0209a2ac(void *display, void *renderContext, s32 layer);
extern "C" void func_0209b494(void *graphics, s32 parameter, s32 value);
extern "C" void func_0209b668(void *graphics);
extern "C" void func_020a1794(void *owner, const void *position,
                               const void *matrix, s32 flags);
extern "C" void *DisplayBrightnessPair_GetScreen(void *controller, s32 screen);
extern "C" void DisplayBrightness_StartTransition(void *brightness, s32 start, s32 end, s32 duration);
extern "C" void func_ov042_02204e74(s32 polygon, s32 texture,
                                     s32 palette, s32 alpha,
                                     s32 arg0, s32 arg1);
extern "C" void func_ov042_02204ee4(
    void *scene, const s32 *translation, s32 angle, const s32 *scale,
    const s32 *vertices, const s32 *extraTranslation,
    const s32 *texcoords, u16 attributes);
extern "C" void func_ov042_02205808(void *pool);
extern "C" void func_ov042_02208774(void *object, void *renderContext);
extern "C" void func_ov042_02208fd0(void *object, void *renderContext);
extern "C" void func_ov042_02209968(void *object, void *renderContext);
extern "C" void func_ov042_0220a720(void *object);

/* Submit a contiguous array of display pointers in reverse slot order. */
static void submit_displays(void *scene, s32 offset, s32 count,
                            void *renderContext, s32 layer)
{
    for (s32 i = count - 1; i >= 0; --i)
        func_0209a2ac(FIELD(void *, scene, offset + i * 4), renderContext, layer);
}

/* Configure the confirmed brightness ramp on both Nintendo DS screens. */
static void start_brightness_ramp(s32 start, s32 end, s32 duration)
{
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 0), start, end, duration);
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1), start, end, duration);
}

/* Emit one portable approximation of the retail table-driven quad. The full
 * eight-argument ABI is preserved so the recovered geometry helper never
 * consumes indeterminate host registers; the omitted per-quad tables remain
 * a separate recovery dependency for this surrounding encounter renderer. */
static void emit_billboard(void *scene, s32 x, s32 y, s32 z,
                           s32 color, s32 scale)
{
    static const s32 vertices[5] = {-1, -1, 0, 1, 1};
    static const s32 texcoords[4] = {0, 0, 8, 8};
    const s32 extraTranslation[2] = {0, 0};
    VecFx32Object translation;
    VecFx32Object dimensions;

    VecFx32Object_InitComponents(&translation, x, y, z);
    VecFx32Object_InitComponents(&dimensions, scale, scale, scale);
    func_ov042_02204ee4(
        scene, (const s32 *)&translation, 0, (const s32 *)&dimensions,
        vertices, extraTranslation, texcoords, (u16)color);
    VecFx32Object_Destroy(&dimensions);
    VecFx32Object_Destroy(&translation);
}

/* Retail nests a sine-table lookup to produce the encounter light's slow
 * first-axis drift. The first Q12 sample is reinterpreted as a full-turn angle
 * before the second lookup, then divided by five. */
static s32 get_rupee_light_first_axis_offset(void)
{
    u16 phase = (u16)(data_ov042_0220b6e0[0] + 0xc8);
    s16 firstSample;
    u32 secondByteOffset;
    s16 secondSample;

    data_ov042_0220b6e0[0] = phase;
    firstSample = gFx32CosSinTable[(phase >> 4) * 2];
    secondByteOffset =
        (((((u32)(s32)firstSample << 18) >> 16) >> 4) << 2);
    secondSample = *(const s16 *)((const u8 *)gFx32CosSinTable +
                                  secondByteOffset);
    return func_020befec(secondSample, 5);
}

/*
 * Draw the mode-two central ribbon. Confirmed inputs are actor position
 * +0xA8/+0xAC, oscillation fields +0x1D4..+0x1DC, timers +0x1BC/+0x244,
 * the 27-halfword color sequence at data_ov042_0220ad98, and graphics owner
 * +0x48/+0x20. This helper changes graphics matrix/material state and records
 * the resulting effect position at +0x254/+0x258.
 */
static void draw_mode2_ribbon(void *scene)
{
    static const s32 vertices[8][6] = {
        {-56, -10, -38,   8, 54, -38},
        { 56, -10, -38,  -8, 54, -38},
        {-42,  -8, -38,   6, 40, -38},
        { 42,  -8, -38,  -6, 40, -38},
        {-24,  -5, -42,   0, 59, -42},
        { 24,  -5, -42,   0, 59, -42},
        {-13, -10, -38,  11,  6, -38},
        { 13, -10, -38, -11,  6, -38}
    };
    static const s32 extraTranslations[8][2] = {
        {-11, 27}, {11, 27}, {-16, -34}, {16, -34},
        {0, -25}, {0, -25}, {-32, -4}, {32, -4}
    };
    static const s32 texcoordPairs[12][2] = {
        {0, 0}, {0x3f000, 0x40000}, {0x41000, 0},
        {0x6f000, 0x2f000}, {0x70000, 0}, {0x87000, 0x40000},
        {0x40000, 0x30000}, {0x58000, 0x40000},
        {0x58000, 0x30000}, {0x70000, 0x40000}, {0x88000, 0},
        {0xa0000, 0x10000}
    };
    Graphics3dPresentation *presentation =
        (Graphics3dPresentation *)FIELD(
            void *, FIELD(void *, scene, 0x48), 0x20);
    VecFx32Object rupeeScale;
    VecFx32Object rupeeTranslation;
    VecFx32Object lightingReference;
    VecFx32Object billboardScale;
    u16 localAttributes[27];
    u16 quadAngles[8] = {0};
    s32 texcoordSelectors[9] = {0};
    s32 timer = FIELD(s32, scene, 0x1bc);
    s32 direction = FIELD(s32, scene, 0x1d0);
    s32 phase = FIELD(s32, scene, 0x1d4);
    s32 i;

    VecFx32Object_InitComponents(&rupeeScale, 192, 160, 112);
    VecFx32Object_InitComponents(
        &rupeeTranslation, FIELD(s32, scene, 0xa8) >> 12,
        FIELD(s32, scene, 0xac) >> 12, 210);

    if (timer > 180) {
        s32 factor = 135 - (timer - 180) / 2;

        if (timer > 295) {
            factor -= (timer - 295) * 2;
            if (factor < 1)
                factor = 1;
        }
        rupeeScale.value.x = func_020befec(rupeeScale.value.x * factor, 135);
        rupeeScale.value.y = func_020befec(rupeeScale.value.y * factor, 135);
        rupeeScale.value.z = func_020befec(rupeeScale.value.z * factor, 135);
    } else if (timer == 0 && FIELD(s32, scene, 0x1cc) == 0 &&
               FIELD(s32, scene, 0x1b0) != 0) {
        s32 progress = FIELD(s32, scene, 0x1b0);
        s32 factor = progress >= 180 ? 512 - (progress - 180) * 2 : 512;

        rupeeScale.value.x = rupeeScale.value.x * factor / 256;
        rupeeScale.value.y = rupeeScale.value.y * factor / 256;
        rupeeScale.value.z = rupeeScale.value.z * factor / 256;
    }

    if (phase != 0) {
        u16 phaseAngle = (u16)(phase * FIELD(s32, scene, 0x1d8));
        s16 sample = gFx32CosSinTable[(phaseAngle >> 4) * 2];
        u16 angle = (u16)((((s64)sample *
                            FIELD(s32, scene, 0x1dc)) + 0x800) >> 12);

        if (direction == 0) {
            quadAngles[0] = angle;
        } else if (direction == 1) {
            quadAngles[1] = (u16)-(s16)angle;
        } else if (direction == 2) {
            quadAngles[0] = angle;
            quadAngles[1] = (u16)-(s16)angle;
        }
    }
    if (timer != 0) {
        quadAngles[0] = 1600;
        quadAngles[1] = (u16)-1000;
        quadAngles[2] = (u16)-800;
        quadAngles[3] = 280;
    } else if (FIELD(s32, scene, 0x1cc) != 0) {
        s32 spread = FIELD(s32, scene, 0x1cc);

        if (FIELD(s32, scene, 0x1e0) == 0) {
            quadAngles[0] = (u16)(-100 * spread);
            quadAngles[1] = (u16)( 100 * spread);
            quadAngles[2] = (u16)( 300 * spread);
            quadAngles[3] = (u16)(-300 * spread);
        } else {
            quadAngles[0] = (u16)( 300 * spread);
            quadAngles[1] = (u16)(-300 * spread);
            quadAngles[2] = (u16)( 400 * spread);
            quadAngles[3] = (u16)(-400 * spread);
        }
    }

    VecFx32Object_InitComponents(&lightingReference, -750, -800, -500);
    lightingReference.value.x += get_rupee_light_first_axis_offset();
    VecFx32Object_Assign(&presentation->lightingReference, &lightingReference);
    presentation->lightStrength =
        timer > 0x127 ? 0 : 0x1000;
    Graphics3dPresentation_DrawRupeeWithEffects(
        presentation, &rupeeTranslation, &rupeeScale,
        (u16)(FIELD(s32, scene, 0x150) |
              (FIELD(s32, scene, 0x1c4) > 3 ? 0x100 : 0)));
    VecFx32Object_InitComponents(
        &billboardScale, rupeeScale.value.x * 32,
        rupeeScale.value.y * 32, rupeeScale.value.z * 32);
    func_0209b494(FIELD(void *, FIELD(void *, scene, 0x48), 0x20), 38, 0);

    for (i = 0; i < 27; ++i)
        localAttributes[i] = data_ov042_0220ad98[i];
    for (i = 0; i < 8; ++i)
        texcoordSelectors[i] = data_ov042_0220acd8[i];
    if (FIELD(s32, scene, 0x1c4) > 3) {
        texcoordSelectors[6] = 8;
        texcoordSelectors[7] = 8;
    }
    if (phase != 0 && (phase & 8) == 0 &&
        direction >= 0 && direction <= 2) {
        texcoordSelectors[direction + 6] = 10;
    }

    for (i = 7; i >= 0; --i) {
        u16 attributes = localAttributes[
            FIELD(s32, scene, 0x150) * 4 + 3 + i / 2];

        if (timer > 0x127)
            attributes = localAttributes[23];
        func_ov042_02204ee4(
            scene, (const s32 *)&rupeeTranslation, quadAngles[i],
            (const s32 *)&billboardScale, vertices[i],
            extraTranslations[i],
            &texcoordPairs[texcoordSelectors[i]][0], attributes);
    }

    if ((FIELD(s32, scene, 0x1bc) % 30) == 0) {
        FIELD(s32, scene, 0x244) = 6;
        FIELD(s32, scene, 0x260) = 1;
        s32 matrix[4];
        VecFx32Object_Init((VecFx32Object *)matrix);
        func_020a1794(FIELD(void *, scene, 0x48), (u8 *)scene + 0xa4, matrix, 0);
        FIELD(s32, scene, 0x254) = matrix[1];
        FIELD(s32, scene, 0x258) = matrix[2];
        VecFx32Object_Destroy((VecFx32Object *)matrix);
    }

    VecFx32Object_Destroy(&billboardScale);
    VecFx32Object_Destroy(&lightingReference);
    VecFx32Object_Destroy(&rupeeTranslation);
    VecFx32Object_Destroy(&rupeeScale);
}

/*
 * Draw one of the timer-driven radial particle sets. Direction, distance,
 * lifetime, and color are randomized exactly in fixed-point domains; the
 * higher-level visual identity of each set remains inferred.
 */
static void draw_radial_particles(void *scene, s32 count, s32 radius,
                                  s32 colorBase, s32 timerOffset)
{
    s32 timer = FIELD(s32, scene, timerOffset);
    if (timer <= 0)
        return;
    func_ov042_02204e74(0, 0, 0, 0, 0, 0);
    for (s32 i = 0; i < count; ++i) {
        s32 x = func_020bf1f8(genrand_int32(), 1600) - 800;
        s32 z = func_020bf1f8(genrand_int32(), 1600) - 800;
        s32 divisor = x < z ? z : x;
        if (divisor == 0)
            divisor = 1;
        s32 nx = func_020adc90(x, divisor);
        s32 nz = func_020adc90(z, divisor);
        s32 distance = radius + func_020bf1f8(genrand_int32(), 50) * 0x1000;
        s32 life = func_020bf1f8(genrand_int32(), 40) + 10;
        s32 progress = timer > life ? life : timer;
        emit_billboard(scene,
                       FIELD(s32, scene, 0x254) + (nx * distance >> 12),
                       (progress - life / 2) * 0x800,
                       FIELD(s32, scene, 0x258) + (nz * distance >> 12),
                       colorBase + (i & 7), 0x800 + progress * 0x40);
    }
    func_0209b668(FIELD(void *, FIELD(void *, scene, 0x48), 0x20));
}

/*
 * Render the entire encounter. scene supplies all draw state; renderContext is
 * passed to SDK display submission and child draw callbacks. The function
 * increments +0x1B8, submits shared displays +0x5C..+0x64, uses +0x1B4 to
 * choose mode-specific displays/custom geometry, draws the record pool and all
 * variant families, updates particle fields +0x244..+0x278, and can start
 * dual-screen brightness ramps. It returns no value. Direct graphics-state
 * effects correspond to the original GX register/material operations; exact
 * register writes remain in the matching implementation.
 */
extern "C" void func_ov042_022036c4(void *scene, void *renderContext)
{
    ++FIELD(s32, scene, 0x1b8);
    func_0209a2ac(scene, 0, 1);
    submit_displays(scene, 0x5c, 3, renderContext, 1);

    s32 mode = FIELD(s32, scene, 0x1b4);
    if (mode == 0) {
        func_0209a2ac(FIELD(void *, scene, 0x4c), renderContext, 1);
        func_0209a2ac(FIELD(void *, scene, 0x54), renderContext, 1);
        func_0209a2ac(FIELD(void *, scene, 0x50), renderContext, 1);
        func_0209a2ac(FIELD(void *, scene, 0x58), renderContext, 2);
    } else if (mode == 1) {
        func_0209a2ac(FIELD(void *, scene, 0x4c), renderContext, 1);
        func_0209a2ac(FIELD(void *, scene, 0x54), renderContext, 1);
        func_0209a2ac(FIELD(void *, scene, 0x50), renderContext, 0);
    } else if (mode == 2) {
        draw_mode2_ribbon(scene);
    }

    func_ov042_02205808(FIELD(void *, scene, 0xa0));
    if (FIELD(void *, scene, 0x68))
        for (s32 i = 3; i >= 0; --i)
            func_ov042_02208774(FIELD(void *, scene, 0x68 + i * 4), renderContext);
    if (FIELD(void *, scene, 0x78))
        for (s32 i = 2; i >= 0; --i)
            func_ov042_02208fd0(FIELD(void *, scene, 0x78 + i * 4), renderContext);
    if (FIELD(void *, scene, 0x84))
        for (s32 i = 1; i >= 0; --i)
            func_ov042_02209968(FIELD(void *, scene, 0x84 + i * 4), renderContext);
    for (s32 i = 4; i >= 0; --i)
        func_ov042_0220a720(FIELD(void *, scene, 0x8c + i * 4));

    draw_radial_particles(scene, 10, 0x8d000, 0x6f7b, 0x244);
    draw_radial_particles(scene, 16, 0x6a000, 0x4f7b, 0x260);
    draw_radial_particles(scene, 12, 0x8d000, 0x6108, 0x278);

    /* +0x248 controls the confirmed fade-to-white and return transition. */
    if (FIELD(s32, scene, 0x248) > 0) {
        s32 tick = ++FIELD(s32, scene, 0x248);
        if (tick == 2)
            start_brightness_ramp(0, 16, 32);
        if (tick == 34) {
            FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x48), 8), 0xf8) = 2;
            start_brightness_ramp(16, 0, 16);
        }
        if (tick > 50)
            FIELD(s32, scene, 0x248) = 0;
    }
}
