#include "tingle/game_phase_visual_effect.h"
#include "tingle/game_phase_runtime.h"

/* Track phase position and smoothly offset the BG1-backed visual effect. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 gActorInteractionSmoothedDisplacement[2];
extern void *gGamePhaseRuntime;
#ifdef __cplusplus
}
#endif

static s32 quantizeComponent(s32 value)
{
    s32 sign = value >> 31;
    return (s32)(((u32)(value * 0x4000 + sign) >> 14) |
                 ((u32)sign << 18)) - sign;
}

/*
 * When resources and flags bit 0 are active, maintain a smoothed offset in
 * vectors[2] using a 120-frame stepper toward an input-dependent target. The
 * target scale is 8 or 32 depending on the active actor's flag 0x10; runtime
 * flag 0x30cc bit 2 instead forces the smoothed vector to zero. Then derive
 * position - vectors[0], quantize x/y, store position in vectors[0], subtract
 * the smoothed offset, optionally halve all components for flags bit 2, and
 * accumulate the result into vectors[1].
 */
void GamePhaseVisualEffect_UpdatePosition(GamePhaseVisualEffect *self,
                   const VecFx32Object *position)
{
    VecFx32Object current;
    VecFx32Object temporary;
    GamePhaseRuntime *runtime = (GamePhaseRuntime *)gGamePhaseRuntime;

    if (!self->resources.resource0 || !(self->flags & 1))
        return;
    VecFx32Object_InitComponents(&current, 0, 0, 0);
    if (!(*((u8 *)runtime + 0x30cc) & 4)) {
        void *area;
        u8 *actor;
        VecFx32Object_Add(
            &self->vectors[GAME_PHASE_VISUAL_EFFECT_BACKGROUND_OFFSET],
            &self->vectors[GAME_PHASE_VISUAL_EFFECT_BASE_OFFSET]);
        area = GamePhaseRuntime_GetActorCollection(runtime, 1);
        actor = *(u8 **)((u8 *)area + 0x2e7c);
        if (!(*(u32 *)(actor + 0xd0) & 0x10))
            VecFx32Object_InitComponents(&temporary, gActorInteractionSmoothedDisplacement[0] * 8,
                          gActorInteractionSmoothedDisplacement[1] * -8, 0);
        else
            VecFx32Object_InitComponents(&temporary, gActorInteractionSmoothedDisplacement[0] * 32,
                          gActorInteractionSmoothedDisplacement[1] * -32, 0);
        VecFx32Object_Assign(&current, &temporary);
        VecFx32Object_Destroy(&temporary);
        if (current.value.x !=
                self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET].value.x ||
            current.value.y !=
                self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET].value.y ||
            current.value.z !=
                self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET].value.z) {
            VecFx32Stepper newStepper;
            VecFx32Stepper_InitTransition(
                &newStepper, &current,
                &self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET],
                0x78);
            VecFx32Stepper_Assign(&self->stepper, &newStepper);
            VecFx32Stepper_Destroy(&newStepper);
        }
        VecFx32Stepper_Update(&self->stepper);
        VecFx32Object_Assign(
            &self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET],
            VecFx32Stepper_GetCurrent(&self->stepper));
    } else {
        VecFx32Object_InitComponents(&temporary, 0, 0, 0);
        VecFx32Object_Assign(
            &self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET],
            &temporary);
        VecFx32Object_Destroy(&temporary);
    }

    VecFx32_Subtract(
        &temporary, position,
        &self->vectors[GAME_PHASE_VISUAL_EFFECT_PREVIOUS_POSITION]);
    VecFx32Object_Assign(&current, &temporary);
    VecFx32Object_Destroy(&temporary);
    current.value.x = quantizeComponent(current.value.x);
    current.value.y = quantizeComponent(current.value.y);
    VecFx32Object_Assign(
        &self->vectors[GAME_PHASE_VISUAL_EFFECT_PREVIOUS_POSITION], position);
    VecFx32_Subtract(
        &temporary, &current,
        &self->vectors[GAME_PHASE_VISUAL_EFFECT_SMOOTHED_INTERACTION_OFFSET]);
    VecFx32Object_Assign(&current, &temporary);
    VecFx32Object_Destroy(&temporary);
    if (self->flags & 4) {
        current.value.x /= 2;
        current.value.y /= 2;
        current.value.z /= 2;
    }
    VecFx32Object_Add(
        &self->vectors[GAME_PHASE_VISUAL_EFFECT_BACKGROUND_OFFSET], &current);
    VecFx32Object_Destroy(&current);
}
