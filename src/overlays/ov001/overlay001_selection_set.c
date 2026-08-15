#include "tingle/types.h"

/*
 * Overlay 1 direct selection setting. This recovered helper applies an active
 * cell index to both selection controllers and retires a stale transient.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001SelectionSetState {
    u8 field_000[0x1c];
    void *transient_01c;
    u8 field_020[0x18c];
    s32 activeIndex_1ac;
    u8 field_1b0[0x0c];
    void *controller_1bc;
    u8 embedded_1c0[1];
    u8 field_1c1[0x4b];
    void *metadata_20c;
} Overlay001SelectionSetState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void IndexedSelectionController_SetValue(void *embeddedState, s32 column);
extern void func_02093d50(void *controller, s32 row);
#ifdef __cplusplus
}
#endif

/*
 * Store index in activeIndex_1ac, send index modulo five to the embedded
 * controller at +0x1C0, and send index divided by five to controller_1bc. If
 * transient_01c exists but differs from metadata[index]+0x10, mark its
 * halfword +0x32 with 0x0100 and clear the reference. Returns no value;
 * controller and transient state changes occur through memory and callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc758(Overlay001SelectionSetState *state, s32 index)
{
    state->activeIndex_1ac = index;
    IndexedSelectionController_SetValue(state->embedded_1c0, index % 5);
    func_02093d50(state->controller_1bc, index / 5);
    if (state->transient_01c != 0 &&
        state->transient_01c !=
            FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x10)) {
        FIELD(u16, state->transient_01c, 0x32) = 0x100;
        state->transient_01c = 0;
    }
}
