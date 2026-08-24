#include "tingle/actor_runtime_collection.h"
#include "tingle/game_work.h"

/* Select and release a collection-associated gameplay object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Mark an object selected in field 0x9c and set persistent GameWork flag
 * 0x400. If a selection already exists, exactly one of the old/new objects is
 * required to carry bit 0x2000 at offset 0x14; the object without that bit is
 * retained, while equal classifications enter OS_Halt. Returns no value and
 * mutates collection and persistent game state.
 */
void ActorRuntimeCollection_SelectObject(ActorRuntimeCollection *self, void *candidate)
{
    if (self->flags & ACTOR_RUNTIME_COLLECTION_HAS_SELECTED_OBJECT) {
        void *current = self->primaryScriptState.selectedObject;
        u32 candidateFlags = *(u32 *)((u8 *)candidate + 0x14);
        u32 currentFlags = *(u32 *)((u8 *)current + 0x14);
        u32 candidateClass = candidateFlags & 0x2000;
        u32 currentClass = currentFlags & 0x2000;

        if ((currentClass == 0 && candidateClass == 0) ||
            (currentClass != 0 && candidateClass != 0)) {
            OS_Halt();
        } else if (currentClass == 0 && candidateClass != 0) {
            candidate = current;
        }
    }

    self->flags |= ACTOR_RUNTIME_COLLECTION_HAS_SELECTED_OBJECT;
    GameWork_SetFlag(gGameWork, 0x400);
    self->primaryScriptState.selectedObject = candidate;
}
