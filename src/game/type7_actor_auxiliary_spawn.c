#include "tingle/game_phase_load_scene.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/* Create the type-seven actor's guarded phase-10 load scene. */
extern const char gType7ActorAuxiliaryLoadSceneAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_DestroyInteractionIcon(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return without action when actor +0x268 bit 0x10 is set. Otherwise destroy
 * the interaction icon at +0x1e0 when present, allocate 0x9c bytes from
 * gHeapContext with alignment four and the auxiliary-load-scene tag, and, on
 * success, construct a GamePhaseLoadScene for phase 10 with argument 0x7fff.
 * Returns no value; actor icon state, heap ownership, and scene state may
 * change. Allocation failure leaves the actor without its former icon.
 */
void Type7Actor_CreatePhase10LoadScene(void *self)
{
    u8 *actor = (u8 *)self;
    void *loadSceneAllocation;
    if ((*(u32 *)(actor + 0x268) & 0x10) != 0)
        return;
    if (*(void **)(actor + 0x1e0) != 0)
        Actor_DestroyInteractionIcon(actor);
    loadSceneAllocation = Heap_Alloc(
        0x9c, gType7ActorAuxiliaryLoadSceneAllocationTag, 4, &gHeapContext);
    if (loadSceneAllocation != 0)
        GamePhaseLoadScene_Init((GamePhaseLoadScene *)loadSceneAllocation,
                                10, 0x7fff);
}
