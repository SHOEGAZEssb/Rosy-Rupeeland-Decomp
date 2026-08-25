#include "tingle/types.h"

/* Overlay 18 short scene callbacks for sprite-completion gating and sub-display submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseState_UpdateRenderHelpers(void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_020b198c(void *, s32, s32);
extern void func_020b4554(void *, s32);
extern void Overlay018_UpdateFrameUi(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advance the three-phase sprite gate at +4. Phase 0 clears sprite +0xD0 flag
 * bits 0/1, selects animation 0x23, advances to phase 1, and deliberately falls
 * through. Phase 1 advances when sprite flag bit 0 becomes set. Phase 2 returns
 * one immediately. All other paths run frame/UI synchronizer 0x021FD788 and
 * return zero. Scene/sprite/UI SDK state may change; no direct MMIO occurs.
 */
extern "C" s32 Overlay018_UpdateSpriteGate(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        FIELD(u16, FIELD(void *, state, 0xd0), 0x24) &= ~3;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0xd0), 0x23);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough: phase 0 immediately performs the phase-1 test. */
    case 1:
        if (FIELD(u16, FIELD(void *, state, 0xd0), 0x24) & 1) {
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        return 1;
    }
    Overlay018_UpdateFrameUi(state);
    return 0;
}

/*
 * When state flag bit 10 at +0x20 is set, update global scene data +0x24,
 * replace sub-display-control bits 8..12 at 0x04001000 with state +0x4C, then
 * submit descriptor +0x190/+0 through helpers using fixed value 0x6000. Always
 * return zero. Scene/graphics SDK and sub-display MMIO may change.
 */
extern "C" s32 func_ov018_021ff258(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400) {
        volatile u32 *display = (volatile u32 *)0x04001000;
        void *descriptor;

        GamePhaseState_UpdateRenderHelpers((u8 *)gGamePhaseRuntime + 0x24);
        *display = (*display & ~0x1f00U) |
                   (FIELD(u32, state, 0x4c) << 8);
        descriptor = FIELD(void *, FIELD(void *, state, 0x190), 0);
        func_020b4554(descriptor, 0x6000);
        func_020b198c(descriptor, 0, 0x6000);
    }
    return 0;
}
