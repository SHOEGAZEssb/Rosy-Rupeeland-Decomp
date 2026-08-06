#include "tingle/types.h"

/*
 * Overlay 0 grid hit testing. This recovered helper maps a screen-space point
 * into the dynamically sized five-column grid while accounting for scrolling.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000GridState {
    u8 field_000[0x254];
    s32 cellCount_254;
    u8 field_258[0x10];
    s32 originY_268;
    void *controller_26c;
} Overlay000GridState;

typedef struct Overlay000PointRecord {
    u32 field_00;
    s32 x_04;
    s32 y_08;
} Overlay000PointRecord;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Return the cell under point, or -1 when its 0x24-pixel cell-centered bounds
 * lie outside the 5x3 visible panel or the computed index is not allocated.
 * The controller's first visible row (field 0x0C) and state's originY_268
 * provide the scroll offset. Inputs and global state are unchanged, and no SDK
 * or hardware service is called.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc298(Overlay000GridState *state,
                        const Overlay000PointRecord *point)
{
    s32 firstRow = FIELD(s32, state->controller_26c, 0x0c);
    s32 relativeX = point->x_04 - 0x38;
    s32 relativeY = point->y_08 - state->originY_268 - firstRow * 0x24;
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
    return index >= state->cellCount_254 ? -1 : index;
}
