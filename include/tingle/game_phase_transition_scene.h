#ifndef TINGLE_GAME_PHASE_TRANSITION_SCENE_H
#define TINGLE_GAME_PHASE_TRANSITION_SCENE_H

#include "tingle/scene.h"

typedef struct GamePhaseTransitionScene {
    Scene base;
} GamePhaseTransitionScene;

typedef char GamePhaseTransitionSceneSizeCheck[
    sizeof(GamePhaseTransitionScene) == 0x24 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseTransitionScene *GamePhaseTransitionScene_Init(GamePhaseTransitionScene *self);
GamePhaseTransitionScene *GamePhaseTransitionScene_Destroy(GamePhaseTransitionScene *self);
GamePhaseTransitionScene *GamePhaseTransitionScene_DestroyAndFree(GamePhaseTransitionScene *self);
s32 GamePhaseTransitionScene_Update(GamePhaseTransitionScene *self);

extern SceneVTable gGamePhaseTransitionSceneVTable;

#ifdef __cplusplus
}
#endif

#endif
