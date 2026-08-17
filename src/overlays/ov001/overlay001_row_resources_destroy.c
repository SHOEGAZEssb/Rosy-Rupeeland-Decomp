#include "tingle/types.h"

/*
 * Overlay 1 row-resource destruction. This recovered helper releases the
 * optional presentation resource associated with each cell in one grid row.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001RowResourcesDestroyState {
    u8 field_000[0x1a4];
    s32 cellCount_1a4;
    u8 field_1a8[0x64];
    void *metadata_20c;
} Overlay001RowResourcesDestroyState;

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
 * index reaches cellCount_1a4. For every non-null resource at metadata+0x10,
 * call GraphicsSpriteState_ReleaseFromGroup, clear the pointer, and pass the record to AnimationResourceState_ReleaseResources.
 * Resource/SDK effects occur in those callees; no hardware is touched directly.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc5dc(Overlay001RowResourcesDestroyState *state, s32 row)
{
    s32 baseIndex = row * 5;
    s32 column;

    for (column = 0; column < 5; column++) {
        s32 index = baseIndex + column;

        if (index >= state->cellCount_1a4) {
            return;
        }
        if (FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x10) !=
            0) {
            GraphicsSpriteState_ReleaseFromGroup(FIELD(void *,
                                (u8 *)state->metadata_20c + index * 0x20,
                                0x10));
            FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x10) = 0;
            AnimationResourceState_ReleaseResources((u8 *)state->metadata_20c + index * 0x20);
        }
    }
}
