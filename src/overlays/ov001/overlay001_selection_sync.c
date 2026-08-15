#include "tingle/types.h"

/*
 * Overlay 1 selection synchronization. This recovered helper maps controller
 * state to the active cell and positions the primary and optional cursors.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001SelectionSyncState {
    u8 field_000[0x1c];
    void *transient_01c;
    void *primaryCursor_020;
    void *secondaryCursor_024;
    u8 field_028[0x17c];
    s32 cellCount_1a4;
    u8 field_1a8[0x04];
    s32 activeIndex_1ac;
    s32 secondaryIndex_1b0;
    u8 field_1b4[0x08];
    void *controller_1bc;
    u8 field_1c0[0x38];
    s32 transientCounter_1f8;
    s32 transientDuration_1fc;
    u8 field_200[0x0c];
    void *metadata_20c;
} Overlay001SelectionSyncState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Compute activeIndex_1ac from the controller's selected row (+0x14) and the
 * stored column at +0x1CC, then position primaryCursor_020 within the visible
 * three-row grid. If no transient is attached, select metadata[index]+0x10 and
 * start its 30-tick interval. When secondaryIndex_1b0 is nonnegative and its
 * row lies in the visible window, position secondaryCursor_024 and clear its
 * hidden bit (bit 2 at +0x24); otherwise set that bit. The divide helper yields
 * quotient and remainder for division by five. Returns no value and performs
 * no direct hardware access; cursor objects are mutated in place.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc644(Overlay001SelectionSyncState *state)
{
    s32 selectedRow = FIELD(s32, state->controller_1bc, 0x14);
    s32 firstVisibleRow = FIELD(s32, state->controller_1bc, 0x0c);
    s32 column = FIELD(s32, state, 0x1cc);
    s32 localRow;

    state->activeIndex_1ac = column + selectedRow * 5;
    FIELD(u16, state->primaryCursor_020, 0x2c) =
        (u16)(column * 0x24 + 0x38);
    FIELD(u16, state->primaryCursor_020, 0x2e) =
        (u16)((selectedRow - firstVisibleRow) * 0x24 + 0x34);
    if (state->transient_01c == 0) {
        state->transient_01c =
            FIELD(void *,
                  (u8 *)state->metadata_20c + state->activeIndex_1ac * 0x20,
                  0x10);
        state->transientCounter_1f8 = 0;
        state->transientDuration_1fc = 0x1e;
    }

    if (state->secondaryIndex_1b0 < 0) {
        FIELD(u16, state->secondaryCursor_024, 0x24) |= 4;
        return;
    }
    localRow = state->secondaryIndex_1b0 / 5 - firstVisibleRow;
    if (localRow < 0 || localRow >= 3) {
        FIELD(u16, state->secondaryCursor_024, 0x24) |= 4;
        return;
    }
    FIELD(u16, state->secondaryCursor_024, 0x2c) =
        (u16)((state->secondaryIndex_1b0 % 5) * 0x24 + 0x38);
    FIELD(u16, state->secondaryCursor_024, 0x2e) =
        (u16)(localRow * 0x24 + 0x34);
    FIELD(u16, state->secondaryCursor_024, 0x24) &= ~4;
}
