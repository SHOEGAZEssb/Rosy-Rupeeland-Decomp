#include "tingle/types.h"

/*
 * Overlay 0 row-resource destruction. This recovered helper releases the
 * optional presentation resource associated with each cell in one grid row.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000RowResourcesDestroyState {
    u8 field_000[0x250];
    void *metadata_250;
    s32 cellCount_254;
} Overlay000RowResourcesDestroyState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02073ef8(void *resource);
extern void func_02071f38(void *metadata);
#ifdef __cplusplus
}
#endif

/*
 * Visit the five metadata records beginning at row*5, returning when the next
 * index reaches cellCount_254. For every non-null resource at metadata+0x10,
 * call func_02073ef8, clear the pointer, and pass the record to func_02071f38.
 * Resource/SDK effects occur in those callees; no hardware is touched directly.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc96c(Overlay000RowResourcesDestroyState *state, s32 row)
{
    s32 baseIndex = row * 5;
    s32 column;

    for (column = 0; column < 5; column++) {
        s32 index = baseIndex + column;

        if (index >= state->cellCount_254) {
            return;
        }
        if (FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10) !=
            0) {
            func_02073ef8(FIELD(void *,
                                (u8 *)state->metadata_250 + index * 0x20,
                                0x10));
            FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10) = 0;
            func_02071f38((u8 *)state->metadata_250 + index * 0x20);
        }
    }
}
