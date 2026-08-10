#include "tingle/types.h"

/*
 * Overlay 4 presentation destruction. This recovered helper clears the active
 * flag, stops optional sound state, releases an owned child and its resources.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay004PresentationDestroyState {
    void *descriptor_000;
    u8 field_004[0x1c];
    u32 flags_020;
    u8 field_024[0x30];
    u8 resource_054[0x0c];
    void *context_060;
    void *fontContext_064;
    void *child_068;
    u8 controller_06c[1];
    u8 field_06d[0xe7];
    s32 soundId_154;
} Overlay004PresentationDestroyState;

typedef void (*Overlay004ChildDestroy)(void *child);

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern u8 data_ov004_021fcda0[];
extern void func_020597fc(void *context, s32 soundId);
extern void GraphicsSpriteGroup_Destroy(void *resource);
extern void func_ov004_021fb6e0(void *controller);
extern void func_02071eb8(void *resource);
#ifdef __cplusplus
}
#endif

/*
 * Restore the overlay descriptor, clear flag 0x400, and stop soundId_154 when
 * nonnegative. If child_068 exists, invoke virtual slot +4 from its vtable.
 * Release context_060 and fontContext_064, run the controller no-op hook, tear
 * down resource_054, and return state. Sound/resource effects occur through
 * callees; the child virtual operation is confirmed but its ownership name is
 * inferred from destructor context.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay004PresentationDestroyState *func_ov004_021fb868(
    Overlay004PresentationDestroyState *state)
{
    state->descriptor_000 = data_ov004_021fcda0;
    state->flags_020 &= ~0x400;
    if (state->soundId_154 >= 0) {
        func_020597fc(gSoundContext, state->soundId_154);
    }
    if (state->child_068 != 0) {
        Overlay004ChildDestroy destroy =
            FIELD(Overlay004ChildDestroy, FIELD(void *, state->child_068, 0), 4);
        destroy(state->child_068);
    }
    GraphicsSpriteGroup_Destroy(state->context_060);
    GraphicsSpriteGroup_Destroy(state->fontContext_064);
    func_ov004_021fb6e0(state->controller_06c);
    func_02071eb8(state->resource_054);
    return state;
}
