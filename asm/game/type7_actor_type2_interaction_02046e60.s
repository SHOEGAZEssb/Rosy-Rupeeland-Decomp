; Matching retail form; see src/game/type7_actor_type2_interaction.c.
.text
.extern data_020c9670
.extern data_021052fc
.extern func_02005058
.extern func_020050f0
.extern func_020066a4
.extern func_02008378
.extern func_0201e0ec
.extern ActorDerivedType1_IsTargetStateEligible
.extern func_02038784
.extern func_02047dd8
.extern func_0204b7bc
.extern func_0204cff4
.extern func_020a2894
.extern func_020adae4
.extern func_020ae024
.global func_02046e60
.type func_02046e60, @function
func_02046e60: ; 0x02046e60
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x54
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r11, r3
    add r0, sp, #0x44
    add r1, r7, #0x18
    add r2, r7, #0x28
    add r4, r5, r11
    bl func_020066a4
    add r0, sp, #0x34
    add r1, r6, #0x18
    add r2, r6, #0x28
    bl func_020066a4
    add r0, sp, #0x44
    add r1, sp, #0x34
    bl func_020050f0
    mov r0, r4, lsl #0xc
    mov r1, #0x32
    bl func_020adae4
    smull r2, r1, r0, r0
    adds r2, r2, #0x800
    rsb r9, r0, #0x1000
    mov r3, r0, lsl #0x1
    adc r0, r1, #0x0
    mov r8, r2, lsr #0xc
    orr r8, r8, r0, lsl #0x14
    smull r2, r1, r3, r9
    mov r0, #0x5000
    smull ip, r3, r9, r9
    umull r10, r9, r8, r0
    mov r0, #0x0
    mla r9, r8, r0, r9
    mov lr, r8, asr #0x1f
    mov r0, #0x5000
    adds r8, r10, #0x800
    mla r9, lr, r0, r9
    adc r0, r9, #0x0
    mov r8, r8, lsr #0xc
    adds r9, ip, #0x800
    orr r8, r8, r0, lsl #0x14
    adc r0, r3, #0x0
    mov r3, r9, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    mov r0, r3, asr #0x1f
    mov r9, r0, lsl #0xd
    mov r0, #0x800
    adds r0, r0, r3, lsl #0xd
    orr r9, r9, r3, lsr #0x13
    adc r3, r9, #0x0
    adds r2, r2, #0x800
    mov r0, r0, lsr #0xc
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r1, #0x800
    adds r1, r1, r2, lsl #0xe
    orr r0, r0, r3, lsl #0x14
    mov r3, r1, lsr #0xc
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0xe
    orr r1, r1, r2, lsr #0x12
    adc r1, r1, #0x0
    orr r3, r3, r1, lsl #0x14
    add r0, r0, r3
    add r8, r8, r0
    cmp r8, #0xa000
    movgt r8, #0xa000
    ldr r3, [r6, #0x20]
    ldr r0, [r7, #0x20]
    ldr r2, [r6, #0x1c]
    ldr r1, [r7, #0x1c]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    mov r9, r0
    ldr r0, [sp, #0x48]
    mov r1, #0x2
    bl func_020adae4
    str r0, [sp, #0x48]
    ldr r0, [sp, #0x4c]
    mov r1, #0x2
    bl func_020adae4
    mov r1, r9, asr #0x4
    mov r2, r1, lsl #0x1
    add r1, r2, #0x1
    mov r9, r1, lsl #0x1
    mov r1, r2, lsl #0x1
    str r0, [sp, #0x4c]
    ldr r2, [sp, #0x48]
    ldr r3, .L_020471dc
    add r10, r4, r4, lsl #0x1
    ldrsh r9, [r3, r9]
    ldrsh r3, [r3, r1]
    mov r1, r10
    add r2, r2, r9
    add r9, r0, r3
    smull r3, r0, r2, r8
    smull ip, r2, r9, r8
    adds r3, r3, #0x800
    adc r0, r0, #0x0
    mov r8, r3, lsr #0xc
    orr r8, r8, r0, lsl #0x14
    adds r3, ip, #0x800
    adc r0, r2, #0x0
    mov r9, r3, lsr #0xc
    orr r9, r9, r0, lsl #0x14
    mul r0, r8, r11
    bl func_020adae4
    mov r1, r10
    ldr r2, [r7, #0x8c]
    sub r0, r2, r0
    str r0, [r7, #0x8c]
    mul r0, r9, r11
    bl func_020adae4
    ldr r1, [r7, #0x90]
    sub r0, r1, r0
    str r0, [r7, #0x90]
    ldr r0, [r7, #0x234]
    cmp r0, #0x0
    beq .L_02047068
    ldr r0, [r7, #0x8c]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r7, #0x8c]
    ldr r0, [r7, #0x90]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r7, #0x90]
.L_02047068:
    add r0, r7, #0x8c
    add r1, r7, #0x90
    mov r2, #0x3000
    bl func_0204cff4
    mov r1, #0x0
    str r1, [r7, #0x40]
    str r1, [r7, #0x3c]
    ldr r0, [r6, #0x260]
    tst r0, #0x8000
    movne r1, #0x1
    cmp r1, #0x0
    bne .L_020470e4
    mul r0, r8, r5
    mov r1, r4
    bl func_020adae4
    ldr r2, [r6, #0x8c]
    mov r1, r4
    add r2, r2, r0
    mul r0, r9, r5
    str r2, [r6, #0x8c]
    bl func_020adae4
    ldr r2, [r6, #0x90]
    add r1, r6, #0x90
    add r3, r2, r0
    add r0, r6, #0x8c
    mov r2, #0x6000
    str r3, [r6, #0x90]
    bl func_0204cff4
    mov r0, #0x0
    str r0, [r6, #0x40]
    str r0, [r6, #0x3c]
.L_020470e4:
    add r0, sp, #0x14
    add r1, r6, #0x18
    add r2, r7, #0x18
    bl func_020066a4
    add r0, sp, #0x4
    add r1, sp, #0x14
    mov r2, #0x2000
    bl func_02038784
    add r0, sp, #0x24
    add r2, sp, #0x4
    add r1, r7, #0x18
    bl func_02008378
    add r0, sp, #0x4
    bl func_02005058
    add r0, sp, #0x14
    bl func_02005058
    ldr r0, .L_020471e0
    ldr r1, [sp, #0x30]
    ldr r0, [r0, #0x0]
    ldr r2, [sp, #0x2c]
    rsb r1, r1, #0x18000
    add r0, r0, #0x37c
    add r1, r2, r1
    add r0, r0, #0x2c00
    str r1, [sp, #0x2c]
    bl func_0201e0ec
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r2, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r1, #0x1
    bl func_020a2894
    mov r0, r6
    bl ActorDerivedType1_IsTargetStateEligible
    cmp r0, #0x0
    bne .L_0204718c
    ldrb r0, [r6, #0x24c]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020471bc
.L_0204718c:
    mov r0, r7
    bl func_02047dd8
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x3c
    bge .L_020471b0
    mov r0, r7
    mov r1, #0x1
    bl func_0204b7bc
.L_020471b0:
    add r0, r7, #0x200
    mov r1, #0x5a
    strh r1, [r0, #0x46]
.L_020471bc:
    add r0, sp, #0x24
    bl func_02005058
    add r0, sp, #0x34
    bl func_02005058
    add r0, sp, #0x44
    bl func_02005058
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020471dc: .word data_020c9670
.L_020471e0: .word data_021052fc
.size func_02046e60, . - func_02046e60
