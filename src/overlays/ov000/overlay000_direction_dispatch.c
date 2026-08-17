#include "tingle/types.h"

/*
 * Overlay 0 directional-input dispatch. This recovered helper prepares the row
 * and column controllers, then applies one prioritized direction from an input
 * bitfield.
 */

typedef struct Overlay000DirectionState {
    u8 field_000[0x26c];
    void *controller_26c;
    u8 embedded_270[1];
} Overlay000DirectionState;

typedef struct Overlay000DirectionInput {
    u16 buttons_00;
} Overlay000DirectionInput;

#ifdef __cplusplus
extern "C" {
#endif
extern void InventoryScroll_SaveOrigins(void *controller);
extern void IndexedSelectionController_SnapTransitionOrigin(void *embeddedState);
extern void InventoryScroll_MoveSelectionUp(void *controller);
extern void InventoryScroll_MoveSelectionDown(void *controller);
extern void IndexedSelectionController_DecrementWrap(void *embeddedState);
extern void IndexedSelectionController_IncrementWrap(void *embeddedState);
#ifdef __cplusplus
}
#endif

/*
 * Prepare controller_26c and the embedded state at +0x270, then test input bits
 * in priority order 0x40, 0x80, 0x20, 0x10. Dispatch the first set bit to
 * controller operations 02093e0c/02093e20 or embedded operations
 * 02093bb0/02093b8c, respectively. Return 1 when dispatched, otherwise 0.
 * Callees own any input/presentation effects; hardware is not touched directly.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fcb98(Overlay000DirectionState *state,
                         const Overlay000DirectionInput *input)
{
    InventoryScroll_SaveOrigins(state->controller_26c);
    IndexedSelectionController_SnapTransitionOrigin(state->embedded_270);
    if ((input->buttons_00 & 0x40) != 0) {
        InventoryScroll_MoveSelectionUp(state->controller_26c);
    } else if ((input->buttons_00 & 0x80) != 0) {
        InventoryScroll_MoveSelectionDown(state->controller_26c);
    } else if ((input->buttons_00 & 0x20) != 0) {
        IndexedSelectionController_DecrementWrap(state->embedded_270);
    } else if ((input->buttons_00 & 0x10) != 0) {
        IndexedSelectionController_IncrementWrap(state->embedded_270);
    } else {
        return 0;
    }
    return 1;
}
