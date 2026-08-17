#include "tingle/types.h"

/*
 * Overlay 0 direct selection setting. This recovered helper applies an active
 * cell index to both selection controllers and retires a stale transient.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000SelectionSetState {
    u8 field_000[0x1c];
    void *transient_01c;
    u8 field_020[0x230];
    void *metadata_250;
    u8 field_254[0x08];
    s32 activeIndex_25c;
    u8 field_260[0x0c];
    void *controller_26c;
    u8 embedded_270[1];
} Overlay000SelectionSetState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void IndexedSelectionController_SetValue(void *embeddedState, s32 row);
extern void InventoryScroll_SetSelectedRow(void *controller, s32 row);
#ifdef __cplusplus
}
#endif

/*
 * Store index in activeIndex_25c, send index%5 to the embedded object at +0x270,
 * and send index/5 to controller_26c. If transient_01c exists
 * but differs from metadata[index]+0x10, mark its halfword +0x32 with 0x0100
 * and clear the reference. Returns no value; callee state effects are indirect.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fca4c(Overlay000SelectionSetState *state, s32 index)
{
    state->activeIndex_25c = index;
    IndexedSelectionController_SetValue(state->embedded_270, index % 5);
    InventoryScroll_SetSelectedRow(state->controller_26c, func_020befec(index, 5));
    if (state->transient_01c != 0 &&
        state->transient_01c !=
            FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10)) {
        FIELD(u16, state->transient_01c, 0x32) = 0x100;
        state->transient_01c = 0;
    }
}
