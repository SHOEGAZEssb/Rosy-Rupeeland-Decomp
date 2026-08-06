#include "tingle/types.h"

/*
 * Overlay 3 pair copying. This recovered helper copies one two-word drawing
 * table record and is used by the constructor's in-place shuffle.
 */

typedef struct Overlay003PairCopyRecord {
    u32 field_00;
    u32 field_04;
} Overlay003PairCopyRecord;

/*
 * Copy both words from source to destination in order. Returns no value, calls
 * no SDK or hardware service, and permits distinct temporary stack records as
 * used by the shuffle; overlap semantics beyond exact equality are unspecified.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov003_021fb7c0(Overlay003PairCopyRecord *destination,
                          const Overlay003PairCopyRecord *source)
{
    destination->field_00 = source->field_00;
    destination->field_04 = source->field_04;
}
