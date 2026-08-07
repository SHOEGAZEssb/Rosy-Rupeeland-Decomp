#include "tingle/types.h"

/*
 * Overlay 9 input-driven clamping. This recovered helper adjusts a scalar from
 * held directional-button bits and clamps it to a caller-supplied interval.
 */

/*
 * Read held-input halfword +0x06 through state +0x50. If bit 0x10 is set, add
 * step and clamp to maximum; otherwise, if bit 0x20 is set, subtract step and
 * clamp to minimum. Return the adjusted value. Input state is read only and no
 * direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov009_021fd414(void *state, s32 value, s32 minimum, s32 maximum,
                         s32 step)
{
    u16 held = *(u16 *)(*(u8 **)((u8 *)state + 0x50) + 6);

    if (held & 0x10) {
        value += step;
        if (value > maximum) {
            value = maximum;
        }
    } else if (held & 0x20) {
        value -= step;
        if (value < minimum) {
            value = minimum;
        }
    }
    return value;
}
