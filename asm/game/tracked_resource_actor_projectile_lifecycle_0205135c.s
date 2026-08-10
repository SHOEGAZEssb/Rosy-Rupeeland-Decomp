; Matching retail form; see src/game/tracked_resource_actor_projectile_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorType24Vtable
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global TrackedResourceActorType24_Init
TrackedResourceActorType24_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02051378
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02051378: .word gTrackedResourceActorType24Vtable
    .size TrackedResourceActorType24_Init, . - TrackedResourceActorType24_Init

    .global TrackedResourceActorType24_DestroyComplete
TrackedResourceActorType24_DestroyComplete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType24_DestroyComplete, . - TrackedResourceActorType24_DestroyComplete

    .global TrackedResourceActorType24_DestroyAndFree
TrackedResourceActorType24_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType24_DestroyAndFree, . - TrackedResourceActorType24_DestroyAndFree
