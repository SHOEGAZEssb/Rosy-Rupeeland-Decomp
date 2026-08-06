#include "tingle/types.h"

/* Recovered fixed-point scaling helper used by the tracked-resource subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc90(s32 value, s32 scale);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a vector-like object and a fixed-point scale. Replaces the three
 * components at offsets 4, 8, and 0x0C with func_020adc90(component, scale).
 * The leading word is preserved. Returns nothing and has no direct SDK or
 * hardware effects; the exact fixed-point format remains unconfirmed.
 */
void func_02050b34(void *vector, s32 scale)
{
    FIELD(s32, vector, 4) = func_020adc90(FIELD(s32, vector, 4), scale);
    FIELD(s32, vector, 8) = func_020adc90(FIELD(s32, vector, 8), scale);
    FIELD(s32, vector, 0x0c) = func_020adc90(FIELD(s32, vector, 0x0c), scale);
}
