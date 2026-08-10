; Matching retail form; see src/game/actor_extended_type2_contact_response.c.
.text
.extern func_02032a94
.extern func_020349b8
.extern ActorExtendedType2_SpawnOptionalPresentation
.extern func_0204cfa4
.extern func_020adae4
.extern func_020adc90
.global ActorExtendedType2_TriggerContactFeedback
.type ActorExtendedType2_TriggerContactFeedback, @function
ActorExtendedType2_TriggerContactFeedback: ; 0x0204330c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r3, r4, #0x200
    mov r2, #0x0
    mov r1, #0x57
    strh r2, [r3, #0x80]
    bl func_020349b8
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x100
    mov r3, #0x14
    bl ActorExtendedType2_SpawnOptionalPresentation
    ldmia sp!, {r4, pc}
.size ActorExtendedType2_TriggerContactFeedback, . - ActorExtendedType2_TriggerContactFeedback

.global ActorExtendedType2_ApplyContactResponse
.type ActorExtendedType2_ApplyContactResponse, @function
ActorExtendedType2_ApplyContactResponse: ; 0x02043340
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r1
    ldrb r1, [r7, #0x4d]
    mov r8, r0
    mov r6, r2
    cmp r1, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02043438
    ldr r0, [r8, #0x14]
    tst r0, #0x10
    bne .L_02043438
    ldr r0, [r7, #0x14]
    tst r0, #0x10
    bne .L_02043438
    ldr r3, [r7, #0x1c]
    ldr r2, [r8, #0x1c]
    ldr r1, [r7, #0x20]
    ldr r0, [r8, #0x20]
    sub r4, r3, r2
    sub r9, r1, r0
    mov r0, r4
    mov r1, r9
    bl func_0204cfa4
    mov r5, r0
    cmp r5, #0x1000
    ble .L_02043418
    mov r0, r4
    mov r1, r5
    bl func_020adc90
    mov r4, r0
    mov r0, r9
    mov r1, r5
    bl func_020adc90
    ldr r1, [r8, #0xd0]
    mov r5, r0
    tst r1, #0x10
    beq .L_020433fc
    mov r0, r4
    mov r1, #0x2
    bl func_020adae4
    mov r4, r0
    mov r0, r5
    mov r1, #0x2
    bl func_020adae4
    mov r5, r0
.L_020433fc:
    ldr r0, [r8, #0x9c]
    sub r0, r0, r4
    str r0, [r8, #0x9c]
    ldr r0, [r8, #0xa0]
    sub r0, r0, r5
    str r0, [r8, #0xa0]
    b .L_02043438
.L_02043418:
    ldrsb r1, [r8, #0x48]
    ldrsb r0, [r7, #0x48]
    cmp r1, r0
    mov r1, #0x1000
    ldr r0, [r8, #0x9c]
    rsblt r1, r1, #0x0
    add r0, r0, r1
    str r0, [r8, #0x9c]
.L_02043438:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_02032a94
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size ActorExtendedType2_ApplyContactResponse, . - ActorExtendedType2_ApplyContactResponse
