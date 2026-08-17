#include "tingle/types.h"

/* Overlay 17 BGR555 three-entry palette-ramp generation for the panel object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Interpolate source color channels +0x2C4/+0x2C8/+0x2CC toward (24,24,31)
 * using duration +0x3C8 and combined progress +0x3CC/+0x3D0, pack them as a
 * BGR555 color, and store at +0x438. Generate a fixed midpoint toward white in
 * +0x43A and a fixed midpoint toward black in +0x43C using 8/16 interpolation.
 * State palette words change; the interpolation helper has no known external
 * effects, the function returns void, and no direct hardware access occurs.
 */
extern "C" void Overlay017_UpdatePaletteRamp(void *state)
{
    s32 progress = FIELD(s32, state, 0x3cc) + FIELD(s32, state, 0x3d0);
    s32 duration = FIELD(s32, state, 0x3c8);
    s32 red = Presentation_InterpolateLinear(0x18, FIELD(s32, state, 0x2c4), duration,
                            progress);
    s32 green = Presentation_InterpolateLinear(0x18, FIELD(s32, state, 0x2c8), duration,
                              progress);
    s32 blue = Presentation_InterpolateLinear(0x1f, FIELD(s32, state, 0x2cc), duration,
                             progress);

    FIELD(u16, state, 0x438) = (u16)(red | (green << 5) | (blue << 10));
    FIELD(u16, state, 0x43a) = (u16)(
        Presentation_InterpolateLinear(red, 0x1f, 0x10, 8) |
        (Presentation_InterpolateLinear(green, 0x1f, 0x10, 8) << 5) |
        (Presentation_InterpolateLinear(blue, 0x1f, 0x10, 8) << 10));
    FIELD(u16, state, 0x43c) = (u16)(
        Presentation_InterpolateLinear(red, 0, 0x10, 8) |
        (Presentation_InterpolateLinear(green, 0, 0x10, 8) << 5) |
        (Presentation_InterpolateLinear(blue, 0, 0x10, 8) << 10));
}
