#include "tingle/heap.h"
#include "tingle/types.h"

/* Recovered lifecycle and reset helper for a subclass of the table-configured actor. */
extern u8 data_020e0b70[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedTable_Init(void *actor, const void *configuration);
extern void *ActorExtendedType2_Destroy(void *actor);
extern void ActorExtendedTable_ResetStageCounters(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the table-configured parent through ActorExtendedTable_Init, install vtable
 * data_020e0b70, clear halfwords +0x2a8/+0x2aa, and return self. Actor, parent,
 * and table-selection state change; no direct SDK or hardware access occurs.
 */
void *ActorExtendedTableCyclic_Init(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    ActorExtendedTable_Init(actor, configuration);
    *(void **)actor = data_020e0b70;
    *(u16 *)(actor + 0x2a8) = 0;
    *(u16 *)(actor + 0x2aa) = 0;
    return actor;
}

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *ActorExtendedTableCyclic_Destroy(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Invoke base destructor ActorExtendedType2_Destroy, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *ActorExtendedTableCyclic_DestroyAndFree(void *self)
{
    ActorExtendedType2_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Reset the inherited counters through ActorExtendedTable_ResetStageCounters, then clear subclass
 * halfword +0x2a8 and set +0x2aa to 15. Returns no value; actor state changes.
 */
void ActorExtendedTableCyclic_ResetStageCycle(void *self)
{
    u8 *actor = (u8 *)self;
    ActorExtendedTable_ResetStageCounters(actor);
    *(u16 *)(actor + 0x2a8) = 0;
    *(u16 *)(actor + 0x2aa) = 15;
}
