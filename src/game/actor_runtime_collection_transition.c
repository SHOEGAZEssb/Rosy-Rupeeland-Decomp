#include "tingle/actor_runtime_collection.h"
#include "tingle/scene.h"

/* Query and complete a scene-gated actor collection transition. */

/* Return collection flag bit 3 as either zero or 8 without changing state. */
u32 ActorRuntimeCollection_GetPendingAttachmentFlag(const ActorRuntimeCollection *self)
{
    return self->flags & 8;
}

/*
 * Complete the active attachment only when object matches field 0x04,
 * collection bit 3 is set, and the current scene's value04 equals 2. Clears
 * bit 3, detaches field 0x04 through ActorRuntimeCollection_DetachActiveObject, sets current scene value08
 * to 1, and returns 1; otherwise returns 0 without changing state. Scene stack
 * state is the only framework effect and no hardware is touched directly.
 */
s32 ActorRuntimeCollection_TryCompleteAttachment(ActorRuntimeCollection *self, void *object)
{
    Scene *scene;

    if (object != (void *)self->field_04)
        return 0;
    if ((self->flags & 8) == 0)
        return 0;
    scene = SceneManager_GetCurrent(gSceneManager);
    if (scene->value04 != 2)
        return 0;

    self->flags &= ~8;
    ActorRuntimeCollection_DetachActiveObject(self);
    SceneManager_GetCurrent(gSceneManager)->value08 = 1;
    return 1;
}
