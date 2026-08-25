#include "tingle/display_controller.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/* Own the small scene that loads overlay 52 and drives its child object. */

typedef struct Overlay52Child {
    SceneVTable *vtable;
    s16 state04;
} Overlay52Child;

typedef struct Overlay52Scene {
    Scene base;
    u32 parameter24;
    Overlay52Child *child28;
} Overlay52Scene;

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable gOverlay52SceneVTable;
extern char gOverlay52ChildAllocationTag[];
extern DisplayBrightnessPair gDisplayBrightnessPair;
extern void *gDebugFont;
extern void *gSoundContext;
extern HeapContext gHeapContext;
extern void *gGamePhaseRuntime;
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *renderer);
extern Overlay52Child *Overlay052Scene_Init(Overlay52Child *self, s32 first,
                                           s32 second);
extern void Overlay052Scene_SetMessageById(Overlay52Child *self, u16 parameter,
                                s32 value);
extern s32 Overlay052Scene_UpdateMessageMenu(Overlay52Child *self);
extern void Overlay052Scene_BeginConfirmationFade(Overlay52Child *self);
extern void Sound_Play(void *context, s32 bank, s32 soundId);
extern void GamePhaseRuntime_UpdateActorPresentationState(void *runtime, s32 mode);
extern void GamePhaseState_UpdateRenderHelpers(void *value);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base Scene, install the overlay-52 vtable, remember parameter,
 * and clear the child.  Start a sub-screen fade from 0 to -16, load overlay 52
 * in slot 0, set scene flags 0/1, and return self.
 */
Overlay52Scene *Overlay52Scene_Init(Overlay52Scene *self, u32 messageId)
{
    DisplayBrightness *brightness;

    Scene_Init(&self->base);
    self->base.vtable = &gOverlay52SceneVTable;
    self->parameter24 = messageId;
    self->child28 = 0;
    brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
    DisplayBrightness_StartTransition(brightness, 0, -16, 8);
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 0, 0x34);
    Scene_SetFlags03(&self->base);
    return self;
}

/*
 * Clear scene flags, destroy an optional child through its deleting virtual,
 * unload overlay slots 0 and 2, destroy the base Scene, and return self.
 */
Overlay52Scene *Overlay52Scene_Destroy(Overlay52Scene *self)
{
    self->base.vtable = &gOverlay52SceneVTable;
    Scene_ClearFlags03(&self->base);
    if (self->child28 != 0)
        self->child28->vtable->destroyAndFree((Scene *)self->child28);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 0);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform Overlay52Scene_Destroy's teardown, free the scene, and return its old address. */
Overlay52Scene *Overlay52Scene_DestroyAndFree(Overlay52Scene *self)
{
    self->base.vtable = &gOverlay52SceneVTable;
    Scene_ClearFlags03(&self->base);
    if (self->child28 != 0)
        self->child28->vtable->destroyAndFree((Scene *)self->child28);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 0);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * After the fade reaches -16, refresh the debug renderer, allocate and start
 * the overlay child, play sound 111, and fade back to zero.  Later frames poll
 * the child, relay its state-one event, and destroy this scene when the child
 * reports completion.  Runtime mode 2 is applied on non-completing frames;
 * returns one only when the scene was destroyed, otherwise zero.
 */
s32 Overlay52Scene_Update(Overlay52Scene *self)
{
    DisplayBrightness *brightness;
    Overlay52Child *child;

    if (self->child28 == 0) {
        brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
        if (DisplayBrightness_GetCurrent(brightness) == -16) {
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            child = (Overlay52Child *)Heap_Alloc(
                0x34, gOverlay52ChildAllocationTag, 4, &gHeapContext);
            if (child != 0)
                child = Overlay052Scene_Init(child, 1, 1);
            self->child28 = child;
            Overlay052Scene_SetMessageById(child, (u16)self->parameter24, 0);
            Sound_Play(gSoundContext, 0, 0x6f);
            brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1);
            DisplayBrightness_StartTransition(brightness, -16, 0, 4);
        }
    } else {
        if (Overlay052Scene_UpdateMessageMenu(self->child28) != 0) {
            if (self != 0)
                self->base.vtable->destroyAndFree(&self->base);
            return 1;
        }
        if (self->child28->state04 == 1)
            Overlay052Scene_BeginConfirmationFade(self->child28);
    }
    GamePhaseRuntime_UpdateActorPresentationState(gGamePhaseRuntime, 2);
    return 0;
}

/* Forward the runtime object's field at offset 0x24 and return zero. */
s32 GamePhaseRuntime_UpdateStateRenderHelpers(void)
{
    GamePhaseState_UpdateRenderHelpers((u8 *)gGamePhaseRuntime + 0x24);
    return 0;
}
