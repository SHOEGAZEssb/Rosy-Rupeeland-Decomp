#ifndef TINGLE_GAME_PHASE_LOAD_SCENE_H
#define TINGLE_GAME_PHASE_LOAD_SCENE_H

#include "tingle/scene.h"

/* Scene that tears down and rebuilds the runtime for a requested game phase. */
typedef struct GamePhaseLoadScene {
    Scene base;
    void *ownedObject;
    s32 state;
    s32 phase;
    s32 field_30;
    s32 field_34;
    s32 field_38;
    s32 field_3c;
    u8 field_40[0x34];
    u8 field_74[0x0c];
    u8 field_80[0x0c];
    u8 field_8c[0x0c];
    s32 powerControlBit;
} GamePhaseLoadScene;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseLoadScene *func_0200cf00(GamePhaseLoadScene *self, s32 phase,
                                  s32 field30);
GamePhaseLoadScene *func_0200cfb0(GamePhaseLoadScene *self);
GamePhaseLoadScene *func_0200d014(GamePhaseLoadScene *self);
GamePhaseLoadScene *func_0200d028(GamePhaseLoadScene *self);
s32 func_0200d094(GamePhaseLoadScene *self);
s32 func_0200e3d4(GamePhaseLoadScene *self);
s32 func_0200e424(GamePhaseLoadScene *self);
void func_0200e480(void);

#ifdef __cplusplus
}
#endif

#endif
