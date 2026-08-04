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
void func_020026c0(void);
void func_020026ec(void);
void *func_02002700(u32 size, const char *tag, s32 alignment,
                    HeapContext *context);
void func_02002728(void *allocation);
void func_02002744(HeapContext *context, u32 size);
void *func_02002788(HeapContext *context, u32 size, const char *tag,
                    s32 alignment);
void func_020027c8(HeapContext *context);
void func_02002808(void *allocation, void *unused);
void func_02002828(s8 *destination, const s8 *tag);
void *Heap_Alloc(u32 size, const char *tag, s32 alignment,
                 HeapContext *context);
void *func_02003e20(u32 size, const char *tag, s32 alignment,
                    HeapContext *context);
void Heap_Free(void *allocation);
void func_02003e38(void *allocation);

#ifdef __cplusplus
}
#endif

#endif
