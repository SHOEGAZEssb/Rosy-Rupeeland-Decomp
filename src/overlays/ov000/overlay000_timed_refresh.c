#include "tingle/types.h"

/*
 * Overlay 0 timed refresh gating. This recovered helper runs a refresh stage
 * only when an embedded transition counter reaches its signed midpoint.
 */

typedef struct Overlay000TimedRefreshState {
    u8 field_000[0x294];
    s32 duration_294;
    s32 counter_298;
} Overlay000TimedRefreshState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov000_021fc9d4(Overlay000TimedRefreshState *state);
#ifdef __cplusplus
}
#endif

/*
 * Return 0 unless counter_298 equals duration_294 divided by two with signed
 * truncation toward zero. At equality, run func_ov000_021fc9d4 and return 1.
 * The callee's presentation-state effects remain under reconstruction; this
 * gate has no direct SDK or hardware effect.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc538(Overlay000TimedRefreshState *state)
{
    if (state->counter_298 != state->duration_294 / 2) {
        return 0;
    }
    func_ov000_021fc9d4(state);
    return 1;
}
