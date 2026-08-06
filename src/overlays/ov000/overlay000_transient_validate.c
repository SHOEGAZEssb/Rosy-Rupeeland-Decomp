#include "tingle/types.h"

/*
 * Overlay 0 transient-state validation. This recovered helper discards an
 * attached record when it no longer belongs to the controller's active row.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000TransientValidationState {
    u8 field_000[0x1c];
    void *record_01c;
    u8 field_020[0x23c];
    s32 activeIndex_25c;
    u8 field_260[0x0c];
    void *controller_26c;
    u8 field_270[0x0c];
    s32 baseIndex_27c;
} Overlay000TransientValidationState;

/*
 * Compare activeIndex_25c with baseIndex_27c plus five times the controller's
 * field 0x14. If they differ and a record is attached, write 0x0100 to its
 * halfword at offset 0x32 and clear the reference. Field meanings beyond this
 * relationship remain unconfirmed. Returns no value and calls no services.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc3c0(Overlay000TransientValidationState *state)
{
    s32 expectedIndex =
        state->baseIndex_27c + FIELD(s32, state->controller_26c, 0x14) * 5;

    if (state->activeIndex_25c != expectedIndex && state->record_01c != 0) {
        FIELD(u16, state->record_01c, 0x32) = 0x100;
        state->record_01c = 0;
    }
}
