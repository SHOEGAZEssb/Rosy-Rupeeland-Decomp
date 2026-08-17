#include "tingle/types.h"

/*
 * Overlay 0 cell-metadata reset. This recovered helper releases an optional
 * resource owned by one 0x20-byte metadata record and clears its cell linkage.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000CellResetState {
    u8 field_000[0x250];
    void *metadata_250;
} Overlay000CellResetState;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_ReleaseFromGroup(void *resource);
extern void AnimationResourceState_ReleaseResources(void *metadata);
#ifdef __cplusplus
}
#endif

/*
 * For metadata[index], release the non-null field at +0x10 with GraphicsSpriteState_ReleaseFromGroup,
 * clear it, and pass the record to AnimationResourceState_ReleaseResources. In all cases clear fields
 * +0x0C and +0x1C. The exact resource type and callee subsystem are not yet
 * confirmed; this helper itself performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc6b4(Overlay000CellResetState *state, s32 index)
{
    if (FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10) != 0) {
        GraphicsSpriteState_ReleaseFromGroup(
            FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10));
        FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x10) = 0;
        AnimationResourceState_ReleaseResources((u8 *)state->metadata_250 + index * 0x20);
    }
    FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x0c) = 0;
    FIELD(s32, (u8 *)state->metadata_250 + index * 0x20, 0x1c) = 0;
}
