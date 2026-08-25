#ifndef TINGLE_GAME_PHASE_RESUME_SCENE_H
#define TINGLE_GAME_PHASE_RESUME_SCENE_H

#include "tingle/scene.h"

typedef struct GamePhaseResumeScene {
    Scene base;
    s32 skipFade;
} GamePhaseResumeScene;

typedef char GamePhaseResumeSceneSizeCheck[
    sizeof(GamePhaseResumeScene) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseResumeScene *GamePhaseResumeScene_Init(GamePhaseResumeScene *self, s32 skipFade);
GamePhaseResumeScene *GamePhaseResumeScene_Destroy(GamePhaseResumeScene *self);
GamePhaseResumeScene *GamePhaseResumeScene_DestroyAndFree(GamePhaseResumeScene *self);
s32 GamePhaseResumeScene_Update(GamePhaseResumeScene *self);
extern SceneVTable gGamePhaseResumeSceneVTable;
#ifdef __cplusplus
}
#endif

#endif
