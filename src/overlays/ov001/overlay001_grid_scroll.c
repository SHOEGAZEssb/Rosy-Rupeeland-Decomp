#include "tingle/types.h"

/*
 * Overlay 1 grid scrolling. This recovered helper propagates a vertical scroll
 * position to linked display objects and refreshes the main visible region.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001GridScrollState {
    u8 field_000[0x1b4];
    s32 scrollY_1b4;
    s32 originY_1b8;
    void *controller_1bc;
} Overlay001GridScrollState;

#ifdef __cplusplus
extern "C" {
#endif
extern void SpriteMotionController_SetPosition(void *region, s32 width, s32 height);
#ifdef __cplusplus
}
#endif

/*
 * Store scrollY, derive originY_1B8 as 0x34-firstRow*0x24-scrollY, and update
 * Y fields of the sprite groups at +8/+0x0C and controller-linked object +0x50.
 * Refresh the embedded region at +0x28 with dimensions 0xEC by scrollY+0xAA.
 * The refresh callee owns any graphics effects; no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay001_Grid_Scroll(Overlay001GridScrollState *state, s32 scrollY)
{
    state->scrollY_1b4 = scrollY;
    state->originY_1b8 =
        0x34 - FIELD(s32, state->controller_1bc, 0x0c) * 0x24 - scrollY;
    FIELD(s32, FIELD(void *, state, 0x08), 0x1c) = state->originY_1b8;
    FIELD(s32, FIELD(void *, state, 0x0c), 0x1c) = -state->scrollY_1b4;
    FIELD(s32, FIELD(void *, state->controller_1bc, 0x50), 0x1c) =
        0x2a - state->scrollY_1b4;
    SpriteMotionController_SetPosition((u8 *)state + 0x28, 0xec, scrollY + 0xaa);
}
