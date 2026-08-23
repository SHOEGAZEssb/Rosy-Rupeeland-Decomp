/*
 * Recovered sprite-group ownership boundary. Groups are renderer-heap objects
 * linked through the confirmed owner fields at offsets 0x43c through 0x444.
 */
#include "tingle/graphics_sprite_group.h"
#include "tingle/heap.h"

extern const char data_020e69e4[];

/* Allocates and initializes a group, appends it to the owner's list, updates
 * the list count, and returns the new group (or null on allocation failure). */
#ifndef MATCHING
GraphicsSpriteGroup *GraphicsSpriteGroupOwner_CreateGroup(void *owner)
{
    u8 *owner_bytes = (u8 *)owner;
    GraphicsSpriteGroup *group = (GraphicsSpriteGroup *)Heap_Alloc(
        sizeof(*group), data_020e69e4, 4, &gHeapContext);
    GraphicsSpriteGroup *tail;

    if (group == 0) {
        return 0;
    }
    GraphicsSpriteGroup_Init(group, owner);
    tail = *(GraphicsSpriteGroup **)(owner_bytes + 0x440);
    if (*(GraphicsSpriteGroup **)(owner_bytes + 0x43c) == 0) {
        *(GraphicsSpriteGroup **)(owner_bytes + 0x43c) = group;
    } else {
        tail->next = group;
    }
    group->previous = tail;
    *(GraphicsSpriteGroup **)(owner_bytes + 0x440) = group;
    ++*(u32 *)(owner_bytes + 0x444);
    return group;
}

/* Unlinks and clears a non-null group, frees it through the game heap, and
 * decrements the owning renderer's group count. */
void GraphicsSpriteGroupOwner_DestroyGroup(void *owner,
                                           GraphicsSpriteGroup *group)
{
    u8 *owner_bytes = (u8 *)owner;

    if (group == 0) {
        return;
    }
    if (group->previous != 0) {
        group->previous->next = group->next;
    } else {
        *(GraphicsSpriteGroup **)(owner_bytes + 0x43c) = group->next;
    }
    if (group->next != 0) {
        group->next->previous = group->previous;
    } else {
        *(GraphicsSpriteGroup **)(owner_bytes + 0x440) = group->previous;
    }
    GraphicsSpriteGroup_Clear(group);
    Heap_Free(group);
    --*(u32 *)(owner_bytes + 0x444);
}
#else
/* Matching fallbacks implement the two documented portable routines above. */
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
    bne sprite_group_owner_find
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

/* Retail-address wrapper that creates and returns one owner-linked group. */
#ifndef MATCHING
GraphicsSpriteGroup *GraphicsSpriteGroupOwner_CreateGroupWrapper(void *owner)
{
    return GraphicsSpriteGroupOwner_CreateGroup(owner);
}

/* Creates a state from a three-resource source and returns the resulting
 * state; attach is narrowed to the retail byte-sized flag. */
void *GraphicsSpriteGroup_CreateStateFromSourceWrapper(GraphicsSpriteGroup *group,
                   const GraphicsSpriteSource3 *source, s32 attach)
{
    return GraphicsSpriteGroup_CreateStateFromSource(group, source,
                                                      (u8)attach);
}

/* Releases the group's indexed entries without destroying the group. */
void GraphicsSpriteGroup_ClearStates(GraphicsSpriteGroup *group)
{
    GraphicsSpriteGroup_ReleaseIndexedEntries(group);
}

/* Destroys a group through its stored owner; a null argument is ignored. */
void GraphicsSpriteGroup_DestroyWrapper(GraphicsSpriteGroup *group)
{
    if (group != 0) {
        GraphicsSpriteGroupOwner_DestroyGroup(group->owner, group);
    }
}

/* Retail 0x02073EF8 unlinks one state from its containing group and returns it
 * to the renderer's fixed pool; the group itself remains owned by its owner. */
void GraphicsSpriteState_ReleaseFromGroupWrapper(GraphicsSpriteState *state)
{
    if (state != 0) {
        GraphicsSpriteState_ReleaseFromGroup(state);
    }
}
#endif
