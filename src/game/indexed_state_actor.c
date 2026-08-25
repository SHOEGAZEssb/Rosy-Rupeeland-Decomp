#include "tingle/types.h"

/*
 * Recovered derived actor with a two-halfword state extension. Its descriptor
 * supplies the secondary index while the primary state gates base updates.
 */

extern const u8 data_020e212c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *ActorDerivedRuntime_Init(void *actor, const void *descriptor);
extern void ActorDerivedRuntime_DestroyAlternate(void *actor);
extern void Actor_InitializeFromDescriptor(void *actor);
extern void ActorDerivedRuntime_UpdateFrame(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are destination actor storage and a descriptor. Construct the base
 * with ActorDerivedRuntime_Init, install vtable data_020e212c, clear signed halfword
 * +0x208, and copy descriptor signed halfword +0x4e to +0x20a. Return self.
 * Base and actor state may change; there are no direct hardware effects.
 */
void *IndexedStateActor_Init(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    ActorDerivedRuntime_Init(actor, descriptor);
    *(const void **)actor = data_020e212c;
    *(s16 *)(actor + 0x208) = 0;
    *(s16 *)(actor + 0x20a) = *(s16 *)((const u8 *)descriptor + 0x4e);
    return actor;
}

/*
 * Input is an indexed-state actor. Invoke non-deleting base destructor
 * ActorDerivedRuntime_DestroyAlternate and return self. Base state may change; no direct heap or
 * hardware effect occurs.
 */
void *IndexedStateActor_Destroy(void *self)
{
    ActorDerivedRuntime_DestroyAlternate(self);
    return self;
}

/*
 * Input is an indexed-state actor. Invoke ActorDerivedRuntime_DestroyAlternate, free self, and return
 * the original address as in retail code. Base and heap state change; there
 * are no direct hardware effects.
 */
void *IndexedStateActor_DestroyAndFree(void *self)
{
    ActorDerivedRuntime_DestroyAlternate(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is an indexed-state actor. Tail-forward directly to base state-entry
 * helper Actor_InitializeFromDescriptor. Its observable state changes and return convention are
 * preserved; there are no direct hardware effects in this wrapper.
 */
void IndexedStateActor_EnterInitialState(void *self)
{
    Actor_InitializeFromDescriptor(self);
}

/*
 * Input is an indexed-state actor. Invoke base frame update ActorDerivedRuntime_UpdateFrame only
 * while signed halfword +0x208 is zero; all other values return unchanged. No
 * value is returned. Base actor state may change, with no direct hardware effects.
 */
void IndexedStateActor_Update(void *self)
{
    if (*(s16 *)((u8 *)self + 0x208) == 0)
        ActorDerivedRuntime_UpdateFrame(self);
}
