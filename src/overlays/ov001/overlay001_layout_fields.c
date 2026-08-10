#include "tingle/types.h"

/*
 * Overlay 1 presentation-layout initialization. This recovered helper stores
 * four caller-supplied layout values in a presentation object's trailing fields.
 */

typedef struct Overlay001LayoutState {
    u8 field_000[0xa4];
    s32 field_a4;
    s32 field_a8;
    s32 field_ac;
    s32 flags;
} Overlay001LayoutState;

/*
 * Store first, second, third, and fourth at offsets 0xA4, 0xA8, 0xAC, and 0xB0.
 * The values' semantic roles are not yet confirmed. Returns no value, changes
 * no other state, and calls no SDK or hardware service.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fb6e0(Overlay001LayoutState *state, s32 first, s32 second,
                         s32 third, s32 fourth)
{
    state->field_a4 = first;
    state->field_a8 = second;
    state->field_ac = third;
    state->flags = fourth;
}
