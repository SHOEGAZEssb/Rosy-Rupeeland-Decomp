; Matching retail form; see src/game/tracked_resource_actor_derived_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorType21Vtable
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global TrackedResourceActorType21_InitBase
TrackedResourceActorType21_InitBase:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02050a24
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02050a24: .word gTrackedResourceActorType21Vtable
    .size TrackedResourceActorType21_InitBase, . - TrackedResourceActorType21_InitBase

    .global TrackedResourceActorType21_Init
TrackedResourceActorType21_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02050a44
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02050a44: .word gTrackedResourceActorType21Vtable
    .size TrackedResourceActorType21_Init, . - TrackedResourceActorType21_Init

    .global TrackedResourceActorType21_DestroyComplete
TrackedResourceActorType21_DestroyComplete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType21_DestroyComplete, . - TrackedResourceActorType21_DestroyComplete

    .global TrackedResourceActorType21_DestroyAndFree
TrackedResourceActorType21_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType21_DestroyAndFree, . - TrackedResourceActorType21_DestroyAndFree

    .global TrackedResourceActorType21_Destroy
TrackedResourceActorType21_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType21_Destroy, . - TrackedResourceActorType21_Destroy
