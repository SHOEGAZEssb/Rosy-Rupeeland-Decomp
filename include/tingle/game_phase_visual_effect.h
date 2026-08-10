#ifndef TINGLE_GAME_PHASE_VISUAL_EFFECT_H
#define TINGLE_GAME_PHASE_VISUAL_EFFECT_H

#include "tingle/graphics_resources.h"
#include "tingle/vec_fx32.h"
#include "tingle/vec_fx32_stepper.h"

/* Graphics/resource helper embedded in GamePhaseState at offset 0x2eb4. */
typedef struct GamePhaseVisualEffect {
    const void *vtable;
    GraphicsResourceSet resources;
    s32 effectEntryIndex;
    s32 effectTimer;
    u32 randomToken;
    u16 firstBlend;
    u16 secondBlend;
    VecFx32Object vectors[4];
    VecFx32Stepper stepper;
    u32 flags;
    u32 sequenceEnabled;
    s16 effectEntries[4];
} GamePhaseVisualEffect;

/* Four signed effect entries preceded by the update-enable word. */
typedef struct GamePhaseVisualEffectConfig {
    u32 enabled;
    s16 entries[4];
} GamePhaseVisualEffectConfig;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseVisualEffect *GamePhaseVisualEffect_Init(GamePhaseVisualEffect *self);
GamePhaseVisualEffect *GamePhaseVisualEffect_Destroy(GamePhaseVisualEffect *self);
GamePhaseVisualEffect *GamePhaseVisualEffect_DestroyAndFree(
    GamePhaseVisualEffect *self);
void GamePhaseVisualEffect_Update(GamePhaseVisualEffect *self);
void GamePhaseVisualEffect_UpdatePosition(GamePhaseVisualEffect *self,
                                          const VecFx32Object *position);
void GamePhaseVisualEffect_SetEnabled(GamePhaseVisualEffect *self, s32 enabled);
void GamePhaseVisualEffect_PrepareBackground(GamePhaseVisualEffect *self);
void GamePhaseVisualEffect_SetBlendCoefficients(GamePhaseVisualEffect *self,
                                                u16 first, u16 second);
void GamePhaseVisualEffect_ApplyBlend(GamePhaseVisualEffect *self);
void GamePhaseVisualEffect_LoadResources(GamePhaseVisualEffect *self,
                                         u32 resource0Id, u32 resource1Id,
                                         u32 resource2Id);
void GamePhaseVisualEffect_Configure(
    GamePhaseVisualEffect *self, u32 resource0Id, u32 resource1Id,
    u32 resource2Id, u16 firstBlend, u16 secondBlend, u32 bgPriority,
    const GamePhaseVisualEffectConfig *config);
void GamePhaseVisualEffect_SetBaseOffset(GamePhaseVisualEffect *self,
                                         const VecFx32Object *offset);
#ifdef __cplusplus
}
#endif

#endif
