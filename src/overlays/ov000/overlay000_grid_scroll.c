#include "tingle/types.h"

/*
 * Overlay 0 grid scrolling. This recovered helper propagates a vertical scroll
 * position to the grid's linked display objects and refreshes its view region.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridScrollState {
    u8 field_000[0x264];
    s32 scrollY_264;
    s32 originY_268;
    void *controller_26c;
} Overlay000GridScrollState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095820(void *region, s32 width, s32 height);
#ifdef __cplusplus
}
#endif

/*
 * Store scrollY, derive the grid origin from the controller's first visible
 * row, and update the Y fields of the three associated display objects. The
 * final call refreshes the embedded region at state+0x24 with width 0xEC and a
 * height/end coordinate of scrollY+0xAA; its exact higher-level role remains
 * inferred. The function returns no value and does not directly touch hardware.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc340(Overlay000GridScrollState *state, s32 scrollY)
{
    state->scrollY_264 = scrollY;
    state->originY_268 =
        0x34 - FIELD(s32, state->controller_26c, 0x0c) * 0x24 - scrollY;
    FIELD(s32, FIELD(void *, state, 0x08), 0x1c) = state->originY_268;
    FIELD(s32, FIELD(void *, state, 0x0c), 0x1c) = -state->scrollY_264;
    FIELD(s32, FIELD(void *, state->controller_26c, 0x50), 0x1c) =
        0x2a - state->scrollY_264;
    func_02095820((u8 *)state + 0x24, 0xec, scrollY + 0xaa);
}
