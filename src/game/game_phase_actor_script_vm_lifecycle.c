#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/* Construct, reset, copy, and destroy the actor-bound script VM specialization. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d5b20;
#ifdef __cplusplus
}
#endif

/* Construct an empty actor VM, install its vtable, reset derived state, and return self. */
GamePhaseActorScriptVm *func_0201b0f4(GamePhaseActorScriptVm *self)
{
    func_02012564(&self->base);
    self->base.vtable = data_020d5b20;
    func_0201b15c(self);
    self->actor_84 = 0;
    return self;
}

/* Construct an actor VM for a script/context and bound actor, then return self. */
GamePhaseActorScriptVm *func_0201b124(GamePhaseActorScriptVm *self,
                                     void *actor, const s8 *script,
                                     void *context)
{
    func_02012608(&self->base, script, context);
    self->base.vtable = data_020d5b20;
    func_0201b15c(self);
    self->actor_84 = actor;
    return self;
}

/* Clear the wait counter and low two flags, set value_90 to 0x80, and return. */
void func_0201b15c(GamePhaseActorScriptVm *self)
{
    self->waitCounter_88 = 0;
    self->flags_8c &= ~1u;
    self->flags_8c &= ~2u;
    self->value_90 = 0x80;
}

/* Copy a distinct actor VM's base and recovered derived fields, then return self. */
GamePhaseActorScriptVm *func_0201b180(GamePhaseActorScriptVm *self,
                                     const GamePhaseActorScriptVm *source)
{
    if (self != source) {
        func_0201264c(&self->base, &source->base);
        func_0201b1ac(self, source);
    }
    return self;
}

/* Copy actor, wait counter, and only flag bit zero; leave other derived state unchanged. */
void func_0201b1ac(GamePhaseActorScriptVm *self,
                   const GamePhaseActorScriptVm *source)
{
    self->actor_84 = source->actor_84;
    self->waitCounter_88 = source->waitCounter_88;
    self->flags_8c = (self->flags_8c & ~1u) | (source->flags_8c & 1u);
}

/* Run the recovered non-deleting base lifecycle hook and return self. */
GamePhaseActorScriptVm *func_0201b1e0(GamePhaseActorScriptVm *self)
{
    func_02012604(&self->base);
    return self;
}

/* Run the base lifecycle hook, free the outer allocation, and return its former address. */
GamePhaseActorScriptVm *func_0201b1f4(GamePhaseActorScriptVm *self)
{
    func_02012604(&self->base);
    Heap_Free(self);
    return self;
}
