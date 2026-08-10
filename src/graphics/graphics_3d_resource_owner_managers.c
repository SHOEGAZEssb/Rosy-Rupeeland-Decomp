#include "tingle/graphics_3d_resource_owner.h"

/*
 * Heap-backed manager-list ownership for the 3D resource owner. Managers form
 * a doubly linked list through their offsets 0x04/0x08 and each manager owns a
 * list of graphics animation instances handled by the adjacent manager unit.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern const char data_020e69fc[];
extern u8 gHeapContext[];

#ifdef __cplusplus
}
#endif

/*
 * Allocate and initialize one 0x28-byte manager, append it to owner's manager
 * list, and increment managerCount. Heap allocation uses tag data_020e69fc,
 * four-byte alignment, and gHeapContext. Retail assumes allocation succeeds:
 * a null result still reaches the link stores and is outside the valid path.
 * Although the recovered C signature is void, retail leaves the new manager in
 * r0 and several callers consume that register as the created-manager result.
 */
#ifndef MATCHING
void Graphics3DResourceOwner_CreateManager(Graphics3DResourceOwner *owner)
{
    GraphicsAnimationInstanceManager *manager =
        (GraphicsAnimationInstanceManager *)Heap_Alloc(
            sizeof(GraphicsAnimationInstanceManager), data_020e69fc, 4,
            gHeapContext);

    if (manager != 0) {
        GraphicsAnimationInstanceManager_Init(manager, owner);
    }
    if (owner->managerHead == 0) {
        owner->managerHead = manager;
    } else {
        owner->managerTail->next = manager;
    }
    manager->previous = owner->managerTail;
    owner->managerTail = manager;
    owner->managerCount++;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void Graphics3DResourceOwner_CreateManager(Graphics3DResourceOwner *owner)
{
    stmdb sp!, {r4, lr}
    /* Load allocation tag data_020e69fc from the trailing literal. */
    DCD 0xE59F1050
    mov r4, r0
    /* Load gHeapContext from the trailing literal. */
    DCD 0xE59F304C
    mov r0, #0x28
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq graphics_3d_owner_manager_append
    mov r1, r4
    bl GraphicsAnimationInstanceManager_Init
graphics_3d_owner_manager_append:
    ldr r1, [r4, #8]
    cmp r1, #0
    streq r0, [r4, #8]
    ldrne r1, [r4, #0xc]
    strne r0, [r1, #8]
    ldr r1, [r4, #0xc]
    str r1, [r0, #4]
    str r0, [r4, #0xc]
    ldr r1, [r4, #0x10]
    add r1, r1, #1
    str r1, [r4, #0x10]
    ldmia sp!, {r4, pc}
graphics_3d_owner_manager_tag:
    DCD data_020e69fc
graphics_3d_owner_manager_heap:
    DCD gHeapContext
}
#endif

/*
 * Ignore null. Otherwise unlink manager from owner's doubly linked list,
 * destroy every contained instance, free the manager, and decrement the owner
 * count. The node's own links are not cleared before destruction.
 */
#ifndef MATCHING
void Graphics3DResourceOwner_RemoveManager(Graphics3DResourceOwner *owner,
                   GraphicsAnimationInstanceManager *manager)
{
    if (manager == 0) {
        return;
    }
    if (manager->previous == 0) {
        owner->managerHead = manager->next;
    } else {
        manager->previous->next = manager->next;
    }
    if (manager->next == 0) {
        owner->managerTail = manager->previous;
    } else {
        manager->next->previous = manager->previous;
    }
    GraphicsAnimationInstanceManager_Clear(manager);
    Heap_Free(manager);
    owner->managerCount--;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void Graphics3DResourceOwner_RemoveManager(Graphics3DResourceOwner *owner,
                       GraphicsAnimationInstanceManager *manager)
{
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #4]
    ldr r0, [r4, #8]
    cmp r1, #0
    strne r0, [r1, #8]
    streq r0, [r5, #8]
    ldr r1, [r4, #8]
    ldr r0, [r4, #4]
    cmp r1, #0
    strne r0, [r1, #4]
    streq r0, [r5, #0xc]
    cmp r4, #0
    beq graphics_3d_owner_manager_removed
    mov r0, r4
    bl GraphicsAnimationInstanceManager_Clear
    mov r0, r4
    bl Heap_Free
graphics_3d_owner_manager_removed:
    ldr r0, [r5, #0x10]
    sub r0, r0, #1
    str r0, [r5, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif

/*
 * Destroy and free every manager from head to tail, caching next before each
 * free, then clear both owner endpoints and managerCount. This bulk teardown
 * does not call the single-manager unlink helper or decrement count per node.
 */
#ifndef MATCHING
void Graphics3DResourceOwner_ClearManagers(Graphics3DResourceOwner *owner)
{
    GraphicsAnimationInstanceManager *manager = owner->managerHead;

    while (manager != 0) {
        GraphicsAnimationInstanceManager *next = manager->next;

        GraphicsAnimationInstanceManager_Clear(manager);
        Heap_Free(manager);
        manager = next;
    }
    owner->managerTail = 0;
    owner->managerHead = 0;
    owner->managerCount = 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void Graphics3DResourceOwner_ClearManagers(Graphics3DResourceOwner *owner)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6, #8]
    b graphics_3d_owner_manager_clear_check
graphics_3d_owner_manager_clear_loop:
    cmp r4, #0
    ldr r5, [r4, #8]
    beq graphics_3d_owner_manager_clear_next
    mov r0, r4
    bl GraphicsAnimationInstanceManager_Clear
    mov r0, r4
    bl Heap_Free
graphics_3d_owner_manager_clear_next:
    mov r4, r5
graphics_3d_owner_manager_clear_check:
    cmp r4, #0
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0x1AFFFFF5
    mov r0, #0
    str r0, [r6, #0xc]
    str r0, [r6, #8]
    str r0, [r6, #0x10]
    ldmia sp!, {r4, r5, r6, pc}
}
#endif
