#include "tingle/types.h"

/* Overlay 34 per-frame sector phase/interpolation update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateEaseOutQuadratic(s32 start, s32 end, s32 frame, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Advances the sector state selected by +0x20. State 0 is idle. State 1 ramps
 * angular velocity +0x10 upward by 0x20 to a cap of 0x400, transitions to state
 * 2 at the cap, and adds the velocity to phase +0x1C. State 2 continues adding
 * the fixed velocity. State 3 increments frame +0x28 toward duration +0x24;
 * while active it interpolates phase from +0x14 to +0x18 with Presentation_InterpolateEaseOutQuadratic,
 * and on completion snaps to +0x18 and returns to state 0. Other states are
 * ignored. Returns no value; only the sector state and interpolation helper
 * state change, with no direct hardware effects.
 */
extern "C" void func_ov034_021fd494(void *state)
{
    switch (FIELD(s32, state, 0x20)) {
    case 0:
        return;
    case 1: {
        s32 velocity = FIELD(s32, state, 0x10) + 0x20;
        FIELD(s32, state, 0x10) = velocity;
        if (velocity >= 0x400) {
            FIELD(s32, state, 0x10) = 0x400;
            FIELD(s32, state, 0x20)++;
        }
        FIELD(s32, state, 0x1c) += FIELD(s32, state, 0x10);
        return;
    }
    case 2:
        FIELD(s32, state, 0x1c) += FIELD(s32, state, 0x10);
        return;
    case 3: {
        s32 frame = ++FIELD(s32, state, 0x28);
        s32 duration = FIELD(s32, state, 0x24);
        if (frame >= duration) {
            FIELD(s32, state, 0x20) = 0;
            FIELD(s32, state, 0x1c) = FIELD(s32, state, 0x18);
            return;
        }
        FIELD(s32, state, 0x1c) =
            Presentation_InterpolateEaseOutQuadratic(FIELD(s32, state, 0x14),
                          FIELD(s32, state, 0x18), frame, duration);
        return;
    }
    }
}
