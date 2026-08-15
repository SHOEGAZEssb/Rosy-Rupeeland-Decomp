#include "tingle/types.h"

/*
 * Overlay 0 selection synchronization. This recovered helper maps controller
 * row/column state to an active cell index, cursor coordinates, and transient.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000SelectionSyncState {
    u8 field_000[0x1c];
    void *transient_01c;
    void *cursor_020;
    u8 field_024[0x22c];
    void *metadata_250;
    u8 field_254[0x08];
    s32 activeIndex_25c;
    u8 field_260[0x0c];
    void *controller_26c;
    u8 field_270[0x0c];
    s32 column_27c;
    u8 field_280[0x28];
    s32 transientCounter_2a8;
    s32 transientDuration_2ac;
} Overlay000SelectionSyncState;

/*
 * Read the controller's selected row at +0x14 and first visible row at +0x0C.
 * Store activeIndex_25c as column_27c + selectedRow*5. Write cursor halfword X
 * at +0x2C as column*36+0x38 and Y at +0x2E as
 * (selectedRow-firstRow)*36+0x34. If transient_01c is null, attach the selected
 * metadata record's +0x10 resource and initialize its counter/duration to 0/30.
 * Returns no value and calls no SDK or hardware service.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc9d4(Overlay000SelectionSyncState *state)
{
    s32 selectedRow = FIELD(s32, state->controller_26c, 0x14);
    s32 firstRow = FIELD(s32, state->controller_26c, 0x0c);

    state->activeIndex_25c = state->column_27c + selectedRow * 5;
    FIELD(u16, state->cursor_020, 0x2c) =
        (u16)(state->column_27c * 0x24 + 0x38);
    FIELD(u16, state->cursor_020, 0x2e) =
        (u16)((selectedRow - firstRow) * 0x24 + 0x34);
    if (state->transient_01c != 0) {
        return;
    }
    state->transient_01c =
        FIELD(void *,
              (u8 *)state->metadata_250 + state->activeIndex_25c * 0x20,
              0x10);
    state->transientCounter_2a8 = 0;
    state->transientDuration_2ac = 0x1e;
}
