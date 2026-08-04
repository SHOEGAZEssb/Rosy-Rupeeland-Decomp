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

GamePhaseApplyScene *func_0200c8bc(GamePhaseApplyScene *self, void *area,
                                   u32 field28, u32 field2c);
GamePhaseApplyScene *func_0200c8f4(GamePhaseApplyScene *self);
GamePhaseApplyScene *func_0200c908(GamePhaseApplyScene *self);
s32 func_0200c924(GamePhaseApplyScene *self);

#ifdef __cplusplus
}
#endif

#endif
