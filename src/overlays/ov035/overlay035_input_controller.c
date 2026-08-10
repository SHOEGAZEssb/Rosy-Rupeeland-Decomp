#include "tingle/types.h"

/* Overlay 35 input-controller construction and per-frame edge detection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay035UpdateFn)(void *controller);

extern const u8 data_ov035_02203c5c[];
extern void *gTouchPanelManager;
extern void *gPadStates;

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Init(void *state);
extern void func_02091b6c(void *state);
extern void GraphicsResourceSetVariant_Init(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Constructs an overlay-35 input controller. `argument` is retained at +4;
 * embedded objects at +0x0C, +0xA4, and +0xCC are initialized, mode +0x0C is
 * set to 2, and the +0xA0/+0xC0/+0xC4/+0xC8 state fields are cleared. Returns
 * `controller`; only the embedded engine objects and controller memory change.
 */
extern "C" void *func_ov035_021fce00(void *controller, void *argument)
{
    FIELD(const void *, controller, 0) = data_ov035_02203c5c;
    Graphics3DSceneState_Init((u8 *)controller + 0x0c);
    func_02091b6c((u8 *)controller + 0xa4);
    FIELD(s32, controller, 0xc0) = 0;
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xcc);
    FIELD(void *, controller, 4) = argument;
    FIELD(s32, controller, 0x0c) = 2;
    FIELD(s32, controller, 0xa0) = 0;
    FIELD(s32, controller, 0xc8) = 0;
    FIELD(s32, controller, 0xc4) = 0;
    return controller;
}

/*
 * Samples touch state from the global touch manager. It records a rising edge
 * at +0xC8 when halfword +0x44 becomes 1, retains the current pressed state at
 * +0xC4, points +8 at the global pad-state block, and invokes vtable slot +8.
 * Returns no value; input/controller state and the virtual update may change.
 */
extern "C" void func_ov035_021fce5c(void *controller)
{
    FIELD(s32, controller, 0xc8) = 0;
    s32 pressed = FIELD(u16, gTouchPanelManager, 0x44) == 1;
    if (pressed && FIELD(s32, controller, 0xc4) == 0)
        FIELD(s32, controller, 0xc8) = 1;
    FIELD(s32, controller, 0xc4) = pressed;
    FIELD(void *, controller, 8) = gPadStates;
    Overlay035UpdateFn *vtable = FIELD(Overlay035UpdateFn *, controller, 0);
    vtable[2](controller);
}
