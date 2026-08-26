#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/* Own overlay 34's selection runtime and its overlay-allocated child scene. */

typedef struct Overlay34RuntimeScene {
    Scene base;
    s32 result24;
    OverlaySlot overlay28;
    void *child34;
} Overlay34RuntimeScene;

typedef char Overlay34RuntimeSceneSizeCheck[
    sizeof(Overlay34RuntimeScene) == 0x38 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020e5890;
extern const char data_020e58f0[];
extern void *gSoundContext;
extern void *func_ov034_021fdae8(void *object);
extern void Sound_SetModalEnvelopeEnabled(void *sound, s32 first, s32 second,
                                          s32 third, s32 fourth);
extern void GridEffectActorRegistry_FinalizeDepartingActors(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the Scene and embedded overlay slot, set scene value 21, load
 * overlay 34, and allocate/construct its 0x1c8-byte child. Start the retail
 * 20-to-30 sound transition, finalize departing grid-effect actors, set Scene
 * flags 0/1, and return `self`. Allocation failure stores null exactly as the
 * retail constructor does; the scene owns any successfully constructed child.
 */
Overlay34RuntimeScene *Overlay34RuntimeScene_Init(
    Overlay34RuntimeScene *self)
{
    void *child;

    Scene_Init(&self->base);
    self->base.vtable = &data_020e5890;
    self->result24 = -1;
    OverlaySlot_Init(&self->overlay28);
    self->base.value04 = 21;
    OverlaySlot_LoadOverlay(&self->overlay28, 34);
    child = Heap_Alloc(0x1c8, data_020e58f0, 4, &gHeapContext);
    if (child != 0)
        child = func_ov034_021fdae8(child);
    self->child34 = child;
    Sound_SetModalEnvelopeEnabled(gSoundContext, 1, 0, 20, 30);
    GridEffectActorRegistry_FinalizeDepartingActors();
    Scene_SetFlags03(&self->base);
    return self;
}
