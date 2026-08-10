#include "tingle/actor_runtime_collection.h"

/* Reset collection state, detach an active object, and expose a container. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0201b180(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

typedef void (*ActorRuntimeDetachMethod)(void *object, s32 reason, s32 value);

/*
 * Clear the collection flags, address-derived field 0x134, and every owned
 * node. Returns no value; owned allocations are freed through ActorRuntimeOwnedList_Clear.
 */
void ActorRuntimeCollection_Reset(ActorRuntimeCollection *self)
{
    self->flags = 0;
    self->field_134 = 0;
    ActorRuntimeOwnedList_Clear(&self->ownedList);
}

/*
 * If flag bit 2 marks field 0x04 as attached, clear attachment bits 1/2 and
 * invoke that object's vtable method at 0xac with reason 3 and value 0. Then
 * clear field 0x04 and flag bit 0. Returns no value; the virtual call's wider
 * gameplay effect is not yet confirmed and no hardware is touched directly.
 */
void ActorRuntimeCollection_DetachActiveObject(ActorRuntimeCollection *self)
{
    if (self->flags & 4) {
        void *object;
        void **vtable;

        self->flags &= ~6;
        object = (void *)self->field_04;
        vtable = *(void ***)object;
        ((ActorRuntimeDetachMethod)vtable[0xac / 4])(object, 3, 0);
    }
    self->field_04 = 0;
    self->flags &= ~1;
}

/*
 * Copy address-derived container state into the first embedded container and
 * return the helper's result. The source contract and any indirect resource
 * ownership changes remain unconfirmed; no hardware is accessed directly.
 */
void *ActorRuntimeCollection_CopyPrimaryContainerState(ActorRuntimeCollection *self, const void *source)
{
    return func_0201b180(self->firstContainer, source);
}

/* Return the first embedded container at offset 0x08 without changing state. */
void *ActorRuntimeCollection_GetPrimaryContainer(ActorRuntimeCollection *self)
{
    return self->firstContainer;
}
