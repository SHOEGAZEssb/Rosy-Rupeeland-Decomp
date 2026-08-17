#include "tingle/types.h"

/*
 * Overlay 1 presentation-state teardown. This recovered helper releases the
 * optional polymorphic object and destroys embedded resources in reverse order.
 */

typedef struct Overlay001PresentationState {
    void *owner_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    u8 rendererState_20[0x24];
    void *presentation_44;
} Overlay001PresentationState;

typedef struct Overlay001PresentationVTable {
    void *field_00;
    void (*destroy_04)(void *presentation);
} Overlay001PresentationVTable;

typedef struct Overlay001Presentation {
    Overlay001PresentationVTable *vtable;
} Overlay001Presentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_Destroy(void *resource);
extern void GraphicsSpriteGroup_Destroy(void *owner);
extern void func_020927b8(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Destroy presentation_44 through virtual slot +4 when non-null, release
 * spriteOwner_04, destroy rendererState_20, then destroy resources +0x14 and
 * +8. Return state for destructor chaining. Callees mutate heap/presentation
 * ownership; this wrapper has no direct hardware effect.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay001PresentationState *func_ov001_021fb7d4(
    Overlay001PresentationState *state)
{
    Overlay001Presentation *presentation =
        (Overlay001Presentation *)state->presentation_44;

    if (presentation != 0) {
        presentation->vtable->destroy_04(presentation);
    }
    GraphicsSpriteGroup_Destroy(state->spriteOwner_04);
    func_020927b8(state->rendererState_20);
    AnimationResourceState_Destroy(state->resource_14);
    AnimationResourceState_Destroy(state->resource_08);
    return state;
}
