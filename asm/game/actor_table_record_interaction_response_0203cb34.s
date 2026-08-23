; Matching retail form; see src/game/actor_table_record_interaction_response.c.
.text
.extern data_020c9670
.extern data_021052fc
.extern func_02007868
.extern Actor_PlayHorizontalSpatialSound
.extern ActorDerivedType1_StartRecordOrHandleType6D66
.extern ActorTableRecord_ApplySeparationImpulse
.extern Fx32Vector2_Magnitude
.extern func_020adae4
.extern func_020adc90
.extern func_020ae024
    .global ActorTableRecord_ApplyNonDirectionalCollisionResponse
    .type ActorTableRecord_ApplyNonDirectionalCollisionResponse, @function
ActorTableRecord_ApplyNonDirectionalCollisionResponse: ; 0x0203cb34
    ldr ip, .L_0203cb44
    mov r3, r2
    mov r2, #0x0
    bx ip
.L_0203cb44: .word ActorTableRecord_ApplyCollisionResponse
    .size ActorTableRecord_ApplyNonDirectionalCollisionResponse, . - ActorTableRecord_ApplyNonDirectionalCollisionResponse

    .global ActorTableRecord_ApplyCollisionResponse
    .type ActorTableRecord_ApplyCollisionResponse, @function
ActorTableRecord_ApplyCollisionResponse: ; 0x0203cb48
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r5, r1
    ldrb r1, [r5, #0x4d]
    mov r6, r0
    mov r10, r2
    cmp r1, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    mov r4, r3
    cmp r0, #0x0
    bne .L_0203cbcc
    cmp r1, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203cbcc
    cmp r1, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203cbcc
    cmp r1, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrneh r0, [r5, #0x4e]
    cmpne r0, #0x17
    bne .L_0203cbcc
    cmp r1, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0203cbcc:
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r9, r3, r2
    sub r7, r1, r0
    mov r0, r9
    mov r1, r7
    bl Fx32Vector2_Magnitude
    mov r8, r0
    cmp r8, #0x1000
    bge .L_0203cc18
    ldrsb r1, [r5, #0x48]
    ldrsb r0, [r6, #0x48]
    mov r9, #0x1000
    mov r7, #0x0
    cmp r1, r0
    rsbge r9, r9, #0x0
    mov r8, #0x1000
.L_0203cc18:
    cmp r10, #0x0
    beq .L_0203cc60
    mov r0, r7
    mov r1, r9
    bl func_020ae024
    add r0, r0, #0x1000
    and r0, r0, #0xe000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r1, .L_0203ce98
    mov r2, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r9, [r1, r2]
    ldrsh r7, [r1, r0]
    b .L_0203cc80
.L_0203cc60:
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    mov r9, r0
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    mov r7, r0
.L_0203cc80:
    ldr r0, [r6, #0xd0]
    tst r0, #0x10
    beq .L_0203ccac
    mov r0, r9
    mov r1, #0x2
    bl func_020adae4
    mov r9, r0
    mov r0, r7
    mov r1, #0x2
    bl func_020adae4
    mov r7, r0
.L_0203ccac:
    cmp r4, #0x1000
    beq .L_0203ccdc
    smull r0, r2, r9, r4
    adds r3, r0, #0x800
    smull r1, r0, r7, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r9, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r7, r1, lsr #0xc
    orr r9, r9, r2, lsl #0x14
    orr r7, r7, r0, lsl #0x14
.L_0203ccdc:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_0203cd18
    ldr r0, [r5, #0x20c]
    mov r1, #0x4
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x10
    bl func_020adae4
    add r1, r6, #0x200
    ldrh r2, [r1, #0xa]
    add r0, r2, r0
    strh r0, [r1, #0xa]
.L_0203cd18:
    ldr r1, [r5, #0x9c]
    mov r0, r9
    add r1, r1, r9
    str r1, [r5, #0x9c]
    ldr r1, [r5, #0xa0]
    add r1, r1, r7
    str r1, [r5, #0xa0]
    ldr r1, [r6, #0x20c]
    mov r1, r1, lsl #0x13
    mov r4, r1, lsr #0x13
    mov r1, r4
    bl func_020adae4
    ldr r2, [r6, #0x8c]
    mov r1, r4
    sub r2, r2, r0
    mov r0, r7
    str r2, [r6, #0x8c]
    bl func_020adae4
    ldr r1, [r6, #0x90]
    rsbs r2, r4, #0x1e
    sub r0, r1, r0
    str r0, [r6, #0x90]
    movmi r2, #0x0
    strb r2, [r6, #0x210]
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r1, [r6, #0x214]
    mvnne r0, #0x0
    ldrnesh r1, [r1, #0x2]
    cmpne r1, r0
    beq .L_0203cdcc
    mov r0, r5
    bl func_02007868
    cmp r0, #0x0
    beq .L_0203cdcc
    ldr r0, .L_0203ce9c
    ldr r1, [r6, #0x214]
    ldr r0, [r0, #0x0]
    ldrsh r1, [r1, #0x2]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_StartRecordOrHandleType6D66
.L_0203cdcc:
    ldrb r0, [r6, #0x211]
    cmp r0, #0x0
    bne .L_0203cdf4
    ldr r0, [r6, #0x214]
    ldrh r1, [r0, #0xa]
    cmp r1, #0x0
    beq .L_0203cdf4
    mov r0, r6
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
.L_0203cdf4:
    ldr r0, [r6, #0x214]
    ldrb r0, [r0, #0xc]
    strb r0, [r6, #0x211]
    ldr r0, [r6, #0x20c]
    mov r0, r0, lsl #0x11
    movs r0, r0, asr #0x1f
    beq .L_0203ce28
    ldr r1, .L_0203ce9c
    mov r0, r6
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    bl ActorTableRecord_ApplySeparationImpulse
.L_0203ce28:
    ldr r0, [r6, #0x20c]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x1f
    ldrne r0, .L_0203ce9c
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r1, [r0, #0xea8]
    cmpne r1, #0x0
    beq .L_0203ce54
    mov r0, r6
    bl ActorTableRecord_ApplySeparationImpulse
.L_0203ce54:
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r6, #0x20c]
    orrne r0, r0, #0x4000
    strne r0, [r6, #0x20c]
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r6, #0x20c]
    orrne r0, r0, #0x8000
    strne r0, [r6, #0x20c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0203ce98: .word data_020c9670
.L_0203ce9c: .word data_021052fc
    .size ActorTableRecord_ApplyCollisionResponse, . - ActorTableRecord_ApplyCollisionResponse


