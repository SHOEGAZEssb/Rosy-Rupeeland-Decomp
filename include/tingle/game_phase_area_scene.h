#ifndef TINGLE_GAME_PHASE_AREA_SCENE_H
#define TINGLE_GAME_PHASE_AREA_SCENE_H

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Recovered fields consumed while selecting an area's sub-screen renderer. */
typedef struct GamePhaseAreaSceneConfig {
    u32 areaId_00;
    void *resource04;
    void *resource08;
    u8 unknown0c[0x14];
    u32 field20;
    u32 field24;
    void (*callback28)(s32 value);
    u8 unknown2c[8];
    u8 field34[0x0c];
    u32 flags40;
} GamePhaseAreaSceneConfig;

typedef struct GamePhaseAreaScene {
    const void *vtable;
    void *subRenderer_04;
    u8 renderer_08[0x2ea0];
    u32 rendererFlags_2ea8;
    GamePhaseAreaSceneConfig *config_2eac;
    u8 state_2eb0[0x0c];
    void *field_2ebc;
    VecFx32Object position_2ec0;
    u32 field_2ed0;
    u32 field_2ed4;
} GamePhaseAreaScene;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseAreaScene *func_02011a5c(GamePhaseAreaScene *self,
                                  GamePhaseAreaSceneConfig *config,
                                  s32 createRenderer);
void func_02011ebc(GamePhaseAreaScene *self);
GamePhaseAreaScene *func_02011f24(GamePhaseAreaScene *self);
GamePhaseAreaScene *func_02011f98(GamePhaseAreaScene *self);
s32 func_02012014(GamePhaseAreaScene *self, void *regionTable,
                   s32 worldX, s32 worldY);
void func_02012150(GamePhaseAreaScene *self, s32 value);
void func_0201218c(GamePhaseAreaScene *self);
void func_020121f8(GamePhaseAreaScene *self);
void func_020122a0(GamePhaseAreaScene *self, s32 enabled);
GamePhaseAreaSceneConfig *func_02012438(GamePhaseAreaScene *self);
void func_02012444(GamePhaseAreaScene *self, void *regionTable);
s32 func_020124f0(GamePhaseAreaScene *self);
s32 func_0201250c(GamePhaseAreaScene *self);
void func_02012528(GamePhaseAreaScene *self, void *overlayObject);
#ifdef __cplusplus
}
#endif

#endif
