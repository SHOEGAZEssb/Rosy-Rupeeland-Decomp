#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/* Construct, reset, copy, and destroy the actor-bound script VM specialization. */

#ifdef __cplusplus
extern "C" {
#endif
extern const GamePhaseScriptVmVTable data_020d5b20;
#ifdef __cplusplus
}
#endif

/*
 * Construct an empty actor VM, install its derived vtable, reset derived
 * state, clear the actor binding, and return self.
 */
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Init(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_Init(&self->base);
    self->base.vtable = &data_020d5b20;
    GamePhaseActorScriptVm_ResetState(self);
    self->actor = 0;
    return self;
}

/* Construct an actor VM for a script/context and bound actor, then return self. */
GamePhaseActorScriptVm *GamePhaseActorScriptVm_InitWithScript(
    GamePhaseActorScriptVm *self, void *actor, const s8 *script,
    void *context)
{
    GamePhaseScriptVm_InitWithScript(&self->base, script, context);
    self->base.vtable = &data_020d5b20;
    GamePhaseActorScriptVm_ResetState(self);
    self->actor = actor;
    return self;
}

/* Clear the wait counter and low two flags, set value_90 to 0x80, and return. */
void GamePhaseActorScriptVm_ResetState(GamePhaseActorScriptVm *self)
{
    self->waitCounter = 0;
    self->flags_8c &= ~1u;
    self->flags_8c &= ~2u;
    self->value_90 = 0x80;
}

/* Copy a distinct actor VM's base and recovered derived fields, then return self. */
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Assign(
    GamePhaseActorScriptVm *self, const GamePhaseActorScriptVm *source)
{
    if (self != source) {
        GamePhaseScriptVm_Assign(&self->base, &source->base);
        GamePhaseActorScriptVm_CopyState(self, source);
    }
    return self;
}

/* Copy actor, wait counter, and only flag bit zero; leave other derived state unchanged. */
void GamePhaseActorScriptVm_CopyState(GamePhaseActorScriptVm *self,
                                      const GamePhaseActorScriptVm *source)
{
    self->actor = source->actor;
    self->waitCounter = source->waitCounter;
    self->flags_8c = (self->flags_8c & ~1u) | (source->flags_8c & 1u);
}

/* Run the recovered non-deleting base lifecycle hook and return self. */
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Destroy(
    GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_DestroyBase(&self->base);
    return self;
}

/* Run the base lifecycle hook, free the outer allocation, and return its former address. */
GamePhaseActorScriptVm *GamePhaseActorScriptVm_DestroyAndFree(
    GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_DestroyBase(&self->base);
    Heap_Free(self);
    return self;
}
