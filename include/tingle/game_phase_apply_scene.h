#ifndef TINGLE_GAME_PHASE_APPLY_SCENE_H
#define TINGLE_GAME_PHASE_APPLY_SCENE_H

#include "tingle/scene.h"

/* Scene used to apply a queued area/configuration pointer to the phase runtime. */
typedef struct GamePhaseApplyScene {
    Scene base;
    void *pendingArea;
    u32 requestValue0;
    u32 requestValue1;
} GamePhaseApplyScene;

typedef char GamePhaseApplySceneSizeCheck[
    sizeof(GamePhaseApplyScene) == 0x30 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseApplyScene *GamePhaseApplyScene_Init(
    GamePhaseApplyScene *self, void *pendingArea, u32 requestValue0,
    u32 requestValue1, u32 unusedRequestValue3);
GamePhaseApplyScene *GamePhaseApplyScene_Destroy(GamePhaseApplyScene *self);
GamePhaseApplyScene *GamePhaseApplyScene_DestroyAndFree(GamePhaseApplyScene *self);
s32 GamePhaseApplyScene_Update(GamePhaseApplyScene *self);

extern SceneVTable gGamePhaseApplySceneVTable;

#ifdef __cplusplus
}
#endif

#endif
