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
extern void GraphicsSpriteState_ReleaseFromGroup(void *resource);
extern void AnimationResourceState_ReleaseResources(void *metadata);
#ifdef __cplusplus
}
#endif

/*
 * Visit the five metadata records beginning at row*5, returning when the next
 * index reaches cellCount_254. For every non-null resource at metadata+0x10,
 * call GraphicsSpriteState_ReleaseFromGroup, clear the pointer, and pass the record to AnimationResourceState_ReleaseResources.
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
            GraphicsSpriteState_ReleaseFromGroup(FIELD(void *,
                                (u8 *)state->metadata_250 + index * 0x20,
                                0x10));
            FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10) = 0;
            AnimationResourceState_ReleaseResources((u8 *)state->metadata_250 + index * 0x20);
        }
    }
}
