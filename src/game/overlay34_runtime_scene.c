#include "tingle/heap.h"
#include "tingle/debug_text_frame.h"
#include "tingle/game_phase_runtime.h"
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

typedef struct Overlay34ResultScene {
    Scene base;
    s32 result24;
} Overlay34ResultScene;

typedef char Overlay34ResultSceneSizeCheck[
    sizeof(Overlay34ResultScene) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020e5890;
extern SceneVTable data_020e58c4;
extern const char data_020e58f0[];
extern const char data_020e58f8[];
extern void *gSoundContext;
extern GamePhaseRuntime *gGamePhaseRuntime;
extern void *func_ov034_021fdae8(void *object);
extern void *func_ov034_021fdda4(void *object);
extern void func_ov034_021fde6c(void *object);
extern s32 func_ov034_021fdf6c(void *object);
extern s32 func_ov034_021fe6bc(void *object);
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

/* Destroy the overlay-34 runtime scene in caller-owned storage. The scene owns
 * child34 and its overlay slot; teardown also restores the modal sound
 * envelope. The returned pointer is the original, now-destroyed storage. */
Overlay34RuntimeScene *Overlay34RuntimeScene_Destroy(
    Overlay34RuntimeScene *self)
{
    self->base.vtable = &data_020e5890;
    if (self->child34 != 0) {
        func_ov034_021fdda4(self->child34);
        Heap_Free(self->child34);
    }
    OverlaySlot_UnloadOverlay(&self->overlay28);
    Sound_SetModalEnvelopeEnabled(gSoundContext, 0, 0, 20, 30);
    OverlaySlot_Destroy(&self->overlay28);
    Scene_Destroy(&self->base);
    return self;
}

/* Delete an owned overlay-34 runtime scene after canonical teardown. The
 * returned address is invalid and is preserved only for the retail ABI. */
Overlay34RuntimeScene *Overlay34RuntimeScene_Delete(
    Overlay34RuntimeScene *self)
{
    Overlay34RuntimeScene_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Initialize the short-lived result scene that transfers the overlay-34
 * selection back into phase 22. Caller storage is retained and result uses
 * the signed selection convention produced by overlay 34. */
Overlay34ResultScene *Overlay34ResultScene_Init(
    Overlay34ResultScene *self, s32 result)
{
    Scene_Init(&self->base);
    self->base.vtable = &data_020e58c4;
    self->result24 = result;
    return self;
}

/* Tick overlay 34 and render its child. A completed selection destroys this
 * scene, optionally creates the 0x28-byte result scene, and returns one;
 * otherwise it updates actor presentation mode 2 and returns zero. */
s32 Overlay34RuntimeScene_Update(Overlay34RuntimeScene *self)
{
    s32 result = -1;
    s32 complete;

    DebugText_BeginFrame();
    complete = func_ov034_021fdf6c(self->child34);
    if (complete != 0) {
        s32 selection = func_ov034_021fe6bc(self->child34);

        if (selection >= 0) {
            u8 *secondary = *(u8 **)((u8 *)gGamePhaseRuntime + 0x2ea8);
            if (secondary != 0) {
                result = **(s16 **)(secondary + 0x29c);
                if (selection == 0)
                    result = -result;
                GamePhaseRuntime_UpdateActorPresentationState(
                    gGamePhaseRuntime, 2);
                func_ov034_021fde6c(self->child34);
            }
        }
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        if (result != -1) {
            Overlay34ResultScene *next = Heap_Alloc(
                sizeof(*next), data_020e58f8, 4, &gHeapContext);
            if (next != 0)
                Overlay34ResultScene_Init(next, result);
        }
        return 1;
    }

    func_ov034_021fde6c(self->child34);
    GamePhaseRuntime_UpdateActorPresentationState(gGamePhaseRuntime, 2);
    return 0;
}

/* Forward Scene method 0x0C to the active game-phase runtime, then return the
 * fixed zero required by the overlay-34 scene vtable. */
s32 Overlay34RuntimeScene_ForwardMethod0C(Overlay34RuntimeScene *self)
{
    Scene *runtime;

    (void)self;
    runtime = (Scene *)gGamePhaseRuntime;
    runtime->vtable->method0C(runtime);
    return 0;
}
