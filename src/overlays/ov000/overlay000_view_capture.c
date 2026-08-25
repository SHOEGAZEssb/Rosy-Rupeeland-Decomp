#include "tingle/types.h"

/*
 * Overlay 0 view-state capture. This recovered helper snapshots the grid's
 * first visible row, selected column, and selected row into a three-word record.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000ViewCaptureState {
    u8 field_000[0x26c];
    void *controller_26c;
    u8 field_270[0x0c];
    s32 selectedColumn_27c;
} Overlay000ViewCaptureState;

typedef struct Overlay000ViewCaptureRecord {
    s32 firstVisibleRow_00;
    s32 selectedColumn_04;
    s32 selectedRow_08;
} Overlay000ViewCaptureRecord;

/*
 * Write controller field 0x0C, state selectedColumn_27c, and controller field
 * 0x14 to output offsets 0, 4, and 8. The paired apply routine confirms these
 * are the first visible row, selected column, and selected row. Returns no
 * value, changes no source state, and calls no SDK or hardware service.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay000_CaptureViewState(Overlay000ViewCaptureRecord *output,
                         const Overlay000ViewCaptureState *state)
{
    output->firstVisibleRow_00 = FIELD(s32, state->controller_26c, 0x0c);
    output->selectedColumn_04 = state->selectedColumn_27c;
    output->selectedRow_08 = FIELD(s32, state->controller_26c, 0x14);
}
