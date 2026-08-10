#ifndef TINGLE_GAME_PHASE_TRANSITION_SCENE_H
#define TINGLE_GAME_PHASE_TRANSITION_SCENE_H

#include "tingle/scene.h"

typedef struct GamePhaseTransitionScene {
    Scene base;
} GamePhaseTransitionScene;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseTransitionScene *GamePhaseTransitionScene_Init(GamePhaseTransitionScene *self);
GamePhaseTransitionScene *GamePhaseTransitionScene_Destroy(GamePhaseTransitionScene *self);
GamePhaseTransitionScene *GamePhaseTransitionScene_DestroyAndFree(GamePhaseTransitionScene *self);
s32 GamePhaseTransitionScene_Update(GamePhaseTransitionScene *self);

#ifdef __cplusplus
}
#endif

#endif
