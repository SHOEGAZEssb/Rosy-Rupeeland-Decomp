#ifndef TINGLE_HEAP_H
#define TINGLE_HEAP_H

#include "tingle/types.h"

typedef struct HeapContext {
    void *storage;
    u32 size;
    void *heap;
} HeapContext;

typedef char HeapContextSizeCheck[sizeof(HeapContext) == 0xC ? 1 : -1];

extern HeapContext gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif

void InitHeap(void);
void Heap_CreateRoot(void);
void Heap_DestroyRoot(void);
void *Heap_AllocCore(u32 size, const char *tag, s32 alignment,
                    HeapContext *context);
void Heap_FreeCore(void *allocation);
void HeapContext_CreateChild(HeapContext *context, u32 size);
void *HeapContext_Alloc(HeapContext *context, u32 size, const char *tag,
                        s32 alignment);
void HeapContext_Destroy(HeapContext *context);
void Heap_AccumulateAllocationSize(void *allocation, void *unused);
void Heap_CopyAllocationTag(s8 *destination, const s8 *tag);
void *Heap_Alloc(u32 size, const char *tag, s32 alignment,
                 HeapContext *context);
void *Heap_AllocAlternateEntry(u32 size, const char *tag, s32 alignment,
                    HeapContext *context);
void Heap_Free(void *allocation);
void Heap_FreeAlternateEntry(void *allocation);

#ifdef __cplusplus
}
#endif

#endif
