#include "tingle/types.h"

/* Overlay 37 input-controller construction and per-frame touch-edge sampling. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef s32 (*Overlay037UpdateFn)(void *controller);

extern const u8 data_ov037_021fee40[];
extern void *gTouchPanelManager;
extern void *gPadStates;

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Init(void *state);
extern void func_02091b6c(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Constructs an overlay-37 input controller. The embedded scene-input object
 * at +8 and timer at +0xA0 are initialized; mode +8 is then set to 2 and the
 * fields at +0x9C/+0xBC/+0xC0/+0xC4 are cleared. Returns controller; only the
 * embedded engine objects and controller memory are changed.
 */
extern "C" void *func_ov037_021fce00(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov037_021fee40;
    Graphics3DSceneState_Init((u8 *)controller + 8);
    func_02091b6c((u8 *)controller + 0xa0);
    FIELD(s32, controller, 0xbc) = 0;
    FIELD(s32, controller, 8) = 2;
    FIELD(s32, controller, 0x9c) = 0;
    FIELD(s32, controller, 0xc4) = 0;
    FIELD(s32, controller, 0xc0) = 0;
    return controller;
}

/*
 * Samples touch state from the global touch manager. A transition to touch
 * value 1 sets the rising-edge flag at +0xC4, +0xC0 retains the pressed state,
 * +4 is pointed at the global pad-state block, and vtable slot +8 is invoked.
 * Returns the virtual update's result; controller/input state may change.
 */
extern "C" s32 func_ov037_021fce48(void *controller)
{
    FIELD(s32, controller, 0xc4) = 0;
    s32 pressed = FIELD(u16, gTouchPanelManager, 0x44) == 1;
    if (pressed && FIELD(s32, controller, 0xc0) == 0)
        FIELD(s32, controller, 0xc4) = 1;
    FIELD(s32, controller, 0xc0) = pressed;
    FIELD(void *, controller, 4) = gPadStates;
    Overlay037UpdateFn *vtable = FIELD(Overlay037UpdateFn *, controller, 0);
    return vtable[2](controller);
}
