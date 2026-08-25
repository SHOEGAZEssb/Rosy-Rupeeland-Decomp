#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement actor-script opcodes for immediate position and motion parameters. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_AdjustPositionForTerrainHeight(void *actor);
extern void Actor_TranslateSecondaryBounds(void *actor, s32 xOffset, s32 yOffset);
extern void Actor_TranslateCollisionBounds(void *actor, s32 xOffset, s32 yOffset);
#ifdef __cplusplus
}
#endif

/*
 * Pop y then x integer coordinates, form an fx32 vector with z=0, copy it to
 * actor vector objects at offsets 0x28 and 0x18, invoke
 * Actor_AdjustPositionForTerrainHeight on the
 * actor, destroy the temporary vector, and return zero.
 */
s32 GamePhaseActorScriptVm_SetPositionFromCoordinates(GamePhaseActorScriptVm *self)
{
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    VecFx32Object position;
    VecFx32Object *assignedPosition;
    VecFx32Object_InitComponents(&position, x << 12, y << 12, 0);
    assignedPosition = VecFx32Object_Assign(
        (VecFx32Object *)(actor + 0x28), &position);
    VecFx32Object_Assign((VecFx32Object *)(actor + 0x18), assignedPosition);
    VecFx32Object_Destroy(&position);
    Actor_AdjustPositionForTerrainHeight(actor);
    return 0;
}

/* Translate the bound actor's secondary bounds by two popped values. */
s32 GamePhaseActorScriptVm_TranslateSecondaryBounds(GamePhaseActorScriptVm *self)
{
    s32 yOffset = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 xOffset = (s32)GamePhaseScriptVm_Pop(&self->base);
    Actor_TranslateSecondaryBounds(self->actor, xOffset, yOffset);
    return 0;
}

/* Translate the bound actor's collision bounds by two popped values. */
s32 GamePhaseActorScriptVm_TranslateCollisionBounds(GamePhaseActorScriptVm *self)
{
    s32 yOffset = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 xOffset = (s32)GamePhaseScriptVm_Pop(&self->base);
    Actor_TranslateCollisionBounds(self->actor, xOffset, yOffset);
    return 0;
}
