#include "tingle/types.h"

/*
 * Overlay 1 grid-transition handling. This recovered helper accepts a row
 * transition at its midpoint, updates placement/resources, and syncs selection.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001GridTransitionState {
    u8 field_000[0x1b4];
    s32 scrollY_1b4;
    s32 originY_1b8;
    void *controller_1bc;
} Overlay001GridTransitionState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay001_DestroyRowResources(Overlay001GridTransitionState *state,
                                s32 row);
extern void Overlay001_CreateRowResources(Overlay001GridTransitionState *state,
                                s32 row);
extern void Overlay001_SyncSelection(Overlay001GridTransitionState *state);
#ifdef __cplusplus
}
#endif

/*
 * Return 0 unless controller field 0x30 equals signed field 0x2C/2. At that
 * midpoint, if current row +0x0C differs from target +0x10, recompute originY,
 * update sprite-group +8 Y, destroy resources for controller row +0x74, and
 * create resources for row +0x70. Then always sync selection with
 * Overlay001_SyncSelection and return 1. Resource effects occur through callees.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay001_Grid_UpdateTransition(Overlay001GridTransitionState *state)
{
    void *controller = state->controller_1bc;
    s32 row = FIELD(s32, controller, 0x0c);
    s32 targetRow = FIELD(s32, controller, 0x10);

    if (FIELD(s32, controller, 0x30) != FIELD(s32, controller, 0x2c) / 2) {
        return 0;
    }
    if (row != targetRow) {
        state->originY_1b8 = 0x34 - row * 0x24 - state->scrollY_1b4;
        FIELD(s32, FIELD(void *, state, 0x08), 0x1c) = state->originY_1b8;
        Overlay001_DestroyRowResources(state, FIELD(s32, controller, 0x74));
        Overlay001_CreateRowResources(state, FIELD(s32, controller, 0x70));
    }
    Overlay001_SyncSelection(state);
    return 1;
}
