#ifndef TINGLE_GAME_PHASE_LOAD_SCENE_H
#define TINGLE_GAME_PHASE_LOAD_SCENE_H

#include "tingle/scene.h"

/* Scene that tears down and rebuilds the runtime for a requested game phase. */
typedef struct GamePhaseLoadScene {
    Scene base;
    void *ownedObject;
    s32 loadState;
    s32 phase;
    s32 phaseArgument;
    s32 field_34;
    s32 ownedObjectCallbacksEnabled;
    s32 runtimeCallbacksEnabled;
    u8 field_40[0x34];
    u8 field_74[0x0c];
    u8 field_80[0x0c];
    u8 field_8c[0x0c];
    s32 savedPowerControlBit15;
} GamePhaseLoadScene;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseLoadScene *GamePhaseLoadScene_Init(GamePhaseLoadScene *self, s32 phase,
                                            s32 phaseArgument);
GamePhaseLoadScene *GamePhaseLoadScene_Destroy(GamePhaseLoadScene *self);
GamePhaseLoadScene *func_0200d014(GamePhaseLoadScene *self);
GamePhaseLoadScene *GamePhaseLoadScene_DestroyAndFree(GamePhaseLoadScene *self);
s32 GamePhaseLoadScene_Update(GamePhaseLoadScene *self);
s32 GamePhaseLoadScene_UpdateRenderHelpers(GamePhaseLoadScene *self);
s32 GamePhaseLoadScene_ForwardCurrentVCount(GamePhaseLoadScene *self);
void GamePhase_ResetTransientState(void);

#ifdef __cplusplus
}
#endif

#endif
