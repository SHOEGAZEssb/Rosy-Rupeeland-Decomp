#ifndef TINGLE_GAME_PHASE_AREA_SCENE_H
#define TINGLE_GAME_PHASE_AREA_SCENE_H

#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Recovered fields consumed while selecting an area's sub-screen renderer. */
typedef struct GamePhaseAreaSceneConfig {
    u32 areaId;
    void *resource04;
    void *resource08;
    u8 unknown0c[0x14];
    u32 overlayId;
    u32 field24;
    void (*loadCallback)(s32 value);
    u8 unknown2c[8];
    u8 subRendererConfig[0x0c];
    u32 flags;
} GamePhaseAreaSceneConfig;

typedef struct GamePhaseAreaScene {
    const void *vtable;
    void *subRenderer;
    u8 actorCollectionStorage[0x2ea0];
    u32 stateFlags;
    GamePhaseAreaSceneConfig *config;
    u8 overlaySlotStorage[0x0c];
    void *secondaryActor;
    VecFx32Object position;
    void *overlayObject;
    void *regionEffectHandle;
} GamePhaseAreaScene;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseAreaScene *GamePhaseAreaScene_Init(GamePhaseAreaScene *self,
                                            GamePhaseAreaSceneConfig *config,
                                            s32 createRenderer);
void GamePhaseAreaScene_Start(GamePhaseAreaScene *self);
GamePhaseAreaScene *GamePhaseAreaScene_Destroy(GamePhaseAreaScene *self);
GamePhaseAreaScene *GamePhaseAreaScene_DestroyAndFree(GamePhaseAreaScene *self);
s32 GamePhaseAreaScene_UpdateRegionAtPosition(
    GamePhaseAreaScene *self, GamePhaseRegionTable *regionTable,
    s32 worldX, s32 worldY);
void GamePhaseAreaScene_ApplyPlacementState(GamePhaseAreaScene *self,
                                            const void *state);
void GamePhaseAreaScene_Update(GamePhaseAreaScene *self);
void GamePhaseAreaScene_RestoreSubDisplay(GamePhaseAreaScene *self);
void GamePhaseAreaScene_SetEnabled(GamePhaseAreaScene *self, s32 enabled);
GamePhaseAreaSceneConfig *GamePhaseAreaScene_GetConfig(GamePhaseAreaScene *self);
void GamePhaseAreaScene_RegisterEnabledRegions(
    GamePhaseAreaScene *self, GamePhaseRegionTable *regionTable);
s32 GamePhaseAreaScene_GetSubRendererLowCoordinate(GamePhaseAreaScene *self);
s32 GamePhaseAreaScene_GetSubRendererHighCoordinate(GamePhaseAreaScene *self);
void GamePhaseAreaScene_SetOverlayObject(GamePhaseAreaScene *self,
                                         void *overlayObject);
#ifdef __cplusplus
}
#endif

#endif
