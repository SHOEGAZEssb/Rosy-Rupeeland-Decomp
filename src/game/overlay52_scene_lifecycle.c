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
extern SceneVTable data_020d5d24;
extern char data_020d5d84[];
extern DisplayBrightnessPair data_020f4dc8;
extern void *gDebugFont;
extern void *gSoundContext;
extern HeapContext gHeapContext;
extern void *data_021052fc;
extern void func_020755bc(void *renderer);
extern Overlay52Child *func_ov052_0220d618(Overlay52Child *self, s32 first,
                                           s32 second);
extern void func_ov052_0220e14c(Overlay52Child *self, u16 parameter,
                                s32 value);
extern s32 func_ov052_0220da54(Overlay52Child *self);
extern void func_ov052_0220e178(Overlay52Child *self);
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
Overlay52Scene *func_0201cfd0(Overlay52Scene *self, u32 parameter)
{
    DisplayBrightness *brightness;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d5d24;
    self->parameter24 = parameter;
    self->child28 = 0;
    brightness = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
    DisplayBrightness_StartTransition(brightness, 0, -16, 8);
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 0, 0x34);
    Scene_SetFlags03(&self->base);
    return self;
}

/*
 * Clear scene flags, destroy an optional child through its deleting virtual,
 * unload overlay slots 0 and 2, destroy the base Scene, and return self.
 */
Overlay52Scene *func_0201d03c(Overlay52Scene *self)
{
    self->base.vtable = &data_020d5d24;
    Scene_ClearFlags03(&self->base);
    if (self->child28 != 0)
        self->child28->vtable->destroyAndFree((Scene *)self->child28);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 0);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform func_0201d03c's teardown, free the scene, and return its old address. */
Overlay52Scene *func_0201d094(Overlay52Scene *self)
{
    self->base.vtable = &data_020d5d24;
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
s32 func_0201d0f4(Overlay52Scene *self)
{
    DisplayBrightness *brightness;
    Overlay52Child *child;

    if (self->child28 == 0) {
        brightness = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
        if (DisplayBrightness_GetCurrent(brightness) == -16) {
            func_020755bc(gDebugFont);
            child = (Overlay52Child *)Heap_Alloc(
                0x34, data_020d5d84, 4, &gHeapContext);
            if (child != 0)
                child = func_ov052_0220d618(child, 1, 1);
            self->child28 = child;
            func_ov052_0220e14c(child, (u16)self->parameter24, 0);
            Sound_Play(gSoundContext, 0, 0x6f);
            brightness = DisplayBrightnessPair_GetScreen(&data_020f4dc8, 1);
            DisplayBrightness_StartTransition(brightness, -16, 0, 4);
        }
    } else {
        if (func_ov052_0220da54(self->child28) != 0) {
            if (self != 0)
                self->base.vtable->destroyAndFree(&self->base);
            return 1;
        }
        if (self->child28->state04 == 1)
            func_ov052_0220e178(self->child28);
    }
    GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 2);
    return 0;
}

/* Forward the runtime object's field at offset 0x24 and return zero. */
s32 func_0201d220(void)
{
    GamePhaseState_UpdateRenderHelpers((u8 *)data_021052fc + 0x24);
    return 0;
}
