#include "tingle/types.h"

/*
 * Overlay 1 transient-state validation. This recovered helper retires an
 * attached transient when it no longer corresponds to the selected grid index.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001TransientValidationState {
    u8 field_000[0x1c];
    void *transient_01c;
    u8 field_020[0x18c];
    s32 activeIndex_1ac;
    u8 field_1b0[0x0c];
    void *controller_1bc;
    u8 field_1c0[0x0c];
    s32 baseIndex_1cc;
} Overlay001TransientValidationState;

/*
 * Compare activeIndex_1AC with baseIndex_1CC plus five times controller field
 * 0x14. When they differ and transient_01C exists, write 0x0100 to its halfword
 * +0x32 and clear the reference. Returns no value, calls no service, and does
 * not directly access hardware.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc1b8(Overlay001TransientValidationState *state)
{
    s32 expectedIndex =
        state->baseIndex_1cc + FIELD(s32, state->controller_1bc, 0x14) * 5;

    if (state->activeIndex_1ac != expectedIndex && state->transient_01c != 0) {
        FIELD(u16, state->transient_01c, 0x32) = 0x100;
        state->transient_01c = 0;
    }
}
