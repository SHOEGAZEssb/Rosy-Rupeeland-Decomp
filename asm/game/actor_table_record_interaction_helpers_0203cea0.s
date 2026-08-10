; Matching retail form; see src/game/actor_table_record_interaction_helpers.c.
.text
.extern data_02105310
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern func_02032a94
.extern ActorTableRecord_ApplyCollisionResponse
.extern func_0204cfa4
.extern func_0204cff4
.extern func_020adc90
    .global ActorTableRecord_ApplySeparationImpulse
    .type ActorTableRecord_ApplySeparationImpulse, @function
ActorTableRecord_ApplySeparationImpulse: ; 0x0203cea0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, r1
    ldr r3, [r4, #0x1c]
    ldr r2, [r5, #0x1c]
    ldr r1, [r4, #0x20]
    ldr r0, [r5, #0x20]
    sub r6, r3, r2
    sub r7, r1, r0
    mov r0, r6
    mov r1, r7
    bl func_0204cfa4
    cmp r0, #0x1000
    bge .L_0203cef4
    ldrsb r1, [r4, #0x48]
    ldrsb r0, [r5, #0x48]
    mov r6, #0x1000
    cmp r1, r0
    rsbge r6, r6, #0x0
    mov r0, #0x0
    b .L_0203cf14
.L_0203cef4:
    mov r5, r0, lsl #0x1
    mov r0, r6
    mov r1, r5
    bl func_020adc90
    mov r6, r0
    mov r0, r7
    mov r1, r5
    bl func_020adc90
.L_0203cf14:
    ldr r2, [r4, #0x8c]
    add r1, r4, #0x90
    add r2, r2, r6
    str r2, [r4, #0x8c]
    ldr r3, [r4, #0x90]
    mov r2, #0x6000
    add r3, r3, r0
    add r0, r4, #0x8c
    str r3, [r4, #0x90]
    bl func_0204cff4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size ActorTableRecord_ApplySeparationImpulse, . - ActorTableRecord_ApplySeparationImpulse

    .global ActorTableRecord_HandlePairActive
    .type ActorTableRecord_HandlePairActive, @function
ActorTableRecord_HandlePairActive: ; 0x0203cf40
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, .L_0203cf88
    mov r5, r1
    mov r4, r2
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0203cf74
    mov r0, r6
    mov r1, r5
    mov r2, #0x1
    mov r3, #0x1000
    bl ActorTableRecord_ApplyCollisionResponse
.L_0203cf74:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02032a94
    ldmia sp!, {r4, r5, r6, pc}
.L_0203cf88: .word data_02105310
    .size ActorTableRecord_HandlePairActive, . - ActorTableRecord_HandlePairActive


