; Matching retail form; see src/game/tracked_resource_actor_projectile_setup.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_InitSum
.extern ActorRuntimeTriple_Assign
.text
    .global TrackedResourceActorType24_SetupFromRecord
TrackedResourceActorType24_SetupFromRecord:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r4, r0
    str r1, [r4, #0x1fc]
    mov r1, #0x0
    mov r5, r2
    add r0, sp, #0x10
    mov r2, r1
    mov r3, #0x100000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x0
    add r2, sp, #0x10
    mov r1, r5
    bl VecFx32Object_InitSum
    add r1, sp, #0x0
    add r0, r4, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, r4, #0x38
    mov r2, r1
    mov r3, r1
    bl ActorRuntimeTriple_Assign
    ldr r1, [r4, #0xd0]
    mov r0, #0x10000
    orr r1, r1, #0x2000
    str r1, [r4, #0xd0]
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x8
    str r0, [r4, #0x5c]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
    .size TrackedResourceActorType24_SetupFromRecord, . - TrackedResourceActorType24_SetupFromRecord
