#include "tingle/types.h"

/*
 * Overlay 1 visible-row maintenance. This recovered helper visits every row in
 * the controller's current visible interval and updates its resources.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001VisibleRowsState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001VisibleRowsState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov001_021fc4b4(Overlay001VisibleRowsState *state, s32 row);
#ifdef __cplusplus
}
#endif

/*
 * Starting at controller field 0x0C, call func_ov001_021fc4b4 for each row up
 * to and including firstRow + controller field 0x08 - 1. Controller fields are
 * reloaded for the loop bound each iteration, preserving mutable-controller
 * behavior. Returns no value; resource effects belong to the callee.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc068(Overlay001VisibleRowsState *state)
{
    s32 row = FIELD(s32, state->controller_1bc, 0x0c);

    while (row <= FIELD(s32, state->controller_1bc, 0x0c) +
                      FIELD(s32, state->controller_1bc, 0x08) - 1) {
        func_ov001_021fc4b4(state, row);
        row++;
    }
}
