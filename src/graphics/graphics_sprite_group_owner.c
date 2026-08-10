#include "tingle/graphics_sprite_group.h"

/*
 * Owner-level allocation and destruction of sprite groups. Each group is heap
 * allocated and linked into a doubly linked list embedded in the still-opaque
 * renderer owner at offsets 0x43c-0x444.
 */

typedef struct GraphicsSpriteGroupOwner {
    u8 padding_000[0x43c];
    GraphicsSpriteGroup *groupHead;
    GraphicsSpriteGroup *groupTail;
    u32 groupCount;
} GraphicsSpriteGroupOwner;

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern char data_020e69e4[];
extern u8 gHeapContext[];

#ifdef __cplusplus
}
#endif

/*
 * Allocate and initialize a group owned by owner, append it to the owner's
 * group list, increment groupCount, and return it. Retail code assumes the
 * allocation succeeds and dereferences a null result; callers share that
 * precondition. Heap state and owner list state change, with no SDK access.
 */
#ifndef MATCHING
GraphicsSpriteGroup *GraphicsSpriteGroupOwner_CreateGroup(void *ownerPointer)
{
    GraphicsSpriteGroupOwner *owner =
        (GraphicsSpriteGroupOwner *)ownerPointer;
    GraphicsSpriteGroup *group = (GraphicsSpriteGroup *)Heap_Alloc(
        sizeof(GraphicsSpriteGroup), data_020e69e4, 4, gHeapContext);

    if (group != 0) {
        GraphicsSpriteGroup_Init(group, owner);
    }
    if (owner->groupHead == 0) {
        owner->groupHead = group;
    } else {
        owner->groupTail->next = group;
    }
    group->previous = owner->groupTail;
    owner->groupTail = group;
    owner->groupCount++;
    return group;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteGroup *GraphicsSpriteGroupOwner_CreateGroup(void *owner)
{
    stmdb sp!, {r4, lr}
    ldr r1, =data_020e69e4
    mov r4, r0
    ldr r3, =gHeapContext
    mov r0, #0x24
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq sprite_group_alloc_append
    mov r1, r4
    bl GraphicsSpriteGroup_Init
sprite_group_alloc_append:
    ldr r1, [r4, #0x43c]
    cmp r1, #0
    streq r0, [r4, #0x43c]
    ldrne r1, [r4, #0x440]
    strne r0, [r1, #8]
    ldr r1, [r4, #0x440]
    str r1, [r0, #4]
    str r0, [r4, #0x440]
    ldr r1, [r4, #0x444]
    add r1, r1, #1
    str r1, [r4, #0x444]
    ldmia sp!, {r4, pc}
}
#endif

/*
 * Unlink group from owner, release all states held by the group, free it, and
 * decrement groupCount. Null is ignored. The retail membership scan has no
 * observable result; valid callers must pass a group belonging to owner.
 */
#ifndef MATCHING
void GraphicsSpriteGroupOwner_DestroyGroup(void *ownerPointer,
                                           GraphicsSpriteGroup *group)
{
    GraphicsSpriteGroupOwner *owner =
        (GraphicsSpriteGroupOwner *)ownerPointer;

    if (group == 0) {
        return;
    }
    if (group->previous != 0) {
        group->previous->next = group->next;
    } else {
        owner->groupHead = group->next;
    }
    if (group->next != 0) {
        group->next->previous = group->previous;
    } else {
        owner->groupTail = group->previous;
    }
    GraphicsSpriteGroup_Clear(group);
    Heap_Free(group);
    owner->groupCount--;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteGroupOwner_DestroyGroup(void *owner,
                                               GraphicsSpriteGroup *group)
{
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x43c]
    b sprite_group_owner_check
sprite_group_owner_find:
    cmp r0, r4
    beq sprite_group_owner_found
    ldr r0, [r0, #8]
sprite_group_owner_check:
    cmp r0, #0
    DCD 0x1AFFFFFA
sprite_group_owner_found:
    ldr r1, [r4, #4]
    ldr r0, [r4, #8]
    cmp r1, #0
    strne r0, [r1, #8]
    streq r0, [r5, #0x43c]
    ldr r1, [r4, #8]
    ldr r0, [r4, #4]
    cmp r1, #0
    strne r0, [r1, #4]
    streq r0, [r5, #0x440]
    cmp r4, #0
    beq sprite_group_owner_count
    mov r0, r4
    bl GraphicsSpriteGroup_Clear
    mov r0, r4
    bl Heap_Free
sprite_group_owner_count:
    ldr r0, [r5, #0x444]
    sub r0, r0, #1
    str r0, [r5, #0x444]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif
