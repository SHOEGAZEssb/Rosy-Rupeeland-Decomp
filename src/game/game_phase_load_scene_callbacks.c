#include "tingle/game_phase_load_scene.h"
#include "tingle/game_work.h"

/* Forward load-scene frame hooks and reset transient phase/debug state. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u16 data_020c3600[12];
extern void *gGamePhaseRuntime;
extern void *data_020f4e14;
extern void *gDebugFont;
extern void GamePhaseState_UpdateRenderHelpers(void *runtimeObject);
extern void GamePhaseState_ForwardVCount(void *runtimeObject, u16 vcount);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *object);
#ifdef __cplusplus
}
#endif

typedef struct LoadPhaseObjectVTable {
    void *method00;
    void *method04;
    void *method08;
    void (*method0c)(void *self);
    void (*method10)(void *self);
} LoadPhaseObjectVTable;

typedef struct LoadPhaseObject {
    LoadPhaseObjectVTable *vtable;
} LoadPhaseObject;

/*
 * During the load scene's method-0x0c hook, update runtime offset 0x24 when
 * runtimeCallbacksEnabled is set and forward method 0x0c to the loaded scene
 * when its callbacks are enabled. This hook always returns zero.
 */
s32 GamePhaseLoadScene_UpdateRenderHelpers(GamePhaseLoadScene *self)
{
    if (self->runtimeCallbacksEnabled)
        GamePhaseState_UpdateRenderHelpers((u8 *)gGamePhaseRuntime + 0x24);
    if (self->loadedSceneCallbacksEnabled && self->loadedScene)
        ((LoadPhaseObject *)self->loadedScene)->vtable->method0c(
            self->loadedScene);
    return 0;
}

/*
 * During method 0x10, pass the current VCOUNT to runtime offset 0x24 when its
 * callbacks are enabled and forward method 0x10 to the loaded scene
 * when enabled. Returns zero.
 */
s32 GamePhaseLoadScene_ForwardCurrentVCount(GamePhaseLoadScene *self)
{
    if (self->runtimeCallbacksEnabled)
        GamePhaseState_ForwardVCount((u8 *)gGamePhaseRuntime + 0x24,
                      *(volatile u16 *)0x04000006);
    if (self->loadedSceneCallbacksEnabled && self->loadedScene)
        ((LoadPhaseObject *)self->loadedScene)->vtable->method10(
            self->loadedScene);
    return 0;
}

/*
 * Clear the twelve transient GameWork flags listed at data_020c3600, then
 * reset the two shared debug/text render objects. No value is returned.
 */
void GamePhase_ResetTransientState(void)
{
    u32 i;
    for (i = 0; i < 12; i++)
        GameWork_ClearFlag(gGameWork, data_020c3600[i]);
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
}
