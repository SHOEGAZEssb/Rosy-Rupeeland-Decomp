#include "tingle/types.h"

/*
 * Overlay 0 view-record initialization. This recovered helper converts a flat
 * five-column cell index into the three-word view-state record used above.
 */

typedef struct Overlay000ViewIndexRecord {
    s32 firstVisibleRow_00;
    s32 selectedColumn_04;
    s32 selectedRow_08;
} Overlay000ViewIndexRecord;

/*
 * Ignore owner, store index%5 as selectedColumn_04, and store index/5 in both
 * firstVisibleRow_00 and selectedRow_08. Division is signed and truncates toward
 * zero. Returns no value, changes only output, and calls no SDK/hardware service
 * apart from the compiler's integer division runtime helper.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fcb64(void *owner, Overlay000ViewIndexRecord *output,
                         s32 index)
{
    (void)owner;
    output->selectedColumn_04 = index % 5;
    output->firstVisibleRow_00 = index / 5;
    output->selectedRow_08 = output->firstVisibleRow_00;
}
