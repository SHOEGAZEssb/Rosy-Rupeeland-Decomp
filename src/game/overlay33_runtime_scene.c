#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/* Own overlay 33's runtime-bound child scene and synchronize its display object. */

typedef struct Overlay33Child { void **vtable; } Overlay33Child;
typedef struct RuntimeDisplayObject { void **vtable; u8 pad04[0xc]; u32 flags10; u32 flags14; } RuntimeDisplayObject;
typedef struct Overlay33RuntimeScene {
    Scene base;
    u32 parameter24;
    void *selection28;
    RuntimeDisplayObject *display2c;
    OverlaySlot overlay30;
    Overlay33Child *child3c;
} Overlay33RuntimeScene;

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable gOverlay33RuntimeSceneVTable;
extern char gOverlay33RuntimeSceneChildAllocationTag[];
extern u8 data_020d36e1[];
extern void *gGamePhaseRuntime;
extern void *gGamePhaseCurrencyHud;
extern Overlay33Child *func_ov033_021fd070(Overlay33Child *self, u32 parameter);
extern void func_ov030_021fd260(Overlay33Child *self);
extern s32 Overlay014_UpdatePresentationEnabled(Overlay33Child *self);
extern s32 func_ov033_021fd37c(Overlay33Child *self);
extern void func_ov033_021fd324(Overlay33Child *self, void *value);
extern void GamePhaseRuntime_UpdateDualScreenUiPresentation(void *runtime);
extern void GamePhaseRuntime_PrepareActorCollections(void *runtime, u32 value, s32 mode);
extern void GamePhaseRuntime_FinalizeActorCollections(void *runtime, u32 value, s32 mode);
extern void GamePhaseRuntime_SynchronizeActorPlacement(void *runtime, s32 index);
extern s32 RuntimePresentationManager_UpdatePresentations(
    void *manager, s32 graphicsUpdateArgument);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern void GamePhaseCurrencyHud_Update(void *context);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the Scene and embedded overlay slot, load overlay 33, allocate its
 * 0xd4-byte child with parameter, bind the runtime display object through its
 * offset-0x74 virtual, set display flag 0x40, snapshot the active selection,
 * set scene flags 0/1, and return self.
 */
Overlay33RuntimeScene *Overlay33RuntimeScene_Init(
    Overlay33RuntimeScene *self, u32 parameter)
{
    void *runtime;
    Overlay33Child *child;

    Scene_Init(&self->base);
    self->base.vtable = &gOverlay33RuntimeSceneVTable;
    OverlaySlot_Init(&self->overlay30);
    self->parameter24 = parameter;
    OverlaySlot_LoadOverlay(&self->overlay30, 0x21);
    child = (Overlay33Child *)Heap_Alloc(0xd4, gOverlay33RuntimeSceneChildAllocationTag, 4, &gHeapContext);
    if (child != 0)
        child = func_ov033_021fd070(child, parameter);
    self->child3c = child;
    runtime = gGamePhaseRuntime;
    self->display2c = *(RuntimeDisplayObject **)((u8 *)runtime + 0x2ea4);
    ((void (*)(void *, void *))self->display2c->vtable[0x1d])(
        self->display2c, data_020d36e1);
    self->display2c->flags14 |= 0x40;
    self->selection28 = **(void ***)((u8 *)runtime + 0x30bc);
    Scene_SetFlags03(&self->base);
    return self;
}

/*
 * Unbind and clear flags 0x40, 0x8, and 0x01000000 on the runtime display;
 * destroy/free the optional overlay child, unload and destroy its slot, destroy
 * the base Scene, and return self.
 */
Overlay33RuntimeScene *Overlay33RuntimeScene_Destroy(Overlay33RuntimeScene *self)
{
    self->base.vtable = &gOverlay33RuntimeSceneVTable;
    self->display2c->flags14 &= ~0x40;
    ((void (*)(void *, s32))self->display2c->vtable[0x1d])(self->display2c, 0);
    self->display2c->flags10 &= ~0x8;
    self->display2c->flags10 &= ~0x01000000;
    if (self->child3c != 0) {
        func_ov030_021fd260(self->child3c);
        Heap_Free(self->child3c);
    }
    OverlaySlot_UnloadOverlay(&self->overlay30);
    OverlaySlot_Destroy(&self->overlay30);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform the standard teardown, free the scene, and return its old address. */
Overlay33RuntimeScene *Overlay33RuntimeScene_DestroyAndFree(
    Overlay33RuntimeScene *self)
{
    self->base.vtable = &gOverlay33RuntimeSceneVTable;
    self->display2c->flags14 &= ~0x40;
    ((void (*)(void *, s32))self->display2c->vtable[0x1d])(self->display2c, 0);
    self->display2c->flags10 &= ~0x8;
    self->display2c->flags10 &= ~0x01000000;
    if (self->child3c != 0) {
        func_ov030_021fd260(self->child3c);
        Heap_Free(self->child3c);
    }
    OverlaySlot_UnloadOverlay(&self->overlay30);
    OverlaySlot_Destroy(&self->overlay30);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Rebind the display object whenever the runtime selection changes, update the
 * runtime and overlay child, destroy this scene if the child finishes, and when
 * its secondary poll is idle refresh two runtime channels, their managers, and
 * currency-HUD state. Returns one only when destroyed, otherwise zero.
 */
s32 Overlay33RuntimeScene_Update(Overlay33RuntimeScene *self)
{
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    void *selection = **(void ***)(runtime + 0x30bc);
    void *value;

    if (self->selection28 != selection) {
        self->selection28 = selection;
        self->display2c = *(RuntimeDisplayObject **)(runtime + 0x2ea4);
        ((void (*)(void *, void *))self->display2c->vtable[0x1d])(
            self->display2c, data_020d36e1);
        GamePhaseRuntime_UpdateDualScreenUiPresentation(runtime);
    }
    GamePhaseRuntime_PrepareActorCollections(runtime, self->base.value04, 3);
    if (Overlay014_UpdatePresentationEnabled(self->child3c) != 0) {
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    }
    if (func_ov033_021fd37c(self->child3c) != 0)
        return 0;
    GamePhaseRuntime_SynchronizeActorPlacement(runtime, 0);
    GamePhaseRuntime_SynchronizeActorPlacement(runtime, 1);
    RuntimePresentationManager_UpdatePresentations(runtime + 0x2f7c, 1);
    GamePhaseRuntime_FinalizeActorCollections(runtime, self->base.value04, 3);
    value = ActorMotionAreaFollower_GetPosition(runtime + 0x2fbc);
    func_ov033_021fd324(self->child3c, value);
    GamePhaseCurrencyHud_Update(gGamePhaseCurrencyHud);
    return 0;
}

/* Invoke method 0x0c on the runtime root and return zero. */
s32 GamePhaseRuntime_InvokeRootMethod0C(void)
{
    Scene *runtime = (Scene *)gGamePhaseRuntime;
    runtime->vtable->method0C(runtime);
    return 0;
}
