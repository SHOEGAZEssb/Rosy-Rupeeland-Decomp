#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"

/* Attach an eligible gameplay object and create its collection-owned handler. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gActorRuntimeSceneAllocationTag[];
extern void *ActorRuntimeScene_Init(void *handler, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Ignore an object when collection bit 3 is already set and its byte 0xe8 is
 * type 4, or whenever object flag bit 3 at offset 0x10 is clear. Otherwise
 * retain it as the attached object, copy its offset-0xec script VM into the
 * primary embedded VM, set the attached/pending bits, and allocate a 0x28-byte
 * handler. Allocation failure leaves attachment state installed without a
 * handler.
 */
void ActorRuntimeCollection_AttachObject(ActorRuntimeCollection *self, void *object)
{
    void *handler;

    if ((self->flags & ACTOR_RUNTIME_COLLECTION_ATTACHMENT_PENDING) &&
        *((u8 *)object + 0xe8) == 4)
        return;
    if ((*(u32 *)((u8 *)object + 0x10) & 8) == 0)
        return;

    self->attachedObject = object;
    GamePhaseActorScriptVm_Assign(
        &self->primaryScriptState.scriptVm,
        (const GamePhaseActorScriptVm *)((u8 *)object + 0xec));
    self->flags |= ACTOR_RUNTIME_COLLECTION_HAS_ATTACHED_OBJECT |
                   ACTOR_RUNTIME_COLLECTION_ATTACHMENT_PENDING;
    handler = Heap_Alloc(0x28, (const char *)gActorRuntimeSceneAllocationTag, 4,
                         &gHeapContext);
    if (handler != 0)
        ActorRuntimeScene_Init(handler, object);
}
