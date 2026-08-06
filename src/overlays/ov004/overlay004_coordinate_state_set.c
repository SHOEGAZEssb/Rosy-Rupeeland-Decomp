#include "tingle/types.h"

/*
 * Overlay 4 coordinate-state setup. This recovered helper stores a supplied
 * two-word pair and clears two related working fields.
 */

typedef struct Overlay004CoordinateState {
    u8 field_000[0x04];
    s32 field_004;
    s32 field_008;
    u8 field_00c[0x18];
    s32 field_024;
    s32 field_028;
} Overlay004CoordinateState;

/*
 * Store first and second at offsets +0x24/+0x28, then clear +0x04/+0x08.
 * Returns no value and calls no SDK or hardware service. Semantic coordinate
 * names remain unconfirmed, so the address-derived field names are retained.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov004_021fb6e4(Overlay004CoordinateState *state, s32 first,
                          s32 second)
{
    state->field_024 = first;
    state->field_028 = second;
    state->field_004 = 0;
    state->field_008 = 0;
}
