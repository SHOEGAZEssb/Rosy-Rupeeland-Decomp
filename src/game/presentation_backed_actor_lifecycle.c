#include "tingle/types.h"

/*
 * Recovered lifecycle support for an actor that owns a presentation object.
 * The constructor initializes its private playback fields and tracks instances
 * of actor type 10; the destructor family releases inherited presentation and
 * actor state, with one wrapper also freeing the actor allocation.
 */

extern const u8 data_020e238c[];
extern u8 gPresentationBackedActorRuntimeState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *func_02030f98(void *actor);
extern void func_0203130c(void *actor);
extern void func_02031488(void *actor);
extern void Type7Actor_ClearGlobalRelationshipToActor(void *actor);
#ifdef __cplusplus
}
#endif

/* Read or write a field whose semantic name is not yet confirmed. */
#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is actor storage. Construct the inherited actor, install the recovered
 * vtable, clear private halfwords at 0x1EC/0x1F0, word 0x1F8, and bytes
 * 0x1EE/0x1EF, then increment gPresentationBackedActorRuntimeState+4 when actor type 10 is observed.
 * Return self. The inherited constructor may change engine state; no hardware
 * is accessed directly.
 */
void *PresentationBackedActor_InitBase(void *self)
{
    func_02030f98(self);
    FIELD(const void *, self, 0x000) = data_020e238c;
    FIELD(u16, self, 0x1ec) = 0;
    FIELD(u16, self, 0x1f0) = 0;
    FIELD(u32, self, 0x1f8) = 0;
    FIELD(u8, self, 0x1ef) = 0;
    FIELD(u8, self, 0x1ee) = 0;
    if (FIELD(u16, self, 0x04e) == 10) {
        FIELD(u32, gPresentationBackedActorRuntimeState, 4)++;
    }
    return self;
}

/*
 * Input is actor storage. Perform the same construction, field initialization,
 * type-10 accounting, and return behavior as PresentationBackedActor_InitBase. This distinct
 * entry point is retained because recovered callers may depend on its address.
 */
void *PresentationBackedActor_Init(void *self)
{
    return PresentationBackedActor_InitBase(self);
}

/*
 * Input is an actor. Restore data_020e238c, tear down owned state through
 * Type7Actor_ClearGlobalRelationshipToActor and vtable slot 0xBC, release inherited presentation state,
 * decrement the type-10 count when applicable, then run final base teardown.
 * Return self; heap storage is retained and no hardware is touched directly.
 */
void *PresentationBackedActor_DestroyComplete(void *self)
{
    void (**vtable)(void *) = (void (**)(void *))data_020e238c;
    FIELD(const void *, self, 0x000) = data_020e238c;
    Type7Actor_ClearGlobalRelationshipToActor(self);
    vtable[0xbc / sizeof(void *)](self);
    func_02031488(self);
    if (FIELD(u16, self, 0x04e) == 10) {
        FIELD(u32, gPresentationBackedActorRuntimeState, 4)--;
    }
    func_0203130c(self);
    return self;
}

/*
 * Input is an actor. Perform the teardown sequence documented for
 * PresentationBackedActor_DestroyComplete, then free the actor allocation and return its former address.
 * Engine and heap state change; there are no direct hardware effects.
 */
void *PresentationBackedActor_DestroyAndFree(void *self)
{
    PresentationBackedActor_DestroyComplete(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is an actor. Perform the non-deleting teardown documented for
 * PresentationBackedActor_DestroyComplete and return self. This separate wrapper is preserved for the
 * recovered callback layout; no heap or hardware state changes directly.
 */
void *PresentationBackedActor_Destroy(void *self)
{
    return PresentationBackedActor_DestroyComplete(self);
}

