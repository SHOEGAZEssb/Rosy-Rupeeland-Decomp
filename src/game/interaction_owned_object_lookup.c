#include "tingle/heap.h"
#include "tingle/types.h"

/* Recovered lookup-or-create operation for the fixed interaction object pool. */
extern const char gInteractionRecordAllocatorAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *InteractionRecordAllocator_Init(void *object,
                                             const void *recordTable);
#ifdef __cplusplus
}
#endif

/*
 * Scan 16 pool slots. Return an existing object whose +0 table pointer equals
 * recordTable. At the first empty slot, allocate 12 bytes with label
 * gInteractionRecordAllocatorAllocationTag, alignment four, and gHeapContext; construct it through
 * InteractionRecordAllocator_Init when allocation succeeds, store the
 * resulting pointer, and return it. Return null if all slots hold different
 * tables. Pool and heap ownership may change; allocation crosses the engine
 * heap boundary.
 */
void *InteractionRecordAllocatorPool_GetOrCreate(
    void *self, const void *recordTable)
{
    void **slots = (void **)self;
    s32 i;
    for (i = 0; i < 16; ++i) {
        u8 *object = (u8 *)slots[i];
        if (object == 0) {
            object = (u8 *)Heap_Alloc(12, gInteractionRecordAllocatorAllocationTag, 4, &gHeapContext);
            if (object != 0)
                object = (u8 *)InteractionRecordAllocator_Init(object, recordTable);
            slots[i] = object;
            return object;
        }
        if (*(const void **)object == recordTable)
            return object;
    }
    return 0;
}
