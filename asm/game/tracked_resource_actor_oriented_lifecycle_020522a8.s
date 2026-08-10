; Matching retail form; see src/game/tracked_resource_actor_oriented_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorType28Vtable
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global TrackedResourceActorType28_InitBase
TrackedResourceActorType28_InitBase:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_020522c4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_020522c4: .word gTrackedResourceActorType28Vtable
    .size TrackedResourceActorType28_InitBase, . - TrackedResourceActorType28_InitBase

    .global TrackedResourceActorType28_Init
TrackedResourceActorType28_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_020522e4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_020522e4: .word gTrackedResourceActorType28Vtable
    .size TrackedResourceActorType28_Init, . - TrackedResourceActorType28_Init

    .global TrackedResourceActorType28_DestroyComplete
TrackedResourceActorType28_DestroyComplete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType28_DestroyComplete, . - TrackedResourceActorType28_DestroyComplete

    .global TrackedResourceActorType28_DestroyAndFree
TrackedResourceActorType28_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType28_DestroyAndFree, . - TrackedResourceActorType28_DestroyAndFree

    .global TrackedResourceActorType28_Destroy
TrackedResourceActorType28_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType28_Destroy, . - TrackedResourceActorType28_Destroy
