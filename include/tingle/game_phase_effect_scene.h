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

GamePhaseEffectScene *func_0200c9fc(GamePhaseEffectScene *self, s32 mode);
GamePhaseEffectScene *func_0200cc44(GamePhaseEffectScene *self);
GamePhaseEffectScene *func_0200cc8c(GamePhaseEffectScene *self);
s32 func_0200ccdc(GamePhaseEffectScene *self);
s32 func_0200cd58(GamePhaseEffectScene *self);
s32 func_0200cdf0(GamePhaseEffectScene *self);

#ifdef __cplusplus
}
#endif

#endif
