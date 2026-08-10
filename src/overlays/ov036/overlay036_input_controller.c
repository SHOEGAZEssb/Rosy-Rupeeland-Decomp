#include "tingle/types.h"

/* Overlay 36 input-controller construction and per-frame edge detection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay036UpdateFn)(void *controller);

extern const u8 data_ov036_02206098[];
extern void *gTouchPanelManager;
extern void *gPadStates;

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Init(void *state);
extern void func_02091b6c(void *state);
extern void func_020720c0(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Constructs an overlay-36 input controller. argument is retained at +4;
 * embedded objects at +0x0C, +0xA4, and +0xCC are initialized, mode +0x0C is
 * set to 2, and +0xA0/+0xC0/+0xC4/+0xC8 are cleared. Returns controller; only
 * embedded engine objects and controller memory change.
 */
extern "C" void *func_ov036_021fce00(void *controller, void *argument)
{
    FIELD(const void *, controller, 0) = data_ov036_02206098;
    Graphics3DSceneState_Init((u8 *)controller + 0x0c);
    func_02091b6c((u8 *)controller + 0xa4);
    FIELD(s32, controller, 0xc0) = 0;
    func_020720c0((u8 *)controller + 0xcc);
    FIELD(void *, controller, 4) = argument;
    FIELD(s32, controller, 0x0c) = 2;
    FIELD(s32, controller, 0xa0) = 0;
    FIELD(s32, controller, 0xc8) = 0;
    FIELD(s32, controller, 0xc4) = 0;
    return controller;
}

/*
 * Samples touch state from the global touch manager. It records a rising edge
 * at +0xC8 when halfword +0x44 becomes 1, retains pressed state at +0xC4,
 * points +8 at the global pad-state block, and invokes vtable slot +8. It has
 * no return value; input/controller state and the virtual update may change.
 */
extern "C" void func_ov036_021fce5c(void *controller)
{
    FIELD(s32, controller, 0xc8) = 0;
    s32 pressed = FIELD(u16, gTouchPanelManager, 0x44) == 1;
    if (pressed && FIELD(s32, controller, 0xc4) == 0)
        FIELD(s32, controller, 0xc8) = 1;
    FIELD(s32, controller, 0xc4) = pressed;
    FIELD(void *, controller, 8) = gPadStates;
    Overlay036UpdateFn *vtable = FIELD(Overlay036UpdateFn *, controller, 0);
    vtable[2](controller);
}
