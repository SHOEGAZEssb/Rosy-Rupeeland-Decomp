#include "tingle/types.h"

/*
 * Overlay 1 timed selection synchronization. This recovered helper runs the
 * selection sync stage when an embedded transition reaches its midpoint.
 */

typedef struct Overlay001TimedSelectionState {
    u8 field_000[0x1e4];
    s32 duration_1e4;
    s32 counter_1e8;
} Overlay001TimedSelectionState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov001_021fc644(Overlay001TimedSelectionState *state);
#ifdef __cplusplus
}
#endif

/*
 * Return 0 unless counter_1E8 equals duration_1E4/2 with signed truncation
 * toward zero. At equality, run func_ov001_021fc644 and return 1. The callee
 * owns any selection/presentation effects; no hardware is accessed here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc320(Overlay001TimedSelectionState *state)
{
    if (state->counter_1e8 != state->duration_1e4 / 2) {
        return 0;
    }
    func_ov001_021fc644(state);
    return 1;
}
