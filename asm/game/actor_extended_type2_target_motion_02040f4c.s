; Matching retail form; see src/game/actor_extended_type2_target_motion.c.
.text
.extern data_020df9e8
.extern data_020dfad8
.extern data_020dfba0
.extern data_020dfa50
.extern gGamePhaseRuntime
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorExtendedRecordArray_ContainsPoint
.global ActorExtendedType2_UpdateTargetValidationMotion
.type ActorExtendedType2_UpdateTargetValidationMotion, @function
ActorExtendedType2_UpdateTargetValidationMotion: ; 0x02040f4c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r3, [r8, #0xd0]
    mov r7, r1
    orr r3, r3, #0x2
    str r3, [r8, #0xd0]
    ldr r3, [r8, #0x260]
    mov r2, #0x6
    bic r1, r3, #0x1
    str r1, [r8, #0x260]
    strh r2, [r8, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x2
    strneb r0, [r8, #0x24c]
    movne r0, #0x0
    bne .L_0204128c
    ldrh r1, [r7, #0x1a]
    tst r1, #0x2
    beq .L_02040fc4
    ldr r1, .L_02041294
    mov r0, #0x0
    ldr r2, [r1, #0x298]
    ldr r1, [r1, #0x29c]
    str r2, [r8, #0x218]
    str r1, [r8, #0x21c]
    b .L_0204128c
.L_02040fc4:
    ldr r0, [r8, #0x228]
    ldrb r0, [r0, #0x4d]
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02041018
    tst r1, #0x10
    bne .L_02041018
    ldr r1, .L_02041298
    mov r0, r8
    ldr r1, [r1, #0x0]
    ldr r3, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r3, [r3, #0x120]
    mov r2, r7
    blx r3
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_0204128c
.L_02041018:
    mov r0, #0x2
    strb r0, [r8, #0x24c]
    ldr r2, [r8, #0x1c]
    ldr r1, [r8, #0x240]
    ldr r0, [r8, #0x278]
    sub r3, r2, r1
    ldr r2, [r8, #0x20]
    ldr r1, [r8, #0x244]
    cmp r0, #0x0
    sub r1, r2, r1
    mov r6, r3, asr #0xc
    mov r9, r1, asr #0xc
    ldr r5, [r8, #0x228]
    mov r4, #0x0
    beq .L_02041068
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    bl ActorExtendedRecordArray_ContainsPoint
    cmp r0, #0x0
    movne r4, #0x1
.L_02041068:
    ldr r0, [r8, #0x278]
    cmp r0, #0x0
    beq .L_02041094
    cmp r4, #0x0
    bne .L_020410c4
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    b .L_0204128c
.L_02041094:
    mul r0, r9, r9
    mla r1, r6, r6, r0
    ldrsh r0, [r7, #0xc]
    smulbb r0, r0, r0
    cmp r1, r0
    ble .L_020410c4
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    b .L_0204128c
.L_020410c4:
    ldr r0, [r8, #0x228]
    ldr r1, [r0, #0xd0]
    tst r1, #0x100
    bne .L_02041278
    ldr r2, [r8, #0x20]
    ldr r1, [r5, #0x20]
    ldr r3, [r8, #0x1c]
    sub r1, r2, r1
    mov r6, r1, asr #0xc
    mul r1, r6, r6
    ldr r2, [r5, #0x1c]
    cmp r4, #0x0
    sub r2, r3, r2
    mov r5, r2, asr #0xc
    mla r4, r5, r5, r1
    bne .L_02041208
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_020411dc
    ldr r3, .L_02041294
    mov r2, #0x1
    ldr r1, [r0, #0x208]
    ldr ip, [r3, #0xf0]
    mov r3, r2
    mov r9, r2
    cmp r1, ip
    ldr ip, .L_0204129c
    bne .L_02041154
    ldr lr, [r0, #0x20c]
    ldr ip, [ip, #0x4]
    cmp lr, ip
    cmpne r1, #0x0
    moveq r9, #0x0
.L_02041154:
    cmp r9, #0x0
    beq .L_02041194
    ldr r9, .L_02041294
    ldr r1, [r0, #0x208]
    ldr ip, [r9, #0x1b8]
    mov r9, #0x1
    cmp r1, ip
    ldr ip, .L_020412a0
    bne .L_0204118c
    ldr lr, [r0, #0x20c]
    ldr ip, [ip, #0x4]
    cmp lr, ip
    cmpne r1, #0x0
    moveq r9, #0x0
.L_0204118c:
    cmp r9, #0x0
    movne r3, #0x0
.L_02041194:
    cmp r3, #0x0
    bne .L_020411d4
    ldr r1, .L_02041294
    ldr r3, [r0, #0x208]
    ldr r1, [r1, #0x68]
    mov ip, #0x1
    cmp r3, r1
    ldr r9, .L_020412a4
    bne .L_020411cc
    ldr r1, [r0, #0x20c]
    ldr r0, [r9, #0x4]
    cmp r1, r0
    cmpne r3, #0x0
    moveq ip, #0x0
.L_020411cc:
    cmp ip, #0x0
    movne r2, #0x0
.L_020411d4:
    cmp r2, #0x0
    bne .L_02041208
.L_020411dc:
    ldrsh r0, [r7, #0xa]
    add r1, r0, #0x20
    mul r0, r1, r1
    cmp r4, r0
    ble .L_02041208
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    b .L_0204128c
.L_02041208:
    add r0, sp, #0x0
    add r1, r8, #0x18
    bl VecFx32Object_InitCopy
    ldrsh r0, [r7, #0x12]
    smulbb r0, r0, r0
    cmp r4, r0
    bge .L_02041240
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    add r1, r1, r5, lsl #0xc
    add r0, r0, r6, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_02041258
.L_02041240:
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r1, r1, r5, lsl #0xc
    sub r0, r0, r6, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_02041258:
    mov r0, r8
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_02041288
.L_02041278:
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
.L_02041288:
    mov r0, #0x0
.L_0204128c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02041294: .word data_020df9e8
.L_02041298: .word gGamePhaseRuntime
.L_0204129c: .word data_020dfad8
.L_020412a0: .word data_020dfba0
.L_020412a4: .word data_020dfa50
.size ActorExtendedType2_UpdateTargetValidationMotion, . - ActorExtendedType2_UpdateTargetValidationMotion
