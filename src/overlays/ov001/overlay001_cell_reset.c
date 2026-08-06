#include "tingle/types.h"

/*
 * Overlay 1 cell-metadata reset. This recovered helper releases one optional
 * presentation resource and clears the metadata record's source linkage.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001CellResetState {
    u8 field_000[0x20c];
    void *metadata_20c;
} Overlay001CellResetState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02073ef8(void *resource);
extern void func_02071f38(void *metadata);
#ifdef __cplusplus
}
#endif

/*
 * For metadata[index], release non-null field +0x10 with func_02073ef8, clear
 * it, and pass the record to func_02071f38. Always clear linkage field +0x0C;
 * unlike overlay 0's counterpart, value field +0x1C is preserved. Resource
 * effects occur through callees, with no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc460(Overlay001CellResetState *state, s32 index)
{
    if (FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x10) != 0) {
        func_02073ef8(
            FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x10));
        FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x10) = 0;
        func_02071f38((u8 *)state->metadata_20c + index * 0x20);
    }
    FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x0c) = 0;
}
