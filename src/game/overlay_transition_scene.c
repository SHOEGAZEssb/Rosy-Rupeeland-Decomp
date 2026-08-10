#include "tingle/display_controller.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/* Drive a fade-mediated transition into an object supplied by overlay 31 or 46. */

typedef struct OverlayTransitionObject {
    void **vtable;
} OverlayTransitionObject;

typedef struct OverlayTransitionScene {
    Scene base;
    OverlayTransitionObject *object24;
    s32 restoreLupy28;
    OverlaySlot overlay2c;
    s32 kind38;
    u32 parameter3c;
    s32 state40;
} OverlayTransitionScene;

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d5d58;
extern char data_020d5d8c[];
extern char data_020d5d94[];
extern void *data_021052fc;
extern void *gLupyContext;
extern void *gDebugFont;
extern void func_02092c8c(s32 screen, s32 brightness);
extern s32 func_02091fb0(void *object, s32 mode);
extern void func_020122a0(void *object, s32 value);
extern void GamePhaseCurrencyHud_SetVisible(void *context, s32 enabled);
extern void GamePhaseRuntime_SetPlacementMode(void *runtime, s32 first, s32 second);
extern void func_02008570(void *runtime, s32 first, s32 second);
extern void func_020755bc(void *renderer);
extern void GamePhaseRuntime_UpdateActorPresentationState(void *runtime, s32 mode);
extern OverlayTransitionObject *func_ov029_021fd95c(
    OverlayTransitionObject *self, u32 parameter);
extern OverlayTransitionObject *func_ov046_0220c7d8(
    OverlayTransitionObject *self, u16 parameter);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the Scene and embedded overlay slot, remember kind and parameter,
 * clear child/state, snapshot whether Lupy flag b0 bit zero was clear, set scene
 * flags 0/1, and return self.
 */
OverlayTransitionScene *func_0201d240(OverlayTransitionScene *self, s32 kind,
                                      u32 parameter)
{
    s32 restore = 0;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d5d58;
    OverlaySlot_Init(&self->overlay2c);
    self->kind38 = kind;
    self->parameter3c = parameter;
    self->state40 = 0;
    self->object24 = 0;
    if ((*(u16 *)((u8 *)gLupyContext + 0xb0) & 1) == 0)
        restore = 1;
    self->restoreLupy28 = (s16)restore;
    Scene_SetFlags03(&self->base);
    return self;
}

/* Destroy an optional child, unload/destroy the embedded slot and Scene, and return self. */
OverlayTransitionScene *func_0201d2b0(OverlayTransitionScene *self)
{
    self->base.vtable = &data_020d5d58;
    if (self->object24 != 0) {
        ((void (*)(void *))self->object24->vtable[2])(self->object24);
        OverlaySlot_UnloadOverlay(&self->overlay2c);
    }
    OverlaySlot_Destroy(&self->overlay2c);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform func_0201d2b0's teardown, free the scene, and return its old address. */
OverlayTransitionScene *func_0201d300(OverlayTransitionScene *self)
{
    self->base.vtable = &data_020d5d58;
    if (self->object24 != 0) {
        ((void (*)(void *))self->object24->vtable[2])(self->object24);
        OverlaySlot_UnloadOverlay(&self->overlay2c);
    }
    OverlaySlot_Destroy(&self->overlay2c);
    Scene_Destroy(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Advance the six-state transition.  It fades out, suppresses the current
 * runtime/Lupy presentation, loads overlay 31 (kind 0) or 46 (kind 1), polls
 * that overlay object through two phases, destroys it, restores presentation,
 * fades in, and finally destroys this scene.  Other kind values intentionally
 * skip allocation as recovered.  Returns one only on final destruction.
 */
s32 func_0201d358(OverlayTransitionScene *self)
{
    void *runtime = data_021052fc;
    void *runtimeObject;
    OverlayTransitionObject *object;

    switch (self->state40) {
    case 0:
        func_02092c8c(1, -8);
        func_02092c8c(2, -16);
        self->state40++;
        /* fall through */
    case 1:
        if (DisplayBrightness_IsSubTransitionComplete() == 0)
            break;
        runtimeObject = *(void **)((u8 *)runtime + 0x2fb8);
        if (runtimeObject != 0)
            func_020122a0(runtimeObject, 0);
        if (self->restoreLupy28 != 0)
            GamePhaseCurrencyHud_SetVisible(gLupyContext, 0);
        GamePhaseRuntime_SetPlacementMode(runtime, 0, 1);
        if (self->kind38 == 0) {
            OverlaySlot_LoadOverlay(&self->overlay2c, 0x1f);
            object = (OverlayTransitionObject *)Heap_Alloc(
                0x550, data_020d5d8c, 4, &gHeapContext);
            if (object != 0)
                object = func_ov029_021fd95c(object, self->parameter3c);
            self->object24 = object;
        } else if (self->kind38 == 1) {
            OverlaySlot_LoadOverlay(&self->overlay2c, 0x2e);
            object = (OverlayTransitionObject *)Heap_Alloc(
                0x7c, data_020d5d94, 4, &gHeapContext);
            if (object != 0)
                object = func_ov046_0220c7d8(object, (u16)self->parameter3c);
            self->object24 = object;
        }
        func_02092c8c(2, 0);
        self->state40++;
        break;
    case 2:
        func_02091fb0(self->object24, 0);
        if (DisplayBrightness_IsSubTransitionComplete() != 0)
            self->state40++;
        break;
    case 3:
        if (func_02091fb0(self->object24, 1) != 0) {
            func_02092c8c(2, -16);
            self->state40++;
        }
        break;
    case 4:
        func_02091fb0(self->object24, 0);
        if (DisplayBrightness_IsSubTransitionComplete() == 0)
            break;
        if (self->object24 != 0)
            ((void (*)(void *))self->object24->vtable[2])(self->object24);
        self->object24 = 0;
        OverlaySlot_UnloadOverlay(&self->overlay2c);
        func_020755bc(gDebugFont);
        runtimeObject = *(void **)((u8 *)runtime + 0x2fb8);
        if (runtimeObject != 0) {
            func_02008570(runtime, 1, 1);
            GamePhaseRuntime_SetPlacementMode(runtime, 1, 1);
        }
        if (self->restoreLupy28 != 0)
            GamePhaseCurrencyHud_SetVisible(gLupyContext, 1);
        func_02092c8c(3, 0);
        self->state40++;
        break;
    case 5:
        if (DisplayBrightness_IsSubTransitionComplete() != 0) {
            if (self != 0)
                self->base.vtable->destroyAndFree(&self->base);
            return 1;
        }
        break;
    }
    GamePhaseRuntime_UpdateActorPresentationState(runtime, 0);
    return 0;
}

/* Invoke method 0x0c on the runtime root and optional overlay object; return zero. */
s32 func_0201d624(OverlayTransitionScene *self)
{
    Scene *runtime = (Scene *)data_021052fc;
    runtime->vtable->method0C(runtime);
    if (self->object24 != 0)
        ((void (*)(void *))self->object24->vtable[3])(self->object24);
    return 0;
}

/* Invoke method 0x10 on the optional overlay object and return zero. */
s32 func_0201d664(OverlayTransitionScene *self)
{
    if (self->object24 != 0)
        ((void (*)(void *))self->object24->vtable[4])(self->object24);
    return 0;
}
