#ifndef TINGLE_GAME_PHASE_EFFECT_SCENE_H
#define TINGLE_GAME_PHASE_EFFECT_SCENE_H

#include "tingle/animation_resource.h"
#include "tingle/graphics_sprite_state.h"
#include "tingle/scene.h"

/* Short-lived sprite effect used by selected game-phase transition modes. */
typedef struct GamePhaseEffectScene {
    Scene base;
    AnimationResource *resources;
    GraphicsSpriteState *sprite;
    u32 callbackWord;
    s32 callbackThisAdjust;
    s32 timer;
} GamePhaseEffectScene;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseEffectScene *GamePhaseEffectScene_Init(GamePhaseEffectScene *self, s32 mode);
GamePhaseEffectScene *GamePhaseEffectScene_Destroy(GamePhaseEffectScene *self);
GamePhaseEffectScene *GamePhaseEffectScene_DestroyAndFree(GamePhaseEffectScene *self);
s32 GamePhaseEffectScene_Update(GamePhaseEffectScene *self);
s32 GamePhaseEffectScene_WaitForAnimation(GamePhaseEffectScene *self);
s32 GamePhaseEffectScene_RiseAfterAnimation(GamePhaseEffectScene *self);

#ifdef __cplusplus
}
#endif

#endif
