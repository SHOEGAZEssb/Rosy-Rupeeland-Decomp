#include "tingle/types.h"

/*
 * Overlay 41 effect color calculation. This recovered helper converts a
 * fixed-point intensity into a clamped RGB555 fade, with a steeper palette
 * curve while finale mode fourteen is active.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Multiply signed 20.12 fixed-point values using the game's rounding rule. */
static s32 mul_fx(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/* Clamp an RGB555 component; out-of-range values become zero, not saturation. */
static s32 clamp_component(s32 component)
{
    if (component > 31 || component < 0)
        return 0;
    return component;
}

/*
 * Return an RGB555 color derived from intensity. Ordinary modes compute equal
 * red/green components as 31-(intensity*0xE000), and blue as
 * 31-(intensity*0x12000), after converting the products from 20.12 fixed point
 * to integers. Mode fourteen instead uses 0x28000 and 0x1F000. Each component
 * outside 0..31 becomes zero. No object, SDK, or hardware state is changed.
 */
extern "C" u16 func_ov041_0220333c(void *object, s32 intensity)
{
    s32 sharedFactor;
    s32 blueFactor;
    if (FIELD(s32, object, 0x920) == 14) {
        sharedFactor = 0x28000;
        blueFactor = 0x1f000;
    } else {
        sharedFactor = 0xe000;
        blueFactor = 0x12000;
    }
    s32 shared = clamp_component(31 - (mul_fx(intensity, sharedFactor) >> 12));
    s32 blue = clamp_component(31 - (mul_fx(intensity, blueFactor) >> 12));
    return (u16)(shared | (shared << 5) | (blue << 10));
}
