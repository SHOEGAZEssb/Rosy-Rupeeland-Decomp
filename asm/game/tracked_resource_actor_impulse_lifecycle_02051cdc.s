; Matching retail form; see src/game/tracked_resource_actor_impulse_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorImpulseVtable
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global TrackedResourceActorImpulse_InitBase
TrackedResourceActorImpulse_InitBase:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02051cf8
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02051cf8: .word gTrackedResourceActorImpulseVtable
    .size TrackedResourceActorImpulse_InitBase, . - TrackedResourceActorImpulse_InitBase

    .global TrackedResourceActorImpulse_DestroyComplete
TrackedResourceActorImpulse_DestroyComplete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorImpulse_DestroyComplete, . - TrackedResourceActorImpulse_DestroyComplete

    .global TrackedResourceActorImpulse_DestroyAndFree
TrackedResourceActorImpulse_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorImpulse_DestroyAndFree, . - TrackedResourceActorImpulse_DestroyAndFree

    .global TrackedResourceActorImpulse_Destroy
TrackedResourceActorImpulse_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorImpulse_Destroy, . - TrackedResourceActorImpulse_Destroy
