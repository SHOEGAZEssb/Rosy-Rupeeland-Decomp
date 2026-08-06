#include "tingle/types.h"

/*
 * Overlay 1 grid hit testing. This recovered helper maps a screen-space point
 * into the scrolled five-column, three-row visible grid window.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001GridHitState {
    u8 field_000[0x1a4];
    s32 cellCount_1a4;
    u8 field_1a8[0x10];
    s32 originY_1b8;
    void *controller_1bc;
} Overlay001GridHitState;

typedef struct Overlay001PointRecord {
    u32 field_00;
    s32 x_04;
    s32 y_08;
} Overlay001PointRecord;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Return the cell under point, or -1 outside the cell-centered bounds
 * X=-18..162 and Y=-18..90 relative to the scrolled panel. Convert by 0x24,
 * clamp to columns 0..4 and rows 0..2, add controller first row at +0x0C, and
 * reject indices at or beyond cellCount_1A4. State is unchanged; the explicit
 * division helper has no hardware effect.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc0ac(Overlay001GridHitState *state,
                         const Overlay001PointRecord *point)
{
    s32 firstRow = FIELD(s32, state->controller_1bc, 0x0c);
    s32 relativeX = point->x_04 - 0x38;
    s32 relativeY = point->y_08 - state->originY_1b8 - firstRow * 0x24;
    s32 column;
    s32 row;
    s32 index;

    if (relativeX + 0x12 < 0) {
        return -1;
    }
    if (relativeX - 0x12 > 0x90) {
        return -1;
    }
    if (relativeY + 0x12 < 0) {
        return -1;
    }
    if (relativeY - 0x12 > 0x48) {
        return -1;
    }
    column = func_020befec(relativeX + 0x12, 0x24);
    row = func_020befec(relativeY + 0x12, 0x24);
    if (column >= 5) {
        column = 4;
    }
    if (row >= 3) {
        row = 2;
    }
    index = column + (row + firstRow) * 5;
    return index >= state->cellCount_1a4 ? -1 : index;
}
