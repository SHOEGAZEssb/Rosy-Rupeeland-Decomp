#include "tingle/types.h"

/*
 * Overlay 1 view-state capture. This recovered helper snapshots the grid's
 * first visible row, selected column, and selected row into a three-word record.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001ViewCaptureState {
    u8 field_000[0x1bc];
    void *controller_1bc;
    u8 field_1c0[0x0c];
    s32 selectedColumn_1cc;
} Overlay001ViewCaptureState;

typedef struct Overlay001ViewCaptureRecord {
    s32 firstVisibleRow_00;
    s32 selectedColumn_04;
    s32 selectedRow_08;
} Overlay001ViewCaptureRecord;

/*
 * Write controller field 0x0C, state selectedColumn_1cc, and controller field
 * 0x14 to output offsets 0, 4, and 8. The paired apply routine confirms these
 * are the first visible row, selected column, and selected row. Returns no
 * value, changes no source state, and calls no SDK or hardware service.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fca94(Overlay001ViewCaptureRecord *output,
                          const Overlay001ViewCaptureState *state)
{
    output->firstVisibleRow_00 = FIELD(s32, state->controller_1bc, 0x0c);
    output->selectedColumn_04 = state->selectedColumn_1cc;
    output->selectedRow_08 = FIELD(s32, state->controller_1bc, 0x14);
}
