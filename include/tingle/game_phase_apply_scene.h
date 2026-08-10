#ifndef TINGLE_GAME_PHASE_APPLY_SCENE_H
#define TINGLE_GAME_PHASE_APPLY_SCENE_H

#include "tingle/scene.h"

/* Scene used to apply a queued area/configuration pointer to the phase runtime. */
typedef struct GamePhaseApplyScene {
    Scene base;
    void *area;
    u32 field_28;
    u32 field_2c;
} GamePhaseApplyScene;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseApplyScene *GamePhaseApplyScene_Init(GamePhaseApplyScene *self, void *area,
                                   u32 field28, u32 field2c);
GamePhaseApplyScene *GamePhaseApplyScene_Destroy(GamePhaseApplyScene *self);
GamePhaseApplyScene *GamePhaseApplyScene_DestroyAndFree(GamePhaseApplyScene *self);
s32 GamePhaseApplyScene_Update(GamePhaseApplyScene *self);

#ifdef __cplusplus
}
#endif

#endif
