#include "tingle/types.h"

/*
 * Overlay 0 per-cell update orchestration. This recovered helper visits every
 * allocated grid cell, resets one aspect, then applies a caller-supplied value.
 */

typedef struct Overlay000CellsApplyState {
    u8 field_000[0x254];
    s32 cellCount_254;
} Overlay000CellsApplyState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov000_021fc6b4(Overlay000CellsApplyState *state, s32 index);
extern void func_ov000_021fc658(Overlay000CellsApplyState *state, s32 index,
                                s32 value);
#ifdef __cplusplus
}
#endif

/*
 * For each index in [0, cellCount_254), call func_ov000_021fc6b4 followed by
 * func_ov000_021fc658(state, index, value). The precise cell properties changed
 * by those helpers are recovered in their own units. Returns no value and has
 * no direct SDK or hardware effect beyond its callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc614(Overlay000CellsApplyState *state, s32 value)
{
    s32 index;

    for (index = 0; index < state->cellCount_254; index++) {
        func_ov000_021fc6b4(state, index);
        func_ov000_021fc658(state, index, value);
    }
}
