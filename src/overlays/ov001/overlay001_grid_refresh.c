#include "tingle/types.h"

/*
 * Overlay 1 grid refresh orchestration. This recovered helper advances the row
 * controller and embedded column state before updating visible-row resources.
 */

typedef struct Overlay001GridRefreshState {
    u8 field_000[0x1bc];
    void *controller_1bc;
    u8 embedded_1c0[1];
} Overlay001GridRefreshState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02094874(void *controller);
extern void func_02093b20(void *embeddedState);
extern void func_ov001_021fc068(Overlay001GridRefreshState *state);
#ifdef __cplusplus
}
#endif

/*
 * Update controller_1BC, update the embedded object at state+0x1C0, then run
 * visible-row maintenance. Returns no value. Presentation/resource effects
 * occur through the callees, with no direct hardware access in this wrapper.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc1f0(Overlay001GridRefreshState *state)
{
    func_02094874(state->controller_1bc);
    func_02093b20(state->embedded_1c0);
    func_ov001_021fc068(state);
}
