; Matching retail form; see src/game/tracked_resource_actor_variant_lifecycle.c.
.extern Heap_Free
.extern gTrackedResourceActorType22And25Vtable
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.extern TrackedResourceActorType22And25_CleanupSubtype19
.text
    .global TrackedResourceActorType22And25_Init
TrackedResourceActorType22And25_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02050e90
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02050e90: .word gTrackedResourceActorType22And25Vtable
    .size TrackedResourceActorType22And25_Init, . - TrackedResourceActorType22And25_Init

    .global TrackedResourceActorType22And25_DestroyComplete
TrackedResourceActorType22And25_DestroyComplete:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02050eb8
    mov r4, r0
    str r1, [r4, #0x0]
    bl TrackedResourceActorType22And25_CleanupSubtype19
    mov r0, r4
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02050eb8: .word gTrackedResourceActorType22And25Vtable
    .size TrackedResourceActorType22And25_DestroyComplete, . - TrackedResourceActorType22And25_DestroyComplete

    .global TrackedResourceActorType22And25_DestroyAndFree
TrackedResourceActorType22And25_DestroyAndFree:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02050ee8
    mov r4, r0
    str r1, [r4, #0x0]
    bl TrackedResourceActorType22And25_CleanupSubtype19
    mov r0, r4
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02050ee8: .word gTrackedResourceActorType22And25Vtable
    .size TrackedResourceActorType22And25_DestroyAndFree, . - TrackedResourceActorType22And25_DestroyAndFree
