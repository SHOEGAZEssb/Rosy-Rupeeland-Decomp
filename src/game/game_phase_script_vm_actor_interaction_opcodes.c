#include "tingle/game_phase_script_vm.h"

/* Implement actor-script cleanup and indexed actor-interaction opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void Type7Actor_ResetMotionAndCooldown(void *actor);
extern s32 Actor_QueryRuntimeProperty(void *actor, u32 selector);
extern void Actor_SetRuntimeProperty(void *actor, u32 selector, s32 value);
extern void *Actor_GetOwningCollection(void *actor);
extern void *ActorCollection_FindActorByRuntimeId(void *collection, s32 index);
#ifdef __cplusplus
}
#endif

typedef void (*ActorVoidMethod)(void *actor);
typedef void (*ActorPointerMethod)(void *actor, void *value);

/*
 * Clear actor flag 0x01000000 and perform type-specific cleanup. Type 2 calls
 * virtual method 0x114, then for byte 0x27e values 1/2/3/29/32 calls virtual
 * method 0xd4 with the runtime pointer at 0x2ea4. Type 7 delegates to
 * Type7Actor_ResetMotionAndCooldown. Returns zero. The meaning of these type
 * values is unconfirmed.
 */
s32 GamePhaseActorScriptVm_ClearFlag01000000AndCleanup(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    *(u32 *)(actor + 0x10) &= ~0x01000000u;
    if (actor[0x4d] == 2) {
        ActorVoidMethod cleanupMethod =
            *(ActorVoidMethod *)((u8 *)*(void **)actor + 0x114);
        u32 typeValueBitIndex;
        cleanupMethod(actor);
        typeValueBitIndex = (actor[0x27e] - 1) & 0xff;
        if (typeValueBitIndex <= 31 &&
            ((0x90000007u >> typeValueBitIndex) & 1) != 0) {
            ActorPointerMethod runtimePointerMethod =
                *(ActorPointerMethod *)((u8 *)*(void **)actor + 0xd4);
            runtimePointerMethod(
                actor, *(void **)((u8 *)gGamePhaseRuntime + 0x2ea4));
        }
    } else if (actor[0x4d] == 7) {
        Type7Actor_ResetMotionAndCooldown(actor);
    }
    return 0;
}

/* No-op script handler; ignores the VM and returns zero. */
s32 GamePhaseActorScriptVm_NoOp(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Query a selected property of the bound actor and store it as the VM result. */
s32 GamePhaseActorScriptVm_QueryActorProperty(GamePhaseActorScriptVm *self)
{
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, Actor_QueryRuntimeProperty(self->actor, selector));
    return 0;
}

/* Set a selected property of the bound actor and return zero. */
s32 GamePhaseActorScriptVm_SetActorProperty(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    Actor_SetRuntimeProperty(self->actor, selector, value);
    return 0;
}

/*
 * Resolve an indexed actor from the bound collection, query its selected
 * property, and store the value as the VM result.
 */
s32 GamePhaseActorScriptVm_QueryIndexedActorProperty(GamePhaseActorScriptVm *self)
{
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *targetActor = ActorCollection_FindActorByRuntimeId(
        Actor_GetOwningCollection(self->actor), index);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(
        &self->base, Actor_QueryRuntimeProperty(targetActor, selector));
    return 0;
}

/*
 * Resolve an indexed actor from the bound collection, set its selected
 * property, and return zero.
 */
s32 GamePhaseActorScriptVm_SetIndexedActorProperty(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *targetActor = ActorCollection_FindActorByRuntimeId(
        Actor_GetOwningCollection(self->actor), index);
    Actor_SetRuntimeProperty(targetActor, selector, value);
    return 0;
}
