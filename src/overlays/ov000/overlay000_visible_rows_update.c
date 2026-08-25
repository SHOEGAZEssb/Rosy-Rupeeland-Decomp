#include "tingle/types.h"

/*
 * Overlay 0 visible-row update dispatch. It derives the active row interval
 * from the grid controller and asks the row renderer to refresh each entry.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000GridState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay000_CreateRowResources(void *state, s32 row);
#ifdef __cplusplus
}
#endif

/*
 * Read the first visible row from controller field 0x0C and the visible count
 * from field 0x08, then invoke Overlay000_CreateRowResources for every inclusive row in
 * that interval. Returns nothing. Row presentation state changes through the
 * callback; no SDK service or hardware is accessed directly here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc254(Overlay000GridState *state)
{
    s32 row = FIELD(s32, state->controller_26c, 0x0c);

    while (row <= FIELD(s32, state->controller_26c, 0x0c) +
                  FIELD(s32, state->controller_26c, 0x08) - 1) {
        Overlay000_CreateRowResources(state, row);
        row++;
    }
}
