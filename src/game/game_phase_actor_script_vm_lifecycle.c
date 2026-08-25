#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/* Construct, reset, copy, and destroy the actor-bound script VM specialization. */

/*
 * Construct an empty actor VM, install its derived vtable, reset derived
 * state, clear the actor binding, and return self.
 */
GamePhaseActorScriptVm *GamePhaseActorScriptVm_Init(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_Init(&self->base);
    self->base.vtable = &gGamePhaseActorScriptVmVTable;
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
    self->base.vtable = &gGamePhaseActorScriptVmVTable;
    GamePhaseActorScriptVm_ResetState(self);
    self->actor = actor;
    return self;
}

/* Clear the wait counter and low two flags, set effectStateValue to 0x80. */
void GamePhaseActorScriptVm_ResetState(GamePhaseActorScriptVm *self)
{
    self->waitCounter = 0;
    self->actorStateFlags &= ~GAME_PHASE_ACTOR_SCRIPT_VM_ACTIVE;
    self->actorStateFlags &= ~GAME_PHASE_ACTOR_SCRIPT_VM_EFFECT_STATE_PENDING;
    self->effectStateValue = 0x80;
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
    self->actorStateFlags =
        (self->actorStateFlags & ~GAME_PHASE_ACTOR_SCRIPT_VM_ACTIVE) |
        (source->actorStateFlags & GAME_PHASE_ACTOR_SCRIPT_VM_ACTIVE);
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
