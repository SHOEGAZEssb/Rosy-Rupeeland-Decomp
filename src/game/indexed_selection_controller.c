#include "tingle/types.h"

/*
 * Indexed selection-controller construction and range setup recovered at
 * 0x02093a88..0x02093cb3. The caller owns the 0x38-byte state, while the
 * installed retail table remains static game data. No allocation, hardware
 * access, or failure path occurs.
 */

extern const u8 data_020f261c[];

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Initialize a borrowed controller state to the retail defaults. */
void IndexedSelectionController_Init(void *controller)
{
    FIELD(const void *, controller, 0x00) = data_020f261c;
    FIELD(s32, controller, 0x04) = 0;
    FIELD(s32, controller, 0x08) = 0;
    FIELD(s32, controller, 0x0c) = 0;
    FIELD(s32, controller, 0x10) = 0;
    FIELD(s32, controller, 0x14) = 0;
    FIELD(s32, controller, 0x18) = 0;
    FIELD(s32, controller, 0x1c) = 0x10;
    FIELD(s32, controller, 0x20) = 0;
    FIELD(s32, controller, 0x24) = 0;
    FIELD(s32, controller, 0x28) = 0;
    FIELD(s32, controller, 0x2c) = 6;
    FIELD(s32, controller, 0x30) = 4;
    FIELD(s32, controller, 0x34) = 0;
}

/* Set inclusive bounds and the current value, clearing transition progress. */
void IndexedSelectionController_ConfigureRange(void *controller, s32 lower, s32 upper, s32 current)
{
    FIELD(s32, controller, 0x04) = lower;
    FIELD(s32, controller, 0x08) = upper;
    FIELD(s32, controller, 0x0c) = current;
    FIELD(s32, controller, 0x10) = current;
    FIELD(s32, controller, 0x14) = 0;
    FIELD(s32, controller, 0x18) = 0;
}

/* Clamp a requested value to the configured bounds and snap both endpoints. */
void IndexedSelectionController_SetValue(void *controller, s32 value)
{
    if (value < FIELD(s32, controller, 0x04))
        value = FIELD(s32, controller, 0x04);
    else if (value > FIELD(s32, controller, 0x08))
        value = FIELD(s32, controller, 0x08);
    FIELD(s32, controller, 0x0c) = value;
    FIELD(s32, controller, 0x10) = value;
}

/* Clear the transition phase and its per-phase frame counter. */
void IndexedSelectionController_ResetTransition(void *controller)
{
    FIELD(s32, controller, 0x14) = 0;
    FIELD(s32, controller, 0x18) = 0;
}

/* Snap the transition origin to the current selection. */
void IndexedSelectionController_SnapTransitionOrigin(void *controller)
{
    FIELD(s32, controller, 0x10) = FIELD(s32, controller, 0x0c);
}

/* Move one entry toward the upper bound and report whether movement occurred. */
s32 IndexedSelectionController_Increment(void *controller)
{
    FIELD(s32, controller, 0x34) = 1;
    if (FIELD(s32, controller, 0x0c) < FIELD(s32, controller, 0x08)) {
        ++FIELD(s32, controller, 0x0c);
        return 1;
    }
    return 0;
}

/* Move one entry toward the lower bound and report whether movement occurred. */
s32 IndexedSelectionController_Decrement(void *controller)
{
    FIELD(s32, controller, 0x34) = 0;
    if (FIELD(s32, controller, 0x0c) > FIELD(s32, controller, 0x04)) {
        --FIELD(s32, controller, 0x0c);
        return 1;
    }
    return 0;
}

/* Advance one entry, wrapping from the upper bound to the lower bound. */
void IndexedSelectionController_IncrementWrap(void *controller)
{
    s32 value = FIELD(s32, controller, 0x0c);
    FIELD(s32, controller, 0x0c) =
        value < FIELD(s32, controller, 0x08)
            ? value + 1 : FIELD(s32, controller, 0x04);
    FIELD(s32, controller, 0x34) = 1;
}

/* Retreat one entry, wrapping from the lower bound to the upper bound. */
void IndexedSelectionController_DecrementWrap(void *controller)
{
    s32 value = FIELD(s32, controller, 0x0c);
    FIELD(s32, controller, 0x0c) =
        value > FIELD(s32, controller, 0x04)
            ? value - 1 : FIELD(s32, controller, 0x08);
    FIELD(s32, controller, 0x34) = 0;
}

/* Return the most recently selected movement direction. */
s32 IndexedSelectionController_GetLastDirection(void *controller)
{
    return FIELD(s32, controller, 0x34);
}

/* Advance the retail selection-transition delay and pacing state. */
s32 IndexedSelectionController_AdvanceTransition(void *controller)
{
    if (FIELD(s32, controller, 0x10) == FIELD(s32, controller, 0x0c)) {
        FIELD(s32, controller, 0x20) = 0;
        FIELD(s32, controller, 0x14) = 0;
        return 0;
    }

    if (FIELD(s32, controller, 0x14) == 1) {
        s32 frame = FIELD(s32, controller, 0x18) + 1;
        FIELD(s32, controller, 0x18) = frame;
        if (frame < FIELD(s32, controller, 0x1c)) {
            FIELD(s32, controller, 0x0c) = FIELD(s32, controller, 0x10);
            return 0;
        }
    }

    FIELD(s32, controller, 0x18) = 0;
    FIELD(s32, controller, 0x28) = 0;
    ++FIELD(s32, controller, 0x14);
    FIELD(s32, controller, 0x24) =
        FIELD(s32, controller, 0x14) > 8
            ? FIELD(s32, controller, 0x30)
            : FIELD(s32, controller, 0x2c);
    FIELD(s32, controller, 0x20) = 1;
    return 1;
}

/* Report whether the controller is outside an active transition. */
s32 IndexedSelectionController_IsTransitionIdle(void *controller)
{
    return FIELD(s32, controller, 0x20) == 0;
}

/* Tick the active pacing interval and report when it is idle or complete. */
s32 IndexedSelectionController_AdvancePacing(void *controller)
{
    if (FIELD(s32, controller, 0x24) != 0) {
        ++FIELD(s32, controller, 0x28);
        if (FIELD(s32, controller, 0x28) != FIELD(s32, controller, 0x24))
            return 0;
        FIELD(s32, controller, 0x24) = 0;
    }
    return 1;
}

#undef FIELD
