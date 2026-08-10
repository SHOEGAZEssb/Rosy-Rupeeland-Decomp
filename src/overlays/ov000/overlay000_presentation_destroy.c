#include "tingle/types.h"

/*
 * Overlay 0 presentation-state teardown. This recovered unit releases the
 * optional polymorphic presentation object and destroys the embedded sprite
 * owner, renderer state, and resource handles in retail reverse order.
 */

typedef struct Overlay000PresentationState {
    void *owner_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    u8 rendererState_20[0x24];
    void *presentation_44;
} Overlay000PresentationState;

typedef struct Overlay000PresentationVTable {
    void *field_00;
    void (*destroy_04)(void *presentation);
} Overlay000PresentationVTable;

typedef struct Overlay000Presentation {
    Overlay000PresentationVTable *vtable;
} Overlay000Presentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071eb8(void *resource);
extern void GraphicsSpriteGroup_Destroy(void *owner);
extern void func_020927b8(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Destroy state's optional presentation through virtual slot 4, release the
 * sprite owner, destroy rendererState_20, then destroy resource_14 and
 * resource_08. Returns state for destructor chaining. These calls mutate heap
 * and graphics-resource ownership but this wrapper has no direct hardware
 * effect; a null presentation skips only the virtual destruction call.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay000PresentationState *func_ov000_021fb848(
    Overlay000PresentationState *state)
{
    Overlay000Presentation *presentation =
        (Overlay000Presentation *)state->presentation_44;

    if (presentation != 0) {
        presentation->vtable->destroy_04(presentation);
    }
    GraphicsSpriteGroup_Destroy(state->spriteOwner_04);
    func_020927b8(state->rendererState_20);
    func_02071eb8(state->resource_14);
    func_02071eb8(state->resource_08);
    return state;
}
