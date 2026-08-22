#include "tingle/heap.h"
#include "tingle/types.h"

/* Recovered initialization and destruction of a fixed 16-slot owned-object pool. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02003e38(void *allocation);

/*
 * Clear all 16 pointer slots in the supplied 0x40-byte pool and return the pool
 * pointer unchanged. Pool state changes; no allocation or hardware access
 * occurs.
 */
void *InteractionRecordAllocatorPool_Init(void *self)
{
    void **slots = (void **)self;
    s32 i;
    for (i = 0; i < 16; ++i)
        slots[i] = 0;
    return self;
}

/*
 * For each nonnull one of 16 pool slots, free the allocation stored at object
 * +4 through func_02003e38, then free the object through Heap_Free. Return the
 * pool pointer; owned object storage becomes invalid, while the pool itself is
 * not freed here. Heap ownership changes and no direct hardware access occurs.
 */
void *InteractionRecordAllocatorPool_DestroyContents(void *self)
{
    void **slots = (void **)self;
    s32 i;
    for (i = 0; i < 16; ++i) {
        u8 *object = (u8 *)slots[i];
        if (object != 0) {
            func_02003e38(*(void **)(object + 4));
            Heap_Free(object);
        }
    }
    return self;
}

#ifdef __cplusplus
}
#endif
