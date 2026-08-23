; Matching retail form; see src/game/tracked_resource_actor_impulse_setup.c.
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32Object_Assign
.extern VecFx32_Subtract
.extern VecFx32Object_ScaleInPlaceRounded
.extern VecFx32Object_DivideInPlaceByScalar
.text
    .global TrackedResourceActorImpulse_SetupFromRecord
TrackedResourceActorImpulse_SetupFromRecord:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r5, r1
    mov r1, r2
    add r0, sp, #0x0
    add r2, r4, #0x18
    str r5, [r4, #0x1fc]
    bl VecFx32_Subtract
    add r1, sp, #0x0
    add r0, r4, #0x38
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [r4, #0x1fc]
    ldr r2, [r4, #0x44]
    ldrsb r1, [r0, #0x15]
    add r0, r4, #0x38
    add r1, r2, r1, lsl #0xc
    str r1, [r4, #0x44]
    bl VecFx32Object_GetMagnitude
    mov r1, r0
    cmp r1, #0x4
    movlt r1, #0x4
    add r0, r4, #0x38
    bl VecFx32Object_DivideInPlaceByScalar
    ldrsh r1, [r5, #0xa]
    add r0, r4, #0x38
    mov r1, r1, lsl #0x4
    bl VecFx32Object_ScaleInPlaceRounded
    mov r1, #0x2800
    str r1, [r4, #0x44]
    ldr r0, [r4, #0x14]
    sub r1, r1, #0x12800
    orr r0, r0, #0x800000
    str r0, [r4, #0x14]
    ldr r2, [r4, #0xd0]
    mov r0, r4
    orr r2, r2, #0x2000
    str r2, [r4, #0xd0]
    ldr r2, [r4, #0x5c]
    and r1, r2, r1
    orr r1, r1, #0x8
    str r1, [r4, #0x5c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd8]
    blx r1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size TrackedResourceActorImpulse_SetupFromRecord, . - TrackedResourceActorImpulse_SetupFromRecord

