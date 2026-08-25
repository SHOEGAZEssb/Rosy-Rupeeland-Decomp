#include "tingle/types.h"

/*
 * Recovered lifecycle for an actor with trigger-driven presentation state.
 * The constructor initializes its private state word; destructor wrappers run
 * the virtual presentation cleanup and inherited actor teardown.
 */

extern const u8 data_020e2560[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *ActorRuntimeBase_Init(void *actor);
extern void RuntimeActor_DestroyAlternateEntry(void *actor);
extern void Actor_ReleaseSecondaryRenderAttachment(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is actor storage. Construct the inherited actor, install vtable
 * data_020e2560, clear halfword 0x1EC, and return self. Parent construction may
 * change engine state; no hardware is accessed directly.
 */
void *TriggerPresentationActor_Init(void *self)
{
    ActorRuntimeBase_Init(self);
    FIELD(const void *, self, 0) = data_020e2560;
    FIELD(u16, self, 0x1ec) = 0;
    return self;
}

/*
 * Input is an actor. Restore data_020e2560, invoke virtual slot 0xBC, release
 * inherited presentation state, and run final base teardown. Return self;
 * engine state changes, heap storage remains, and hardware is untouched directly.
 */
void *TriggerPresentationActor_Destroy(void *self)
{
    FIELD(const void *, self, 0) = data_020e2560;
    void (**vtable)(void *) = (void (**)(void *))data_020e2560;
    vtable[0xbc / sizeof(void *)](self);
    Actor_ReleaseSecondaryRenderAttachment(self);
    RuntimeActor_DestroyAlternateEntry(self);
    return self;
}

/*
 * Input is an actor. Perform the teardown documented for TriggerPresentationActor_Destroy, free
 * the actor allocation, and return its former address. Engine and heap state
 * change; there are no direct hardware effects.
 */
void *TriggerPresentationActor_DestroyAndFree(void *self)
{
    TriggerPresentationActor_Destroy(self);
    Heap_Free(self);
    return self;
}

