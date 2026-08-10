#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement actor-script opcodes for movement cancellation and target facing. */

#ifdef __cplusplus
extern "C" {
#endif
extern u32 *ActorRuntimeTriple_Assign(void *object, u32 first, u32 second, u32 third);
extern void ActorDerivedType1_ResetSpecialModeFlags(void *actor);
extern void Actor_SetVelocity(void *actor, const VecFx32Object *value);
extern void VecFx32Stepper_Reset(void *movement);
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void Actor_UpdateAttachmentDirectionFromVector(void *actor, fx32 x, fx32 y);
#ifdef __cplusplus
}
#endif

/*
 * Cancel bound-actor movement by zeroing four-word blocks at 0x38/0x88/0x98,
 * applying type-1 cleanup through ActorDerivedType1_ResetSpecialModeFlags, sending a zero vector through
 * Actor_SetVelocity, clearing actor flag 0x40, and destroying/resetting the
 * movement object at 0x198. Returns zero.
 */
s32 GamePhaseActorScriptVm_CancelMovement(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    VecFx32Object zero;
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
    if (actor[0x4d] == 1)
        ActorDerivedType1_ResetSpecialModeFlags(actor);
    func_0200500c(&zero, 0, 0, 0);
    Actor_SetVelocity(actor, &zero);
    func_02005058(&zero);
    *(u32 *)(actor + 0x10) &= ~0x40u;
    VecFx32Stepper_Reset(actor + 0x198);
    return 0;
}

/*
 * Pop an actor index, resolve it from the bound actor's collection, turn the
 * bound actor toward the target's horizontal displacement, push byte 0x38 of
 * actor->0x54 when present (otherwise zero), and return zero.
 */
s32 GamePhaseActorScriptVm_FaceIndexedActorAndGetAttachmentByte38(GamePhaseActorScriptVm *self)
{
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    u8 *target = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(actor), index);
    fx32 dx = *(fx32 *)(target + 0x1c) - *(fx32 *)(actor + 0x1c);
    fx32 dy = *(fx32 *)(target + 0x20) - *(fx32 *)(actor + 0x20);
    u8 *object;
    Actor_UpdateAttachmentDirectionFromVector(actor, dx, dy);
    object = *(u8 **)(actor + 0x54);
    GamePhaseScriptVm_SetResult(&self->base, object != 0 ? object[0x38] : 0);
    return 0;
}

/* Pop a value into the bound actor's byte at offset 0xe6 and return zero. */
s32 GamePhaseActorScriptVm_SetFieldE6(GamePhaseActorScriptVm *self)
{
    *((u8 *)self->actor + 0xe6) = (u8)GamePhaseScriptVm_Pop(&self->base);
    return 0;
}
