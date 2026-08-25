#include "tingle/thread.h"

/*
 * Heap-backed wrapper around a NitroSDK OSThread. Thread_Create allocates a
 * tagged stack and creates the SDK thread in its initial sleeping state;
 * Thread_Start makes it runnable. Destruction releases the stack but does not
 * join, terminate, or otherwise synchronize with the thread.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_AllocAlternateEntry(u32 size, const char *tag, s32 alignment,
                           void *heap);
extern void Heap_FreeAlternateEntry(void *allocation);
extern void Heap_Free(void *allocation);
extern void OS_CreateThread(void *thread, ThreadEntry entry, void *argument,
                            void *stackTop, u32 stackSize, u32 priority);
extern void OS_WakeupThreadDirect(void *thread);
extern void *gHeapContext;

#ifdef __cplusplus
}
#endif

/* Initialize an inert wrapper with no owned stack and return it. */
Thread *Thread_Init(Thread *thread)
{
    thread->vtable = &gThreadVTable;
    thread->stack = 0;
    return thread;
}

/*
 * Release the owned stack and return the wrapper. The caller must first make
 * certain the SDK thread can no longer access that stack.
 */
Thread *Thread_Destroy(Thread *thread)
{
    thread->vtable = &gThreadVTable;
    Heap_FreeAlternateEntry(thread->stack);
    return thread;
}

/* Destroy a heap-owned wrapper, free the wrapper itself, and return its address. */
Thread *Thread_DestroyAndFree(Thread *thread)
{
    thread->vtable = &gThreadVTable;
    Heap_FreeAlternateEntry(thread->stack);
    Heap_Free(thread);
    return thread;
}

/* Non-deleting destructor entry used by statically or parent-owned wrappers. */
Thread *Thread_Deinit(Thread *thread)
{
    thread->vtable = &gThreadVTable;
    Heap_FreeAlternateEntry(thread->stack);
    return thread;
}

/*
 * Allocate a stack and create a suspended SDK thread. The allocation size and
 * stack-top address use stackSize rounded down to eight bytes, while NitroSDK
 * receives the original stackSize; known callers supply aligned sizes.
 */
#ifndef MATCHING
void Thread_Create(Thread *thread, ThreadEntry entry, void *argument,
                   u32 stackSize, u32 priority)
{
    thread->stack = Heap_AllocAlternateEntry(stackSize & ~7, gThreadStackTag, 4,
                                  (void *)&gHeapContext);
    OS_CreateThread(thread->osThread, entry, argument,
                    (u8 *)thread->stack + (stackSize & ~7), stackSize,
                    priority);
}
#else
/* MWCC otherwise retains the aligned size and chooses a different register set. */
asm void Thread_Create(Thread *thread, ThreadEntry entry, void *argument,
                       u32 stackSize, u32 priority)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    mov r6, r1
    mov r4, r3
    mov r7, r0
    mov r5, r2
    ldr r1, =data_020d3f58
    ldr r3, =gHeapContext
    bic r0, r4, #7
    mov r2, #4
    bl Heap_AllocAlternateEntry
    str r0, [r7, #0xc4]
    ldr r0, [sp, #0x20]
    str r4, [sp]
    str r0, [sp, #4]
    ldr r12, [r7, #0xc4]
    bic r3, r4, #7
    mov r1, r6
    mov r2, r5
    add r0, r7, #4
    add r3, r12, r3
    bl OS_CreateThread
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#endif

/* Make the wrapper's suspended SDK thread ready to run. */
void Thread_Start(Thread *thread)
{
    OS_WakeupThreadDirect(thread->osThread);
}
