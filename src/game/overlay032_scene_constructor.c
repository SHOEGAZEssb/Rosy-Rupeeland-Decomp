/*
 * Recovered resident scene constructor for overlay 32's composite UI runtime.
 *
 * The scene owns its overlay slot and the heap allocation published through
 * data_021f6380. Overlay code constructs that allocation after the recovered
 * loader makes overlay 32's initialized data resident.
 */
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"
#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

extern SceneVTable data_020f2c3c;
extern const char data_020f2c68[];
extern void *data_021f6380;
extern void *func_ov032_021fce20(void *object);
extern void *func_ov032_021fd7f8(void *object);
extern void func_ov032_021fd920(void *object);
extern s32 func_ov032_021fdf30(void *object);

#ifdef __cplusplus
}
#endif

typedef struct Overlay032Scene {
    Scene base;
    OverlaySlot overlaySlot;
} Overlay032Scene;

typedef char Overlay032SceneSizeCheck[
    sizeof(Overlay032Scene) == 0x30 ? 1 : -1];

/*
 * Initialize `self`, load overlay 32 through the owned slot, allocate its
 * 0xf30-byte composite object with four-byte alignment, construct it when the
 * allocation succeeds, and publish the resulting pointer globally. Returns
 * `self`; scene, overlay, heap, and overlay-owned UI state change. Allocation
 * failure publishes null exactly as retail does.
 */
Overlay032Scene *Overlay032Scene_Init(Overlay032Scene *self)
{
    void *object;

    Scene_Init(&self->base);
    self->base.vtable = &data_020f2c3c;
    OverlaySlot_Init(&self->overlaySlot);
    Scene_SetFlags03(&self->base);
    Scene_ClearFlag02(&self->base);
    OverlaySlot_LoadOverlay(&self->overlaySlot, 32);
    object = Heap_Alloc(0xf30, data_020f2c68, 4, &gHeapContext);
    if (object != 0)
        object = func_ov032_021fce20(object);
    data_021f6380 = object;
    return self;
}

/*
 * Unload the owned overlay slot and destroy the Scene base without freeing
 * `self`. Returns `self`; overlay and scene-owned state are released.
 */
Overlay032Scene *Overlay032Scene_Destroy(Overlay032Scene *self)
{
    OverlaySlot_Destroy(&self->overlaySlot);
    Scene_Destroy(&self->base);
    return self;
}

/*
 * Perform the complete overlay-32 scene teardown, free `self`, and return its
 * former address. The returned value must not be dereferenced.
 */
Overlay032Scene *Overlay032Scene_Delete(Overlay032Scene *self)
{
    Overlay032Scene_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Advance the overlay-owned composite object. Return zero while it remains
 * active. On completion, destroy and free the composite allocation, clear its
 * global publication, unload overlay 32, delete this scene through virtual
 * slot 1, and return one.
 */
s32 Overlay032Scene_UpdateLifecycle(Overlay032Scene *self)
{
    void *object = data_021f6380;

    if (func_ov032_021fdf30(object) != 1)
        return 0;
    if (object != 0) {
        func_ov032_021fd7f8(object);
        Heap_Free(object);
    }
    data_021f6380 = 0;
    OverlaySlot_UnloadOverlay(&self->overlaySlot);
    if (self != 0)
        self->base.vtable->destroyAndFree(&self->base);
    return 1;
}

/*
 * Run overlay 32's auxiliary per-frame update when its composite allocation
 * exists. Return zero in both the present and absent cases.
 */
s32 Overlay032Scene_UpdateAuxiliary(Overlay032Scene *self)
{
    (void)self;
    if (data_021f6380 != 0)
        func_ov032_021fd920(data_021f6380);
    return 0;
}
