#include "tingle/game_phase_runtime.h"

/* Readiness predicate used by the game-phase controller before transitions. */

/*
 * Inspect the supplied gameplay context and return one only when none of the
 * recovered blocking flags or objects is active: bits 0x100, 0x10000, 0x10,
 * and 0x4000 in offset 0xd0 must be clear; mask 0x980000 at 0x230 must be
 * clear; offset 0x270 must be null; fields 0x24 and 0x1dc must agree; and the
 * signed halfword at 0x268 must be zero. This function changes no state.
 */
s32 GamePhaseRuntime_IsReadyForTransition(void *context)
{
    u8 *b = (u8 *)context;
    s32 result;
    s32 stage2;
    s32 stage1;
    u32 flags = *(u32 *)(b + 0xd0);

    result = 0;
    stage2 = result;
    stage1 = result;

    if (!(flags & 0x100)) {
        s32 blocked;
        if ((flags & 0x10000) || (*(u32 *)(b + 0x230) & 0x980000))
            blocked = 1;
        else
            blocked = 0;
        if (!blocked)
            stage1 = 1;
    }
    if (stage1 && *(void **)(b + 0x270) == 0)
        stage2 = 1;
    if (stage2) {
        s32 positionsAgree;
        if (!(flags & 0x10) &&
            *(u32 *)(b + 0x24) == *(u32 *)(b + 0x1dc))
            positionsAgree = 1;
        else
            positionsAgree = 0;
        if (positionsAgree && *(s16 *)(b + 0x268) == 0 &&
            !(flags & 0x4000))
            result = 1;
    }
    return result;
}
