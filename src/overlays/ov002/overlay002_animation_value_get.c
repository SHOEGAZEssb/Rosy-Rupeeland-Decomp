#include "tingle/types.h"

/*
 * Overlay 2 animation-value access. This recovered helper exposes one word
 * from the embedded animation state initialized at offset 0x98.
 */

typedef struct Overlay002AnimationValueState {
    u8 field_000[0xa8];
    s32 animationValue_0a8;
} Overlay002AnimationValueState;

/*
 * Return animationValue_0a8 unchanged. State is not modified, and no SDK or
 * hardware service is called; the precise meaning of this word is unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov002_021fbe60(const Overlay002AnimationValueState *state)
{
    return state->animationValue_0a8;
}
