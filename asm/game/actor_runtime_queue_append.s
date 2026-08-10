; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text
.extern Heap_Alloc
.extern gActorRuntimeOwnedNodeAllocationTag
.extern gHeapContext
.global ActorRuntimeOwnedList_Append
ActorRuntimeOwnedList_Append:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, L_0200b15c
    ldr r3, L_0200b160
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r4}
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r5, #0x8]
    strne r1, [r0, #0x4]
    streq r0, [r5, #0x4]
    str r0, [r5, #0x8]
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
L_0200b15c: .word gActorRuntimeOwnedNodeAllocationTag
L_0200b160: .word gHeapContext
.size ActorRuntimeOwnedList_Append, . - ActorRuntimeOwnedList_Append
