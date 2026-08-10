#include "tingle/heap.h"
#include "tingle/types.h"

/* Recovered guarded auxiliary-object spawn for the type-seven actor. */
extern const char gType7ActorAuxiliaryLoadSceneAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_DestroyAuxiliaryCollisionResource(void *actor);
extern void *GamePhaseLoadScene_Init(void *allocation, s32 type, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Return without action when actor +0x268 bit 0x10 is set. Otherwise invoke
 * Actor_DestroyAuxiliaryCollisionResource(actor) when pointer +0x1e0 is
 * nonnull, allocate 0x9c bytes with
 * label gType7ActorAuxiliaryLoadSceneAllocationTag/alignment four from gHeapContext, and, on success,
 * construct a GamePhaseLoadScene with phase 10 and argument 0x7fff. The routine has no
 * meaningful return value; actor, heap ownership, and auxiliary state may
 * change.
 */
void Type7Actor_SpawnAuxiliaryCollisionResource(void *self)
{
    u8 *actor = (u8 *)self;
    void *allocation;
    if ((*(u32 *)(actor + 0x268) & 0x10) != 0)
        return;
    if (*(void **)(actor + 0x1e0) != 0)
        Actor_DestroyAuxiliaryCollisionResource(actor);
    allocation = Heap_Alloc(0x9c, gType7ActorAuxiliaryLoadSceneAllocationTag, 4, &gHeapContext);
    if (allocation != 0)
        GamePhaseLoadScene_Init(allocation, 10, 0x7fff);
}
