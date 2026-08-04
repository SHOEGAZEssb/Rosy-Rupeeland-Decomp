#ifndef TINGLE_GAME_PHASE_VISUAL_EFFECT_H
#define TINGLE_GAME_PHASE_VISUAL_EFFECT_H

#include "tingle/graphics_resources.h"
#include "tingle/vec_fx32.h"
#include "tingle/vec_fx32_stepper.h"

/* Graphics/resource helper embedded in GamePhaseState at offset 0x2eb4. */
typedef struct GamePhaseVisualEffect {
    const void *vtable;
    GraphicsResourceSet resources;
    s32 field_10;
    s32 field_14;
    u32 field_18;
    u16 field_1c;
    u16 field_1e;
    VecFx32Object vectors[4];
    VecFx32Stepper stepper;
    u32 flags_94;
    u32 field_98;
    s16 field_9c;
    s16 field_9e;
    s16 field_a0;
    s16 field_a2;
} GamePhaseVisualEffect;

/* Four signed effect entries preceded by the update-enable word. */
typedef struct GamePhaseVisualEffectConfig {
    u32 enabled;
    s16 entries[4];
} GamePhaseVisualEffectConfig;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseVisualEffect *func_0200fa40(GamePhaseVisualEffect *self);
GamePhaseVisualEffect *func_0200fb34(GamePhaseVisualEffect *self);
GamePhaseVisualEffect *func_0200fbc8(GamePhaseVisualEffect *self);
void func_0200fc64(GamePhaseVisualEffect *self);
void func_0200fe0c(GamePhaseVisualEffect *self,
                   const VecFx32Object *position);
void func_02010094(GamePhaseVisualEffect *self, s32 enabled);
void func_020100ac(GamePhaseVisualEffect *self);
void func_02010104(GamePhaseVisualEffect *self, u16 first, u16 second);
void func_02010110(GamePhaseVisualEffect *self);
void func_02010154(GamePhaseVisualEffect *self, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id);
void func_020101a4(GamePhaseVisualEffect *self, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id, u16 firstBlend,
                   u16 secondBlend, u32 bgPriority,
                   const GamePhaseVisualEffectConfig *config);
void func_0201021c(GamePhaseVisualEffect *self,
                   const VecFx32Object *offset);
#ifdef __cplusplus
}
#endif

#endif
