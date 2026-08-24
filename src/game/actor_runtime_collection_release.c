#include "tingle/actor_runtime_collection.h"
#include "tingle/game_work.h"

/* Release the gameplay object selected by the actor runtime collection. */

typedef void (*ActorRuntimeReleaseMethod)(void *object, s32 reason);

/*
 * Convert selection bit 1 into pending-release bit 2, clear persistent
 * GameWork flag 0x400, and invoke the selected object's vtable method at 0x78
 * with reason 3. Returns no value; the virtual method's broader effect is not
 * yet confirmed and no hardware is accessed directly.
 */
void ActorRuntimeCollection_ReleaseSelectedObject(ActorRuntimeCollection *self)
{
    void *selected;
    void **vtable;

    self->flags =
        (self->flags & ~ACTOR_RUNTIME_COLLECTION_HAS_SELECTED_OBJECT) |
        ACTOR_RUNTIME_COLLECTION_RELEASE_DISPATCHED;
    GameWork_ClearFlag(gGameWork, 0x400);
    selected = self->primaryScriptState.selectedObject;
    vtable = *(void ***)selected;
    ((ActorRuntimeReleaseMethod)vtable[0x78 / 4])(selected, 3);
}
