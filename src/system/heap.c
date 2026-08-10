#include "tingle/heap.h"

/*
 * Game-owned heap facade over the NitroSDK arena and expandable-heap APIs.
 * Allocations carry a four-byte diagnostic tag immediately before the pointer
 * returned to callers. Heap destruction enumerates allocations to accumulate
 * their sizes before releasing the SDK heap handle.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void OS_InitArena(void);
extern void *OS_GetArenaHi(int arenaId);
extern void *OS_GetArenaLo(int arenaId);
extern void *OS_InitAlloc(int arenaId, void *arenaLo, void *arenaHi,
                          int maxHeaps);
extern void OS_SetArenaLo(int arenaId, void *arenaLo);
extern void *OS_AllocFromArenaLo(int arenaId, u32 size, u32 alignment);

extern void *func_020a7310(void *start, u32 size, int options);
extern void func_020a7240(void *heap, int mode);
extern void *func_020a72d4(void *heap, u32 size, s32 alignment);
extern void *func_020a70a0(void *allocation);
extern void func_020a7298(void *heap, void *allocation);
extern void func_020a71f4(void *heap, void (*visitor)(void *, void *));
extern void func_020a7270(void *heap);
extern u32 func_020a71ec(void *allocation);

#ifdef __cplusplus
}
#endif

#ifndef MATCHING
u32 gHeapAllocationSizeAccumulator;
HeapContext gHeapContext;
#define ROOT_INIT_CONTEXT (&gHeapContext)
#else
extern u32 gHeapAllocationSizeAccumulator;
#define ROOT_INIT_CONTEXT                                                   \
    ((HeapContext *)((u8 *)&gHeapAllocationSizeAccumulator + 4))
#endif

/* Four-byte allocation tag used for storage backing child heap contexts. */
char gHeapStorageTag[8] = {'H', 'E', 'A', 'P', 0, 0, 0, 0};

/*
 * Claim the complete main arena for the root game heap. NitroSDK first moves
 * the arena low boundary past its allocator metadata; the remaining span is
 * then reserved at 16-byte alignment and wrapped by Heap_CreateRoot.
 */
#ifndef MATCHING
void InitHeap(void)
{
    void *arenaHi;
    void *arenaLo;
    u32 zero;

    OS_InitArena();
    arenaHi = OS_GetArenaHi(0);
    arenaLo = OS_GetArenaLo(0);
    arenaLo = OS_InitAlloc(0, arenaLo, arenaHi, 1);
    OS_SetArenaLo(0, arenaLo);

    zero = 0;
    ROOT_INIT_CONTEXT->storage = (void *)zero;
    ROOT_INIT_CONTEXT->heap = (void *)zero;
    arenaLo = OS_GetArenaLo(0);
    arenaHi = OS_GetArenaHi(0);
    ROOT_INIT_CONTEXT->size = (u8 *)arenaHi - (u8 *)arenaLo;
    ROOT_INIT_CONTEXT->storage =
        OS_AllocFromArenaLo(0, ROOT_INIT_CONTEXT->size, 0x10);
    Heap_CreateRoot();
}
#else
/* Matching form of the documented arena/bootstrap sequence above. */
asm void InitHeap(void)
{
    stmdb sp!, {r4, lr}
    bl OS_InitArena
    mov r0, #0
    bl OS_GetArenaHi
    mov r4, r0
    mov r0, #0
    bl OS_GetArenaLo
    mov r1, r0
    mov r2, r4
    mov r0, #0
    mov r3, #1
    bl OS_InitAlloc
    mov r1, r0
    mov r0, #0
    bl OS_SetArenaLo
    mov r0, #0
    ldr r1, =gHeapAllocationSizeAccumulator
    str r0, [r1, #4]
    str r0, [r1, #0xc]
    bl OS_GetArenaLo
    mov r4, r0
    mov r0, #0
    bl OS_GetArenaHi
    sub r1, r0, r4
    ldr r2, =gHeapAllocationSizeAccumulator
    mov r0, #0
    str r1, [r2, #8]
    mov r2, #0x10
    bl OS_AllocFromArenaLo
    ldr r1, =gHeapAllocationSizeAccumulator
    str r0, [r1, #4]
    bl Heap_CreateRoot
    ldmia sp!, {r4, pc}
}
#endif

/* Create the SDK heap over the reserved root span and select mode zero. */
void Heap_CreateRoot(void)
{
    ROOT_INIT_CONTEXT->heap = func_020a7310(
        ROOT_INIT_CONTEXT->storage, ROOT_INIT_CONTEXT->size, 0);
    func_020a7240(ROOT_INIT_CONTEXT->heap, 0);
}

/* Destroy the process-global root heap through the shared context routine. */
void Heap_DestroyRoot(void)
{
    HeapContext_Destroy(&gHeapContext);
}

/* Public ABI wrapper: reorder size/tag/alignment/context for the allocator. */
void *Heap_AllocCore(u32 size, const char *tag, s32 alignment,
                    HeapContext *context)
{
    return HeapContext_Alloc(context, size, tag, alignment);
}

/*
 * Free a tagged allocation. The SDK resolves its owning heap from the hidden
 * four-byte header address, allowing allocations from child heaps to share
 * this entry point.
 */
void Heap_FreeCore(void *allocation)
{
    void *heap = func_020a70a0((u8 *)allocation - 4);
    func_020a7298(heap, (u8 *)allocation - 4);
}

/* Allocate storage for, and create, a child heap of the requested size. */
#ifndef MATCHING
void HeapContext_CreateChild(HeapContext *context, u32 size)
{
    context->heap = func_020a7310(
        context->storage = HeapContext_Alloc(
            &gHeapContext, size + 0x50, gHeapStorageTag, 4),
        size + 0x50, 0);
    context->size = size;
}
#else
/* Matching form of the documented child-heap construction above. */
asm void HeapContext_CreateChild(HeapContext *context, u32 size)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    ldr r0, =gHeapContext
    ldr r2, =gHeapStorageTag
    add r1, r4, #0x50
    mov r3, #4
    bl HeapContext_Alloc
    add r1, r4, #0x50
    mov r2, #0
    str r0, [r5]
    bl func_020a7310
    str r0, [r5, #8]
    str r4, [r5, #4]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif

/*
 * Allocate size+4 bytes from an SDK heap, store an optional four-byte tag in
 * the prefix, and return the payload. On failure retail destroys the root heap
 * and then continues with the null result, so callers rely on allocation success.
 */
void *HeapContext_Alloc(HeapContext *context, u32 size, const char *tag,
                    s32 alignment)
{
    void *allocation = func_020a72d4(context->heap, size + 4, alignment);

    if (allocation == 0) {
        HeapContext_Destroy(&gHeapContext);
    }
    Heap_CopyAllocationTag((s8 *)allocation, (const s8 *)tag);
    return (u8 *)allocation + 4;
}

/* Enumerate and destroy a nonempty SDK heap; its backing storage is retained. */
#ifndef MATCHING
void HeapContext_Destroy(HeapContext *context)
{
    if (context->size == 0) {
        return;
    }

    gHeapAllocationSizeAccumulator = 0;
    func_020a71f4(context->heap, Heap_AccumulateAllocationSize);
    func_020a7270(context->heap);
}
#else
/* Matching form of the documented heap enumeration/destruction above. */
asm void HeapContext_Destroy(HeapContext *context)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #4]
    cmp r0, #0
    ldmeqia sp!, {r4, pc}
    ldr r0, =gHeapAllocationSizeAccumulator
    mov r2, #0
    str r2, [r0]
    ldr r0, [r4, #8]
    ldr r1, =Heap_AccumulateAllocationSize
    bl func_020a71f4
    ldr r0, [r4, #8]
    bl func_020a7270
    ldmia sp!, {r4, pc}
}
#endif

/* SDK heap visitor: add this allocation's byte size to the global accumulator. */
void Heap_AccumulateAllocationSize(void *allocation, void *unused)
{
    (void)unused;
    gHeapAllocationSizeAccumulator += func_020a71ec(allocation);
}

/* Copy exactly four signed bytes of a non-null diagnostic allocation tag. */
void Heap_CopyAllocationTag(s8 *destination, const s8 *tag)
{
    int i;

    if (tag == 0) {
        return;
    }
    for (i = 0; i < 4; i++) {
        destination[i] = tag[i];
    }
}
