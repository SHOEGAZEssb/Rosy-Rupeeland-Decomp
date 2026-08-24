#ifndef TINGLE_GAME_PHASE_EFFECT_SCENE_H
#define TINGLE_GAME_PHASE_EFFECT_SCENE_H

#include "tingle/animation_resource.h"
#include "tingle/graphics_sprite_state.h"
#include "tingle/scene.h"

/* Short-lived sprite effect used by selected game-phase transition modes. */
typedef struct GamePhaseEffectUpdateMethod {
    u32 functionOrVtableOffset;
    s32 thisAdjustment;
} GamePhaseEffectUpdateMethod;

typedef struct GamePhaseEffectScene {
    Scene base;
    AnimationResource *animationResource;
    GraphicsSpriteState *sprite;
    GamePhaseEffectUpdateMethod updateMethod;
    s32 riseFrameCounter;
} GamePhaseEffectScene;

typedef char GamePhaseEffectUpdateMethodSizeCheck[
    sizeof(GamePhaseEffectUpdateMethod) == 8 ? 1 : -1];
typedef char GamePhaseEffectSceneSizeCheck[
    sizeof(GamePhaseEffectScene) == 0x38 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseEffectScene *GamePhaseEffectScene_Init(GamePhaseEffectScene *self, s32 mode);
GamePhaseEffectScene *GamePhaseEffectScene_Destroy(GamePhaseEffectScene *self);
GamePhaseEffectScene *GamePhaseEffectScene_DestroyAndFree(GamePhaseEffectScene *self);
s32 GamePhaseEffectScene_Update(GamePhaseEffectScene *self);
s32 GamePhaseEffectScene_WaitForAnimation(GamePhaseEffectScene *self);
s32 GamePhaseEffectScene_RiseAfterAnimation(GamePhaseEffectScene *self);

extern SceneVTable gGamePhaseEffectSceneVTable;
extern const GamePhaseEffectUpdateMethod gGamePhaseEffectUpdateMethods[];

#ifdef __cplusplus
}
#endif

#endif
