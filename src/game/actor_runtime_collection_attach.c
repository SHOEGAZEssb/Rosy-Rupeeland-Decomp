#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"

/* Attach an eligible gameplay object and create its collection-owned handler. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gActorRuntimeSceneAllocationTag[];
extern void *GamePhaseActorScriptVm_Assign(void *destination, const void *source);
extern void *ActorRuntimeScene_Init(void *handler, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Ignore an object when collection bit 3 is already set and its byte 0xe8 is
 * type 4, or whenever object flag bit 3 at offset 0x10 is clear. Otherwise
 * store it at field 0x04, copy its offset-0xec container state into the first
 * embedded container, set collection bits 0/3, and allocate a 0x28-byte
 * handler initialized by ActorRuntimeScene_Init. Returns no value; allocation failure
 * leaves the attachment flags/state installed but creates no handler.
 */
void ActorRuntimeCollection_AttachObject(ActorRuntimeCollection *self, void *object)
{
    void *handler;

    if ((self->flags & 8) && *((u8 *)object + 0xe8) == 4)
        return;
    if ((*(u32 *)((u8 *)object + 0x10) & 8) == 0)
        return;

    self->field_04 = (u32)object;
    GamePhaseActorScriptVm_Assign(self->firstContainer, (u8 *)object + 0xec);
    self->flags |= 9;
    handler = Heap_Alloc(0x28, (const char *)gActorRuntimeSceneAllocationTag, 4,
                         &gHeapContext);
    if (handler != 0)
        ActorRuntimeScene_Init(handler, object);
}
