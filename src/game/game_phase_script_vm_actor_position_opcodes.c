#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement actor-script opcodes for immediate position and motion parameters. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_AdjustPositionForTerrainHeight(void *actor);
extern void Actor_TranslateSecondaryBounds(void *actor, u32 first, u32 second);
extern void Actor_TranslateCollisionBounds(void *actor, u32 first, u32 second);
#ifdef __cplusplus
}
#endif

/*
 * Pop y then x integer coordinates, form an fx32 vector with z=0, copy it to
 * actor vector objects at offsets 0x28 and 0x18, invoke
 * Actor_AdjustPositionForTerrainHeight on the
 * actor, destroy the temporary vector, and return zero.
 */
s32 func_0201409c(GamePhaseActorScriptVm *self)
{
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor_84;
    VecFx32Object value;
    VecFx32Object *copy;
    func_0200500c(&value, x << 12, y << 12, 0);
    copy = func_020050a4((VecFx32Object *)(actor + 0x28), &value);
    func_020050a4((VecFx32Object *)(actor + 0x18), copy);
    func_02005058(&value);
    Actor_AdjustPositionForTerrainHeight(actor);
    return 0;
}

/* Translate the bound actor's secondary bounds by two popped values. */
s32 func_0201410c(GamePhaseActorScriptVm *self)
{
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    Actor_TranslateSecondaryBounds(self->actor_84, first, second);
    return 0;
}

/* Translate the bound actor's collision bounds by two popped values. */
s32 func_0201413c(GamePhaseActorScriptVm *self)
{
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    Actor_TranslateCollisionBounds(self->actor_84, first, second);
    return 0;
}
