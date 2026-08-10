; Matching retail form; see src/game/tracked_resource_actor_timed_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorType26Vtable
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global TrackedResourceActorType26_Init
TrackedResourceActorType26_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r0, .L_02051760
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x0]
    ldmia sp!, {r4, pc}
.L_02051760: .word gTrackedResourceActorType26Vtable
    .size TrackedResourceActorType26_Init, . - TrackedResourceActorType26_Init

    .global TrackedResourceActorType26_DestroyComplete
TrackedResourceActorType26_DestroyComplete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType26_DestroyComplete, . - TrackedResourceActorType26_DestroyComplete

    .global TrackedResourceActorType26_DestroyAndFree
TrackedResourceActorType26_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType26_DestroyAndFree, . - TrackedResourceActorType26_DestroyAndFree
