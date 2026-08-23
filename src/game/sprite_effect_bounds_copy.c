/* Fixed-size bounds transfer used by resident sprite effects. */

#include "tingle/sprite_effect.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Copy caller-owned four-word Q12 X/Z effect bounds by value. */
SpriteEffectBounds *SpriteEffectBounds_Assign(
    SpriteEffectBounds *destination, const SpriteEffectBounds *source)
{
    u32 *out = (u32 *)destination;
    const u32 *in = (const u32 *)source;

    out[0] = in[0];
    out[1] = in[1];
    out[2] = in[2];
    out[3] = in[3];
    return destination;
}

#ifdef __cplusplus
}
#endif
