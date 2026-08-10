#include "tingle/actor_runtime_object_lists.h"

/* Destroy payloads and clear the second and third actor-runtime object lists. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorInteractionRuntime_Shutdown(void);
#ifdef __cplusplus
}
#endif

typedef void *(*ActorRuntimePayloadDeleteMethod)(void *payload);

/*
 * Invoke the address-derived pre-cleanup hook, then if the second list is
 * nonempty call each nonnull payload's deleting virtual method at offset 0x04
 * and clear the list. Returns no value; payload and node allocations may be
 * released, while the hook's wider state effect remains unconfirmed.
 */
void func_0200bd10(ActorRuntimeObjectLists *self)
{
    ActorRuntimeOwnedNode *node;

    ActorInteractionRuntime_Shutdown();
    if (self->second.count == 0)
        return;
    for (node = self->second.head; node != 0; node = node->next) {
        if (node->value != 0) {
            void **vtable = *(void ***)node->value;
            ((ActorRuntimePayloadDeleteMethod)vtable[1])(node->value);
        }
    }
    func_0200bba8(&self->second);
}

/*
 * If the third list is nonempty, call each nonnull payload's deleting virtual
 * method at offset 0x04 and clear the list. Returns no value; virtual calls and
 * list clearing release owned payload/node resources.
 */
void func_0200bd6c(ActorRuntimeObjectLists *self)
{
    ActorRuntimeOwnedNode *node;

    if (self->third.count == 0)
        return;
    for (node = self->third.head; node != 0; node = node->next) {
        if (node->value != 0) {
            void **vtable = *(void ***)node->value;
            ((ActorRuntimePayloadDeleteMethod)vtable[1])(node->value);
        }
    }
    func_0200bba8(&self->third);
}
