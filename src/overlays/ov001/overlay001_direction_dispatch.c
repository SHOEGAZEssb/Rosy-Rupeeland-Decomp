#include "tingle/types.h"

/*
 * Overlay 1 directional-input dispatch. This recovered helper prepares the
 * row and column controllers and applies one prioritized input direction.
 */

typedef struct Overlay001DirectionState {
    u8 field_000[0x1bc];
    void *controller_1bc;
    u8 embedded_1c0[1];
} Overlay001DirectionState;

typedef struct Overlay001DirectionInput {
    u16 buttons_00;
} Overlay001DirectionInput;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02093de4(void *controller);
extern void IndexedSelectionController_SnapTransitionOrigin(void *embeddedState);
extern void func_02093e0c(void *controller);
extern void func_02093e20(void *controller);
extern void IndexedSelectionController_DecrementWrap(void *embeddedState);
extern void IndexedSelectionController_IncrementWrap(void *embeddedState);
#ifdef __cplusplus
}
#endif

/*
 * Prepare controller_1bc and the embedded state at +0x1C0, then test input
 * bits in priority order 0x40, 0x80, 0x20, 0x10. Dispatch the first set bit to
 * controller operations 02093e0c/02093e20 or embedded operations
 * 02093bb0/02093b8c. Return one when dispatched and zero otherwise. Callees own
 * any presentation effects; hardware is not touched directly.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fcae0(Overlay001DirectionState *state,
                         const Overlay001DirectionInput *input)
{
    func_02093de4(state->controller_1bc);
    IndexedSelectionController_SnapTransitionOrigin(state->embedded_1c0);
    if ((input->buttons_00 & 0x40) != 0) {
        func_02093e0c(state->controller_1bc);
    } else if ((input->buttons_00 & 0x80) != 0) {
        func_02093e20(state->controller_1bc);
    } else if ((input->buttons_00 & 0x20) != 0) {
        IndexedSelectionController_DecrementWrap(state->embedded_1c0);
    } else if ((input->buttons_00 & 0x10) != 0) {
        IndexedSelectionController_IncrementWrap(state->embedded_1c0);
    } else {
        return 0;
    }
    return 1;
}
