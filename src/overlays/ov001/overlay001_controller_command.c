#include "tingle/types.h"

/*
 * Overlay 1 controller-command handling. This recovered helper prepares the row
 * controller, submits a command, and validates transient state on acceptance.
 */

typedef struct Overlay001ControllerCommandState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001ControllerCommandState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02093de4(void *controller);
extern s32 func_020946c8(void *controller, s32 command);
extern void func_ov001_021fc1b8(Overlay001ControllerCommandState *state);
#ifdef __cplusplus
}
#endif

/*
 * Prepare controller_1BC, submit command with func_020946c8, and return 0 if it
 * is rejected. On acceptance, validate transient state and return 1. Controller
 * effects occur through callees; no hardware is accessed directly.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc348(Overlay001ControllerCommandState *state, s32 command)
{
    func_02093de4(state->controller_1bc);
    if (!func_020946c8(state->controller_1bc, command)) {
        return 0;
    }
    func_ov001_021fc1b8(state);
    return 1;
}
