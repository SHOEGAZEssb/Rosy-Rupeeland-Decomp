#include "tingle/actor_runtime_object_lists.h"

/* Destroy resources and clear category-1 and other-category runtime lists. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorInteractionRuntime_Shutdown(void);
#ifdef __cplusplus
}
#endif

typedef void *(*ActorRuntimePayloadDeleteMethod)(void *payload);

/*
 * Invoke the shutdown hook, then if category 1 is nonempty call each nonnull
 * resource's deleting virtual method at offset 0x04
 * and clear the list. Returns no value; payload and node allocations may be
 * released, while the hook's wider state effect remains unconfirmed.
 */
void ActorRuntimeAnimationResourceLists_ClearCategory1(ActorRuntimeAnimationResourceLists *self)
{
    ActorRuntimeOwnedNode *node;

    ActorInteractionRuntime_Shutdown();
    if (self->category1.count == 0)
        return;
    for (node = self->category1.head; node != 0; node = node->next) {
        if (node->value != 0) {
            void **vtable = *(void ***)node->value;
            ((ActorRuntimePayloadDeleteMethod)vtable[1])(node->value);
        }
    }
    ActorRuntimeAnimationResourceList_Clear(&self->category1);
}

/*
 * If the other-category list is nonempty, call each resource's deleting virtual
 * method at offset 0x04 and clear the list. Returns no value; virtual calls and
 * list clearing release owned payload/node resources.
 */
void ActorRuntimeAnimationResourceLists_ClearOtherCategory(ActorRuntimeAnimationResourceLists *self)
{
    ActorRuntimeOwnedNode *node;

    if (self->otherCategory.count == 0)
        return;
    for (node = self->otherCategory.head; node != 0; node = node->next) {
        if (node->value != 0) {
            void **vtable = *(void ***)node->value;
            ((ActorRuntimePayloadDeleteMethod)vtable[1])(node->value);
        }
    }
    ActorRuntimeAnimationResourceList_Clear(&self->otherCategory);
}
