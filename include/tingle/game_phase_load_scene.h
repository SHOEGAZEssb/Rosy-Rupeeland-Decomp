#ifndef TINGLE_GAME_PHASE_LOAD_SCENE_H
#define TINGLE_GAME_PHASE_LOAD_SCENE_H

#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

typedef struct GraphicsBankStateSnapshot {
    u32 banks[13];
} GraphicsBankStateSnapshot;

typedef char GraphicsBankStateSnapshotSizeCheck[
    sizeof(GraphicsBankStateSnapshot) == 0x34 ? 1 : -1];

/* Scene that tears down and rebuilds the runtime for a requested scene kind. */
typedef struct GamePhaseLoadScene {
    Scene base;
    void *loadedScene;
    s32 state;
    s32 sceneKind;
    s32 sceneArgument;
    s32 restoreCurrencyHudVisibility;
    s32 loadedSceneCallbacksEnabled;
    s32 runtimeCallbacksEnabled;
    GraphicsBankStateSnapshot graphicsBankStateSnapshot;
    OverlaySlot overlaySlot0;
    OverlaySlot overlaySlot1;
    OverlaySlot overlaySlot2;
    s32 savedScreenSwap;
} GamePhaseLoadScene;

typedef char GamePhaseLoadSceneSizeCheck[
    sizeof(GamePhaseLoadScene) == 0x9c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseLoadScene *GamePhaseLoadScene_Init(GamePhaseLoadScene *self, s32 sceneKind,
                                            s32 sceneArgument);
GamePhaseLoadScene *GamePhaseLoadScene_Destroy(GamePhaseLoadScene *self);
GamePhaseLoadScene *GamePhaseLoadScene_FreeStorage(GamePhaseLoadScene *self);
GamePhaseLoadScene *GamePhaseLoadScene_DestroyAndFree(GamePhaseLoadScene *self);
s32 GamePhaseLoadScene_Update(GamePhaseLoadScene *self);
s32 GamePhaseLoadScene_UpdateRenderHelpers(GamePhaseLoadScene *self);
s32 GamePhaseLoadScene_ForwardCurrentVCount(GamePhaseLoadScene *self);
void GamePhase_ResetTransientState(void);
extern SceneVTable gGamePhaseLoadSceneVTable;

#ifdef __cplusplus
}
#endif

#endif
