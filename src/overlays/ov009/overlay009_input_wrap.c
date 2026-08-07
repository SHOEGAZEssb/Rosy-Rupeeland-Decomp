#include "tingle/types.h"

/*
 * Overlay 9 input-driven wrapping. This recovered helper adjusts a scalar from
 * held directional-button bits and wraps it across a caller-supplied interval.
 */

/*
 * Read held-input halfword +0x06 through state +0x50. If bit 0x10 is set, add
 * step and wrap values above maximum to minimum; otherwise, if bit 0x20 is set,
 * subtract step and wrap values below minimum to maximum. Return the adjusted
 * value. Input state is read only and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov009_021fd458(void *state, s32 value, s32 minimum, s32 maximum,
                         s32 step)
{
    u16 held = *(u16 *)(*(u8 **)((u8 *)state + 0x50) + 6);

    if (held & 0x10) {
        value += step;
        if (value > maximum) {
            value = minimum;
        }
    } else if (held & 0x20) {
        value -= step;
        if (value < minimum) {
            value = maximum;
        }
    }
    return value;
}
