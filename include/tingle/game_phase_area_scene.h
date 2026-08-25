#ifndef TINGLE_GAME_PHASE_AREA_SCENE_H
#define TINGLE_GAME_PHASE_AREA_SCENE_H

#include "tingle/actor_collection.h"
#include "tingle/game_phase_region_table.h"
#include "tingle/overlay_manager.h"
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

typedef struct GamePhaseAreaScene GamePhaseAreaScene;

typedef struct GamePhaseAreaSceneVTable {
    GamePhaseAreaScene *(*destroy)(GamePhaseAreaScene *self);
    GamePhaseAreaScene *(*destroyAndFree)(GamePhaseAreaScene *self);
} GamePhaseAreaSceneVTable;

struct GamePhaseAreaScene {
    const GamePhaseAreaSceneVTable *vtable;
    void *subRenderer;
    ActorCollection actorCollection;
    u32 stateFlags;
    GamePhaseAreaSceneConfig *config;
    OverlaySlot overlaySlot;
    ActorCollectionActor *secondaryActor;
    VecFx32Object position;
    void *overlayObject;
    void *regionEffectHandle;
};

typedef char GamePhaseAreaSceneConfigSizeCheck[
    sizeof(GamePhaseAreaSceneConfig) == 0x44 ? 1 : -1];
typedef char GamePhaseAreaSceneVTableSizeCheck[
    sizeof(GamePhaseAreaSceneVTable) == 0x8 ? 1 : -1];
typedef char GamePhaseAreaSceneSizeCheck[
    sizeof(GamePhaseAreaScene) == 0x2ed8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern const GamePhaseAreaSceneVTable gGamePhaseAreaSceneVTable;
GamePhaseAreaScene *GamePhaseAreaScene_Init(GamePhaseAreaScene *self,
                                            GamePhaseAreaSceneConfig *config,
                                            s32 createRenderer);
void GamePhaseAreaScene_Activate(GamePhaseAreaScene *self);
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
void GamePhaseAreaScene_ApplyRevealedRegions(
    GamePhaseAreaScene *self, GamePhaseRegionTable *regionTable);
s32 GamePhaseAreaScene_GetSubRendererLowCoordinate(GamePhaseAreaScene *self);
s32 GamePhaseAreaScene_GetSubRendererHighCoordinate(GamePhaseAreaScene *self);
void GamePhaseAreaScene_SetOverlayObject(GamePhaseAreaScene *self,
                                         void *overlayObject);
#ifdef __cplusplus
}
#endif

#endif
