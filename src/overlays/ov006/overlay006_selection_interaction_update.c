#include "tingle/types.h"

/*
 * Overlay 6 selection-interaction update. This recovered three-phase loop
 * starts and polls an embedded controller, handles directional input, updates
 * geometry, and advances the auxiliary animation.
 */

typedef struct Overlay006SelectionState {
    u8 bytes[0xb8];
} Overlay006SelectionState;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void IndexedSelectionController_ResetTransition(void *controller);
extern s32 IndexedSelectionController_AdvancePacing(void *controller);
extern void func_ov006_021fb9b4(void *state);
extern void IndexedSelectionController_SnapTransitionOrigin(void *controller);
extern void IndexedSelectionController_Increment(void *controller);
extern void IndexedSelectionController_Decrement(void *controller);
extern s32 IndexedSelectionController_AdvanceTransition(void *controller);
extern void SceneSound_PlayPackedEffect(void *state, s32 value);
extern s32 func_ov006_021fb950(void *state);
#ifdef __cplusplus
}
#endif

/* Advance phase +0x04 and reset timer +0x08. */
static void overlay006_advance_selection(Overlay006SelectionState *state)
{
    FIELD(s32, state, 0x004)++;
    FIELD(s32, state, 0x008) = 0;
}

/*
 * In phase zero, call IndexedSelectionController_ResetTransition on controller +0x58, advance, and fall
 * through. Phase one polls IndexedSelectionController_AdvancePacing. While false, update geometry through
 * func_ov006_021fb9b4 and finish the frame. When true, update geometry only if
 * +0x64 differs from +0x68, advance to phase two, and process it immediately.
 * Phase two calls IndexedSelectionController_SnapTransitionOrigin, reads the input halfword through pointer +0x2C,
 * calls IndexedSelectionController_Increment for bit 0x40 or IndexedSelectionController_Decrement for bit 0x80, then polls
 * IndexedSelectionController_AdvanceTransition. When that poll succeeds, call SceneSound_PlayPackedEffect(state,0), decrement
 * phase back to one, and clear the timer. Always call func_ov006_021fb950 and
 * return zero. Controller/input meanings beyond these confirmed branches remain
 * unidentified; effects are delegated and there is no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov006_021fbafc(Overlay006SelectionState *state)
{
    void *controller = (u8 *)state + 0x58;

    switch (FIELD(s32, state, 0x004)) {
    case 0:
        IndexedSelectionController_ResetTransition(controller);
        overlay006_advance_selection(state);
        /* Intentional same-frame fallthrough. */
    case 1:
        if (IndexedSelectionController_AdvancePacing(controller)) {
            if (FIELD(s32, state, 0x064) != FIELD(s32, state, 0x068)) {
                func_ov006_021fb9b4(state);
            }
            overlay006_advance_selection(state);
        } else {
            func_ov006_021fb9b4(state);
            break;
        }
        /* Successful phase one intentionally enters phase two immediately. */
    case 2:
        {
            u16 input;

            IndexedSelectionController_SnapTransitionOrigin(controller);
            input = *FIELD(u16 *, state, 0x02c);
            if (input & 0x40) {
                IndexedSelectionController_Increment(controller);
            } else if (input & 0x80) {
                IndexedSelectionController_Decrement(controller);
            }
            if (IndexedSelectionController_AdvanceTransition(controller)) {
                SceneSound_PlayPackedEffect(state, 0);
                FIELD(s32, state, 0x004)--;
                FIELD(s32, state, 0x008) = 0;
            }
        }
        break;
    }

    func_ov006_021fb950(state);
    return 0;
}

#undef FIELD
