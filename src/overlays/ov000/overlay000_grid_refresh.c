#include "tingle/types.h"

/*
 * Overlay 0 grid refresh orchestration. This recovered helper advances the
 * controller and embedded state before rebuilding the grid's visible content.
 */

typedef struct Overlay000GridRefreshState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000GridRefreshState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02094874(void *controller);
extern void IndexedSelectionController_ResetTransition(void *embeddedState);
extern void func_ov000_021fc254(Overlay000GridRefreshState *state);
extern void func_ov000_021fc714(Overlay000GridRefreshState *state);
#ifdef __cplusplus
}
#endif

/*
 * Update controller_26c, update the embedded object at state+0x270, recompute
 * visible rows, then run the later overlay-local refresh stage. Returns no
 * value. The first two calls may affect SDK-managed presentation state; no
 * direct hardware access is visible here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc3f8(Overlay000GridRefreshState *state)
{
    func_02094874(state->controller_26c);
    IndexedSelectionController_ResetTransition((u8 *)state + 0x270);
    func_ov000_021fc254(state);
    func_ov000_021fc714(state);
}
