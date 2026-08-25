#include "tingle/types.h"

/*
 * Overlay 1 view-record initialization. This recovered helper converts a flat
 * five-column cell index into the three-word saved view-state record.
 */

typedef struct Overlay001ViewIndexRecord {
    s32 firstVisibleRow_00;
    s32 selectedColumn_04;
    s32 selectedRow_08;
} Overlay001ViewIndexRecord;

/*
 * Ignore owner, store index modulo five as selectedColumn_04, and store index
 * divided by five in both row fields. Division is signed and truncates toward
 * zero. Returns no value and changes only output; the compiler division helper
 * is the only runtime service involved.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay001_GetViewRecordFromIndex(void *owner, Overlay001ViewIndexRecord *output,
                          s32 index)
{
    (void)owner;
    output->selectedColumn_04 = index % 5;
    output->firstVisibleRow_00 = index / 5;
    output->selectedRow_08 = output->firstVisibleRow_00;
}
