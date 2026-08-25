#include "tingle/types.h"

/* Overlay 17 effect progress tracking and derived render-state preparation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
extern s32 Overlay017_HasEffectCompleted(void *);
#ifdef __cplusplus
}
#endif

/*
 * Recompute the effect's common scale and three reduced position fields. While
 * progress +0x9E is below duration +0x9C, interpolate scale 0x400..0x100 and
 * field +0xA4 from 12..3; once complete, use +0xB8 to interpolate 0x100..0
 * over eight steps. Store the scale at +0xD0/+0xD4/+0xD8 and signed position
 * fields +0x10/+0x20/+0x30 divided by 256 at +0xC4/+0xC8/+0xCC. The object is
 * mutated, the interpolation helper may update no known external state, and
 * the function returns void with no direct hardware access.
 */
extern "C" void Overlay017_UpdateEffectTransform(void *state)
{
    s32 scale;

    if (Overlay017_HasEffectCompleted(state)) {
        scale = Presentation_InterpolateLinear(0x100, 0, 8, FIELD(s32, state, 0xb8));
    } else {
        scale = Presentation_InterpolateLinear(0x400, 0x100, FIELD(u16, state, 0x9c),
                              FIELD(u16, state, 0x9e));
        FIELD(s32, state, 0xa4) =
            Presentation_InterpolateLinear(0xc, 3, FIELD(u16, state, 0x9c),
                          FIELD(u16, state, 0x9e));
    }

    FIELD(s32, state, 0xd8) = scale;
    FIELD(s32, state, 0xd4) = scale;
    FIELD(s32, state, 0xd0) = scale;
    FIELD(s32, state, 0xc4) = FIELD(s32, state, 0x10) / 0x100;
    FIELD(s32, state, 0xc8) = FIELD(s32, state, 0x20) / 0x100;
    FIELD(s32, state, 0xcc) = FIELD(s32, state, 0x30) / 0x100;
}

/*
 * Advance progress +0x9E by one while it is below duration +0x9C. The input
 * object is updated in place, the function returns void, and no SDK or hardware
 * state is touched.
 */
extern "C" void Overlay017_AdvanceEffectProgress(void *state)
{
    u16 progress = FIELD(u16, state, 0x9e);

    if (progress < FIELD(u16, state, 0x9c)) {
        FIELD(u16, state, 0x9e) = progress + 1;
    }
}

/*
 * Return one when unsigned progress +0x9E has reached duration +0x9C, otherwise
 * return zero. The input object is read only and no SDK or hardware state is
 * changed.
 */
extern "C" s32 Overlay017_HasEffectCompleted(void *state)
{
    return FIELD(u16, state, 0x9e) >= FIELD(u16, state, 0x9c);
}
