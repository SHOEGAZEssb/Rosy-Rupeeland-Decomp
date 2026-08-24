#include "tingle/actor_runtime_collection.h"
#include "tingle/scene.h"

/* Query and complete a scene-gated actor collection transition. */

/* Return the attachment-pending bit as either zero or its mask. */
u32 ActorRuntimeCollection_GetPendingAttachmentFlag(const ActorRuntimeCollection *self)
{
    return self->flags & ACTOR_RUNTIME_COLLECTION_ATTACHMENT_PENDING;
}

/*
 * Complete the attachment only when object matches the retained object,
 * attachment is pending, and the current scene's value04 equals 2. Clears
 * pending state, detaches the object, and sets current scene value08
 * to 1, and returns 1; otherwise returns 0 without changing state. Scene stack
 * state is the only framework effect and no hardware is touched directly.
 */
s32 ActorRuntimeCollection_TryCompleteAttachment(ActorRuntimeCollection *self, void *object)
{
    Scene *scene;

    if (object != self->attachedObject)
        return 0;
    if ((self->flags & ACTOR_RUNTIME_COLLECTION_ATTACHMENT_PENDING) == 0)
        return 0;
    scene = SceneManager_GetCurrent(gSceneManager);
    if (scene->value04 != 2)
        return 0;

    self->flags &= ~ACTOR_RUNTIME_COLLECTION_ATTACHMENT_PENDING;
    ActorRuntimeCollection_DetachActiveObject(self);
    SceneManager_GetCurrent(gSceneManager)->value08 = 1;
    return 1;
}
