#ifndef TINGLE_GAME_PHASE_RESUME_SCENE_H
#define TINGLE_GAME_PHASE_RESUME_SCENE_H

#include "tingle/scene.h"

typedef struct GamePhaseResumeScene {
    Scene base;
    s32 skipFade;
} GamePhaseResumeScene;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseResumeScene *func_0200f878(GamePhaseResumeScene *self, s32 skipFade);
GamePhaseResumeScene *func_0200f8b8(GamePhaseResumeScene *self);
GamePhaseResumeScene *func_0200f8f4(GamePhaseResumeScene *self);
s32 func_0200f938(GamePhaseResumeScene *self);
#ifdef __cplusplus
}
#endif

#endif
