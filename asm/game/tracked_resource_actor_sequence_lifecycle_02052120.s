; Matching retail form; see src/game/tracked_resource_actor_sequence_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorType27Vtable
.extern TrackedResourceActor_Destroy
.extern TrackedResourceActorImpulse_InitBase
.text
    .global TrackedResourceActorType27_Init
TrackedResourceActorType27_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorImpulse_InitBase
    ldr r1, .L_0205213c
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0205213c: .word gTrackedResourceActorType27Vtable
    .size TrackedResourceActorType27_Init, . - TrackedResourceActorType27_Init

    .global TrackedResourceActorType27_DestroyComplete
TrackedResourceActorType27_DestroyComplete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType27_DestroyComplete, . - TrackedResourceActorType27_DestroyComplete

    .global TrackedResourceActorType27_DestroyAndFree
TrackedResourceActorType27_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType27_DestroyAndFree, . - TrackedResourceActorType27_DestroyAndFree
