#include "tingle/actor_runtime_collection.h"

/* Reset collection state, detach an active object, and expose a container. */

typedef void (*ActorRuntimeDetachMethod)(void *object, s32 reason, s32 value);

/*
 * Clear the collection flags, staged queue value, and every owned
 * node. Returns no value; owned allocations are freed through ActorRuntimeOwnedList_Clear.
 */
void ActorRuntimeCollection_Reset(ActorRuntimeCollection *self)
{
    self->flags = 0;
    self->pendingQueueValue = 0;
    ActorRuntimeOwnedList_Clear(&self->ownedList);
}

/*
 * If release has been dispatched, clear the selection/release bits and invoke
 * the attached object's vtable method at 0xac with reason 3 and value 0. Then
 * clear the attached object and its presence bit. The virtual call's wider
 * gameplay effect is not yet confirmed and no hardware is touched directly.
 */
void ActorRuntimeCollection_DetachActiveObject(ActorRuntimeCollection *self)
{
    if (self->flags & ACTOR_RUNTIME_COLLECTION_RELEASE_DISPATCHED) {
        void *object;
        void **vtable;

        self->flags &= ~(ACTOR_RUNTIME_COLLECTION_HAS_SELECTED_OBJECT |
                         ACTOR_RUNTIME_COLLECTION_RELEASE_DISPATCHED);
        object = self->attachedObject;
        vtable = *(void ***)object;
        ((ActorRuntimeDetachMethod)vtable[0xac / 4])(object, 3, 0);
    }
    self->attachedObject = 0;
    self->flags &= ~ACTOR_RUNTIME_COLLECTION_HAS_ATTACHED_OBJECT;
}

/*
 * Copy one actor-script VM into the primary embedded VM and return that VM.
 * Indirect resource ownership follows the VM assigner's contract.
 */
GamePhaseActorScriptVm *ActorRuntimeCollection_CopyPrimaryContainerState(
    ActorRuntimeCollection *self, const GamePhaseActorScriptVm *source)
{
    return GamePhaseActorScriptVm_Assign(&self->primaryScriptState.scriptVm,
                                         source);
}

/* Return the primary embedded actor-script VM without changing state. */
GamePhaseActorScriptVm *ActorRuntimeCollection_GetPrimaryContainer(
    ActorRuntimeCollection *self)
{
    return &self->primaryScriptState.scriptVm;
}
