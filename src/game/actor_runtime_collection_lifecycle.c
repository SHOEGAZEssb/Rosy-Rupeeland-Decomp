#include "tingle/actor_runtime_collection.h"

/* Initialize and destroy an actor-related runtime collection and owned nodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d4458[];
extern const u8 data_020d4468[];
extern void GamePhaseActorScriptVm_Init(void *container);
extern void GamePhaseActorScriptVm_Destroy(void *container);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the collection flags, its two address-derived container objects,
 * and the owned-node list. Returns self; container constructors may initialize
 * additional internal state, and no hardware is accessed directly.
 */
ActorRuntimeCollection *ActorRuntimeCollection_Init(ActorRuntimeCollection *self)
{
    self->flags = 0;
    GamePhaseActorScriptVm_Init(self->firstContainer);
    GamePhaseActorScriptVm_Init(self->secondContainer);
    self->field_134 = 0;
    ActorRuntimeOwnedList_Init(&self->ownedList);
    return self;
}

/*
 * Initialize an empty owned-node list, installing its recovered derived
 * vtable after the base vtable. Returns self and performs no allocation or
 * hardware access. The vtable roles are inferred from destructor behavior.
 */
ActorRuntimeOwnedList *ActorRuntimeOwnedList_Init(ActorRuntimeOwnedList *self)
{
    self->vtable = data_020d4468;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    self->vtable = data_020d4458;
    return self;
}

/*
 * Restore the base list vtable, release every linked allocation, and return
 * self. Heap_Free is the only SDK/runtime side effect.
 */
ActorRuntimeOwnedList *ActorRuntimeOwnedList_Destroy(ActorRuntimeOwnedList *self)
{
    self->vtable = data_020d4468;
    ActorRuntimeOwnedList_Clear(self);
    return self;
}

/*
 * Destroy the collection's derived and base list layers, then destroy both
 * embedded containers. Returns self; owned heap nodes and container resources
 * are released through the called runtime helpers.
 */
ActorRuntimeCollection *ActorRuntimeCollection_Destroy(ActorRuntimeCollection *self)
{
    ActorRuntimeOwnedList_Clear(&self->ownedList);
    self->ownedList.vtable = data_020d4468;
    ActorRuntimeOwnedList_Clear(&self->ownedList);
    GamePhaseActorScriptVm_Destroy(self->secondContainer);
    GamePhaseActorScriptVm_Destroy(self->firstContainer);
    return self;
}

/*
 * Free every node reachable from head, following each node's first word as
 * the next pointer, then clear all three list links. Accepts an initialized
 * list, returns no value, mutates list ownership state, and calls Heap_Free.
 */
void ActorRuntimeOwnedList_Clear(ActorRuntimeOwnedList *self)
{
    ActorRuntimeOwnedNode *node = self->head;

    while (node != 0) {
        ActorRuntimeOwnedNode *next = node->next;
        /* Preserve the original allocator's explicit null-safe delete form. */
        if (node != 0)
            Heap_Free(node);
        node = next;
    }
    self->head = 0;
    self->tail = 0;
    self->count = 0;
}
