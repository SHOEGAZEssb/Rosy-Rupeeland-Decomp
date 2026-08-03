#include "tingle/frame_task.h"

/*
 * Global per-frame task scheduler. Heap-owned nodes form a doubly linked list;
 * callers may prepend or append tasks, and the main loop updates them from
 * head to tail, destroying tasks whose update method returns one.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *gHeapContext;

#ifdef __cplusplus
}
#endif

/*
 * Allocate a node for task and insert it at the head when append is zero or
 * the tail otherwise. Increments the global count and returns the new node;
 * allocation failure leaves a null node flowing through the retail logic.
 */
#ifndef MATCHING
FrameTaskNode *FrameTaskList_Add(FrameTask *task, int append)
{
    FrameTaskNode *node;

    if (append == 0) {
        node = (FrameTaskNode *)Heap_Alloc(sizeof(FrameTaskNode),
                                           gFrameTaskTags.prepend, 4,
                                           gHeapContext);
        if (node != 0) {
            node = FrameTaskNode_Init(node, &task);
        }

        if (gFrameTaskList.head != 0) {
            gFrameTaskList.head->previous = node;
            node->next = gFrameTaskList.head;
        } else {
            gFrameTaskList.tail = node;
        }
        gFrameTaskList.head = node;
    } else {
        node = (FrameTaskNode *)Heap_Alloc(sizeof(FrameTaskNode),
                                           gFrameTaskTags.append, 4,
                                           gHeapContext);
        if (node != 0) {
            node = FrameTaskNode_Init(node, &task);
        }

        if (gFrameTaskList.tail != 0) {
            gFrameTaskList.tail->next = node;
            node->previous = gFrameTaskList.tail;
        } else {
            gFrameTaskList.head = node;
        }
        gFrameTaskList.tail = node;
    }

    gFrameTaskList.count++;
    return node;
}
#else
/* MWCC chooses a different stack frame and register lifetime for this C. */
asm FrameTaskNode *FrameTaskList_Add(FrameTask *task, int append)
{
    stmdb sp!, {r3, lr}
    sub sp, sp, #8
    cmp r1, #0
    mov r2, #4
    bne frame_task_add_tail
    ldr r1, =gFrameTaskTags+8
    str r0, [sp, #4]
    ldr r3, =gHeapContext
    mov r0, #0xc
    bl Heap_Alloc
    cmp r0, #0
    beq frame_task_add_head_link
    add r1, sp, #4
    bl FrameTaskNode_Init
frame_task_add_head_link:
    ldr r1, =gFrameTaskList
    ldr r2, [r1, #4]
    cmp r2, #0
    strne r0, [r2, #4]
    ldrne r1, [r1, #4]
    strne r1, [r0]
    streq r0, [r1, #8]
    ldr r1, =gFrameTaskList
    str r0, [r1, #4]
    ldr r2, [r1, #0xc]
    add r2, r2, #1
    str r2, [r1, #0xc]
    b frame_task_add_return
frame_task_add_tail:
    ldr r1, =gFrameTaskTags
    str r0, [sp]
    ldr r3, =gHeapContext
    mov r0, #0xc
    bl Heap_Alloc
    cmp r0, #0
    beq frame_task_add_tail_link
    add r1, sp, #0
    bl FrameTaskNode_Init
frame_task_add_tail_link:
    ldr r1, =gFrameTaskList
    ldr r2, [r1, #8]
    cmp r2, #0
    strne r0, [r2]
    ldrne r1, [r1, #8]
    strne r1, [r0, #4]
    streq r0, [r1, #4]
    ldr r1, =gFrameTaskList
    str r0, [r1, #8]
    ldr r2, [r1, #0xc]
    add r2, r2, #1
    str r2, [r1, #0xc]
frame_task_add_return:
    add sp, sp, #8
    ldmia sp!, {r3, pc}
}
#endif

/* Clear both links, copy the referenced task pointer, and return node. */
FrameTaskNode *FrameTaskNode_Init(FrameTaskNode *node, FrameTask **task)
{
    node->next = 0;
    node->previous = 0;
    node->task = *task;
    return node;
}

/*
 * Unlink and free node, then invoke its task's deleting destructor when the
 * task is non-null. The node argument is invalid on return.
 */
#ifndef MATCHING
void FrameTaskList_DestroyNode(FrameTaskNode *node)
{
    FrameTask *task = node->task;

    FrameTaskList_Remove(&gFrameTaskList, node);
    if (task != 0) {
        task->vtable->destroyAndFree(task);
    }
}
#else
/* Matching counterpart of the ownership sequence documented above. */
asm void FrameTaskList_DestroyNode(FrameTaskNode *node)
{
    stmdb sp!, {r4, lr}
    mov r1, r0
    ldr r4, [r1, #8]
    ldr r0, =gFrameTaskList
    bl FrameTaskList_Remove
    cmp r4, #0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0]
    ldr r1, [r1, #4]
    blx r1
    ldmia sp!, {r4, pc}
}
#endif

/*
 * Detach and free node and decrement list->count. The zero-count cleanup loop
 * is retained verbatim as defensive retail behavior, although a consistent
 * list has no remaining nodes at that point. Returns no value.
 */
#ifndef MATCHING
void FrameTaskList_Remove(FrameTaskList *list, FrameTaskNode *node)
{
    FrameTaskNode *remaining;

    if (node == list->head) {
        list->head = node->next;
    } else {
        node->next->previous = node->previous;
    }

    if (node == list->tail) {
        list->tail = node->previous;
    } else {
        node->previous->next = node->next;
    }

    if (node != 0) {
        Heap_Free(node);
    }

    list->count--;
    if (list->count != 0) {
        return;
    }

    remaining = list->head;
    while (remaining != 0) {
        FrameTaskNode *next = remaining->next;
        if (remaining != 0) {
            Heap_Free(remaining);
        }
        remaining = next;
    }
    list->head = 0;
    list->tail = 0;
    list->count = 0;
}
#else
/* MWCC's portable lowering uses different registers across the unlink paths. */
asm void FrameTaskList_Remove(FrameTaskList *list, FrameTaskNode *node)
{
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #4]
    cmp r1, r0
    ldreq r0, [r1]
    streq r0, [r4, #4]
    ldrne r2, [r1]
    ldrne r0, [r1, #4]
    strne r2, [r0]
    ldr r0, [r4, #8]
    cmp r1, r0
    ldreq r0, [r1, #4]
    streq r0, [r4, #8]
    ldmneia r1, {r0, r2}
    strne r2, [r0, #4]
    cmp r1, #0
    beq frame_task_remove_count
    mov r0, r1
    bl Heap_Free
frame_task_remove_count:
    ldr r0, [r4, #0xc]
    subs r0, r0, #1
    str r0, [r4, #0xc]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #4]
    b frame_task_remove_cleanup_test
frame_task_remove_cleanup_loop:
    cmp r0, #0
    ldr r5, [r0]
    beq frame_task_remove_cleanup_next
    bl Heap_Free
frame_task_remove_cleanup_next:
    mov r0, r5
frame_task_remove_cleanup_test:
    cmp r0, #0
    bne frame_task_remove_cleanup_loop
    mov r0, #0
    str r0, [r4, #4]
    str r0, [r4, #8]
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif

/*
 * Update all registered tasks and destroy those returning one. The portable
 * form caches next before destruction. The matching form preserves the retail
 * iterator's read of node->next after that node has been freed; changing it
 * alters code generation and assumes Heap_Free has not overwritten the link.
 */
#ifndef MATCHING
void FrameTaskList_Update(void)
{
    FrameTaskNode *node;

    if (gFrameTaskList.count == 0) {
        return;
    }

    node = gFrameTaskList.head;
    while (node != 0) {
        FrameTaskNode *next = node->next;
        FrameTask *task = node->task;
        if (task->vtable->update(task) == 1) {
            FrameTaskList_DestroyNode(node);
        }
        node = next;
    }
}
#else
/* Matching counterpart of the documented portable implementation above. */
asm void FrameTaskList_Update(void)
{
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, =gFrameTaskList
    ldr r0, [r0, #0xc]
    cmp r0, #0
    moveq r0, #1
    movne r0, #0
    cmp r0, #0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r4, =gFrameTaskList
    ldr r5, [r4, #4]
    b frame_task_update_test
frame_task_update_loop:
    ldr r6, [r5, #8]
    mov r0, r6
    ldr r1, [r0]
    ldr r1, [r1, #8]
    blx r1
    cmp r0, #1
    bne frame_task_update_next
    mov r0, r4
    mov r1, r5
    bl FrameTaskList_Remove
    cmp r6, #0
    beq frame_task_update_next
    mov r0, r6
    ldr r1, [r0]
    ldr r1, [r1, #4]
    blx r1
frame_task_update_next:
    ldr r5, [r5]
frame_task_update_test:
    cmp r5, #0
    bne frame_task_update_loop
    ldmia sp!, {r4, r5, r6, pc}
}
#endif
