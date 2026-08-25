#include "tingle/types.h"

/*
 * Overlay 5 presentation update. This recovered callback advances the main
 * controller, cached rendering context, and populated scene once per frame.
 */

typedef void (*Overlay005VirtualUpdate)(void *object);

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_AdvanceAnimations(void *context);
extern s32 Overlay005_UpdateScenePopulation(void *scene);
#ifdef __cplusplus
}
#endif

/*
 * Invoke the +0x64 controller's vtable slot at +0x08, update context +0x60 via
 * GraphicsSpriteGroup_AdvanceAnimations, then call Overlay005_UpdateScenePopulation on scene +0x74 and return its
 * result. The original assumes all three pointers are valid. Observable
 * renderer and scene changes are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov005_021fc5e4(void *state)
{
    void *controller = *(void **)((u8 *)state + 0x64);
    void *vtable = *(void **)controller;
    Overlay005VirtualUpdate update =
        *(Overlay005VirtualUpdate *)((u8 *)vtable + 0x08);

    update(controller);
    GraphicsSpriteGroup_AdvanceAnimations(*(void **)((u8 *)state + 0x60));
    return Overlay005_UpdateScenePopulation(*(void **)((u8 *)state + 0x74));
}
