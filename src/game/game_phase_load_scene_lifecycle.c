#include "tingle/game_phase_load_scene.h"
#include "tingle/overlay_manager.h"
#include "tingle/heap.h"

/* Construct and destroy the scene that performs full game-phase loading. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseCurrencyHud;
extern void GraphicsBankStateSnapshot_Init(void *object);
extern void GraphicsBankStateSnapshot_Destroy(void *object);
#ifdef __cplusplus
}
#endif

typedef struct OwnedObjectVTable {
    void *method00;
    void *method04;
    void (*release)(void *self);
} OwnedObjectVTable;

typedef struct OwnedObject {
    OwnedObjectVTable *vtable;
} OwnedObject;

/*
 * Initialize the Scene and its four embedded helpers, retain the requested
 * scene request, enable Scene flags 0/1, and snapshot POWCNT1 bit 15. The flag
 * at currency-HUD offset 0xb0 determines restoreCurrencyHudVisibility with
 * inverted bit-0 polarity.
 */
GamePhaseLoadScene *GamePhaseLoadScene_Init(GamePhaseLoadScene *self, s32 sceneKind,
                                            s32 sceneArgument)
{
    u16 currencyHudFlags;

    Scene_Init(&self->base);
    self->base.vtable = &gGamePhaseLoadSceneVTable;
    GraphicsBankStateSnapshot_Init(&self->graphicsBankStateSnapshot);
    OverlaySlot_Init(&self->overlaySlot0);
    OverlaySlot_Init(&self->overlaySlot1);
    OverlaySlot_Init(&self->overlaySlot2);
    self->base.value04 = 9;
    self->sceneKind = sceneKind;
    self->sceneArgument = sceneArgument;
    self->loadedScene = 0;
    self->state = 0;
    self->loadedSceneCallbacksEnabled = 0;
    self->runtimeCallbacksEnabled = 1;
    Scene_SetFlags03(&self->base);
    currencyHudFlags = *(u16 *)((u8 *)gGamePhaseCurrencyHud + 0xb0);
    self->restoreCurrencyHudVisibility = (currencyHudFlags & 1) ? 0 : 1;
    self->savedScreenSwap =
        (*(volatile u16 *)0x04000304 & 0x8000) >> 15;
    return self;
}

/*
 * Release the optional owned object, destroy embedded helpers in reverse
 * construction order, destroy the Scene base, and return self without freeing.
 */
GamePhaseLoadScene *GamePhaseLoadScene_Destroy(GamePhaseLoadScene *self)
{
    self->base.vtable = &gGamePhaseLoadSceneVTable;
    self->loadedSceneCallbacksEnabled = 0;
    if (self->loadedScene != 0)
        ((OwnedObject *)self->loadedScene)->vtable->release(self->loadedScene);
    OverlaySlot_Destroy(&self->overlaySlot2);
    OverlaySlot_Destroy(&self->overlaySlot1);
    OverlaySlot_Destroy(&self->overlaySlot0);
    GraphicsBankStateSnapshot_Destroy(&self->graphicsBankStateSnapshot);
    Scene_Destroy(&self->base);
    return self;
}

/* Free a previously destroyed load-scene allocation and return its old address. */
GamePhaseLoadScene *GamePhaseLoadScene_FreeStorage(GamePhaseLoadScene *self)
{
    Heap_Free(self);
    return self;
}

/* Perform full lifecycle cleanup, free the Scene allocation, and return it. */
GamePhaseLoadScene *GamePhaseLoadScene_DestroyAndFree(GamePhaseLoadScene *self)
{
    self->base.vtable = &gGamePhaseLoadSceneVTable;
    self->loadedSceneCallbacksEnabled = 0;
    if (self->loadedScene != 0)
        ((OwnedObject *)self->loadedScene)->vtable->release(self->loadedScene);
    OverlaySlot_Destroy(&self->overlaySlot2);
    OverlaySlot_Destroy(&self->overlaySlot1);
    OverlaySlot_Destroy(&self->overlaySlot0);
    GraphicsBankStateSnapshot_Destroy(&self->graphicsBankStateSnapshot);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}
