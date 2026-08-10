; Matching retail form; see src/game/actor_extended_type2_target_motion.c.
.text
.extern data_020c9670
.extern data_020e0f28
.extern data_021052fc
.extern func_02005058
.extern func_020050a4
.extern VecFx32_Subtract
.extern func_02007f0c
.extern func_0204cfa4
.extern func_020adae4
.extern func_020ae024
    .global ActorExtendedType2_UpdateTargetMotion
    .type ActorExtendedType2_UpdateTargetMotion, @function
ActorExtendedType2_UpdateTargetMotion: ; 0x0203f5c4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x40
    mov r6, r0
    add r0, r6, #0x78
    bl func_020050a4
    add r0, sp, #0x30
    add r1, r6, #0x78
    add r2, r6, #0x18
    bl VecFx32_Subtract
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    bl func_0204cfa4
    mov r5, r0
    cmp r5, #0x2000
    ble .L_0203f7c8
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r6, #0xd0]
    tst r0, #0x2
    beq .L_0203f688
    add r0, r6, #0x200
    ldrh r2, [r0, #0x56]
    ldr r1, .L_0203f848
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    mov r4, r2, asr #0x2
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldrnesh r3, [sp, #0x4]
    ldrh r2, [sp, #0x6]
    ldr r1, .L_0203f84c
    ldreqsh r3, [sp, #0x2]
    mov r0, #0x3c
    add r2, r3, r2, lsl #0x4
    mla r0, r2, r0, r1
    mov r1, r4, lsl #0x1
    ldrh r0, [r1, r0]
    cmp r5, r0, lsl #0x4
    mov r0, r0, lsl #0x4
    movge r5, r0
    b .L_0203f690
.L_0203f688:
    ldrsh r0, [sp, #0x0]
    mov r5, r0, lsl #0x4
.L_0203f690:
    mov r0, #0x100
    strh r0, [r6, #0xde]
    cmp r5, #0x0
    ble .L_0203f7bc
    ldr r0, [sp, #0x38]
    ldr r1, [sp, #0x34]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_0203f850
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r1, [r1, r0]
    ldr r0, [r6, #0x14]
    mul r2, r5, r2
    mul r1, r5, r1
    mov lr, r2, asr #0xc
    tst r0, #0x40
    mov r2, r1, asr #0xc
    streq lr, [r6, #0x3c]
    streq r2, [r6, #0x40]
    beq .L_0203f7a0
    ldr r3, .L_0203f854
    mov r4, #0x0
    umull r5, r9, lr, r3
    adds ip, r5, #0x800
    mla r9, lr, r4, r9
    mov r5, lr, asr #0x1f
    mla r9, r5, r3, r9
    ldr r7, [r6, #0x8c]
    rsb r0, r3, #0x1000
    umull r1, r8, r7, r0
    adc r9, r9, #0x0
    adds r5, r1, #0x800
    mov r1, ip, lsr #0xc
    orr r1, r1, r9, lsl #0x14
    mov r9, r5, lsr #0xc
    umull ip, lr, r2, r3
    mla r8, r7, r4, r8
    mov r5, r7, asr #0x1f
    mla r8, r5, r0, r8
    adc r0, r8, #0x0
    orr r9, r9, r0, lsl #0x14
    add r0, r9, r1
    str r0, [r6, #0x8c]
    adds r0, ip, #0x800
    mla lr, r2, r4, lr
    mov ip, r2, asr #0x1f
    mla lr, ip, r3, lr
    ldr r5, [r6, #0x90]
    mov r0, r0, lsr #0xc
    adc r2, lr, #0x0
    orr r0, r0, r2, lsl #0x14
    rsb r2, r3, #0x1000
    umull lr, ip, r5, r2
    mla ip, r5, r4, ip
    mov r3, r5, asr #0x1f
    mla ip, r3, r2, ip
    adds r3, lr, #0x800
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r3, r0
    str r2, [r6, #0x90]
    str r1, [r6, #0x3c]
    str r0, [r6, #0x40]
.L_0203f7a0:
    ldr r0, [r6, #0xd0]
    tst r0, #0x2
    movne r0, #0x6
    strneh r0, [r6, #0xd6]
    moveq r0, #0x5
    streqh r0, [r6, #0xd6]
    b .L_0203f808
.L_0203f7bc:
    mov r0, #0x2
    strh r0, [r6, #0xd6]
    b .L_0203f808
.L_0203f7c8:
    ldrsh r0, [r6, #0xd8]
    cmp r0, #0x6
    bne .L_0203f7f4
    ldr r0, [r6, #0x3c]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x40]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r6, #0x90]
.L_0203f7f4:
    mov r0, #0x0
    str r0, [r6, #0x40]
    str r0, [r6, #0x3c]
    mov r0, #0x1
    strh r0, [r6, #0xd6]
.L_0203f808:
    ldr r0, [r6, #0xd0]
    tst r0, #0x4
    beq .L_0203f838
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x94]
    strne r0, [r6, #0x90]
    strne r0, [r6, #0x8c]
.L_0203f838:
    add r0, sp, #0x30
    bl func_02005058
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0203f848: .word data_021052fc
.L_0203f84c: .word data_020e0f28
.L_0203f850: .word data_020c9670
.L_0203f854: .word 0x19a
    .size ActorExtendedType2_UpdateTargetMotion, . - ActorExtendedType2_UpdateTargetMotion

