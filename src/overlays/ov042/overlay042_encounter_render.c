#include "tingle/types.h"

/*
 * Overlay 42 encounter rendering. This recovered draw callback submits scene
 * displays, generates the mode-two ribbon/particle geometry, draws all child
 * actor families, and performs the encounter's screen-brightness transition.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s16 data_020c9670[];
extern "C" u16 data_ov042_0220ad98[];
extern "C" s32 data_ov042_0220acd8[];
extern "C" s32 data_ov042_0220ad68[];
extern "C" s32 data_ov042_0220af24[];
extern "C" s32 data_ov042_0220b564[];
extern "C" u8 data_020f4dc8[];
extern "C" u32 genrand_int32(void);
extern "C" s32 func_020bf1f8(u32 value, s32 modulus);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_0209a2ac(void *display, void *renderContext, s32 layer);
extern "C" void func_02004fe0(void *matrix);
extern "C" void func_0200500c(void *matrix, s32 x, s32 y, s32 z);
extern "C" void func_02005058(void *matrix);
extern "C" void func_020050a4(void *destination, const void *source);
extern "C" void func_0209b494(void *graphics, s32 parameter, s32 value);
extern "C" void func_0209b668(void *graphics);
extern "C" void func_020a1794(void *owner, const void *position,
                               const void *matrix, s32 flags);
extern "C" void func_020a227c(void *graphics, const void *position, s32 angle);
extern "C" void *DisplayBrightnessPair_GetScreen(void *controller, s32 screen);
extern "C" void DisplayBrightness_StartTransition(void *brightness, s32 start, s32 end, s32 duration);
extern "C" void func_020c10d4(void *object);
extern "C" void func_ov042_02204e74(s32 polygon, s32 texture,
                                     s32 palette, s32 alpha,
                                     s32 arg0, s32 arg1);
extern "C" void func_ov042_02204ee4(void *scene, const void *position,
                                     s32 color, const void *scale);
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
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 0), start, end, duration);
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(data_020f4dc8, 1), start, end, duration);
}

/* Emit a single reconstructed billboard through the overlay geometry helper. */
static void emit_billboard(void *scene, s32 x, s32 y, s32 z,
                           s32 color, s32 scale)
{
    s32 position[3] = {x, y, z};
    s32 dimensions[3] = {scale, scale, scale};
    func_ov042_02204ee4(scene, position, color, dimensions);
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
    s32 base[4];
    s32 actor[4];
    s32 scale[4];
    func_020c10d4(base);
    func_0200500c(base, 192, 160, 112);
    func_0200500c(actor, FIELD(s32, scene, 0xa8) >> 12,
                   FIELD(s32, scene, 0xac) >> 12, 210);

    s32 phase = FIELD(s32, scene, 0x1d4);
    s32 amplitude = phase ? FIELD(s32, scene, 0x1dc) : 135;
    if (amplitude < 1)
        amplitude = 1;
    scale[0] = func_020befec(FIELD(s32, scene, 0x1d0) * amplitude, 135);
    scale[1] = func_020befec(FIELD(s32, scene, 0x1d8) * amplitude, 135);
    scale[2] = func_020befec(FIELD(s32, scene, 0x1dc) * amplitude, 135);

    s32 center[3] = {FIELD(s32, scene, 0xa8), 0, FIELD(s32, scene, 0xac)};
    func_020050a4((u8 *)FIELD(void *, FIELD(void *, scene, 0x48), 0x20) + 0x70,
                   actor);
    func_020a227c(FIELD(void *, FIELD(void *, scene, 0x48), 0x20), actor,
                   (FIELD(s32, scene, 0x1bc) * 0x127) & 0xffff);
    func_0200500c(scale, scale[0] >> 7, scale[1] >> 7, scale[2] >> 7);
    func_0209b494(FIELD(void *, FIELD(void *, scene, 0x48), 0x20), 38, 0);

    /* The retail function emits seven color-indexed ribbon billboards. */
    for (s32 i = 6; i >= 0; --i) {
        s32 tableIndex = (FIELD(s32, scene, 0x1bc) + i * 3) % 27;
        emit_billboard(scene,
                       center[0] + data_ov042_0220acd8[i * 2],
                       center[1],
                       center[2] + data_ov042_0220acd8[i * 2 + 1],
                       data_ov042_0220ad98[tableIndex], 0x1000 + i * 0x180);
    }

    if ((FIELD(s32, scene, 0x1bc) % 30) == 0) {
        FIELD(s32, scene, 0x244) = 6;
        FIELD(s32, scene, 0x260) = 1;
        s32 matrix[4];
        func_02004fe0(matrix);
        func_020a1794(FIELD(void *, scene, 0x48), (u8 *)scene + 0xa4, matrix, 0);
        FIELD(s32, scene, 0x254) = matrix[1];
        FIELD(s32, scene, 0x258) = matrix[2];
        func_02005058(matrix);
    }

    func_02005058(scale);
    func_02005058(actor);
    func_02005058(base);
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
