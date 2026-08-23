.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern DebugText_BeginFrame
.extern data_ov070_022129cc
.extern GraphicsSpriteState_SetAnimationIndex
.extern Graphics3dPresentation_SetSpriteEffectVertexDepth
.extern Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
.extern func_020adc40
.extern func_020adc90
.extern func_020befec
.extern func_ov041_021fecb0
.extern func_ov070_02210860
.extern func_ov070_022118b4

.global func_ov070_022103d8
func_ov070_022103d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    bl DebugText_BeginFrame
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    mov r0, r5
    bne .L_02210408
    bl func_ov070_02210860
    b .L_0221040c
.L_02210408:
    bl func_ov070_022118b4
.L_0221040c:
    ldr r1, [r5, #0x48]
    ldr r0, [r1, #0x1f4]
    cmp r0, #0x0
    bne .L_0221066c
    ldr r0, [r1, #0x1e0]
    cmp r0, #0x1
    bne .L_02210524
    ldr r0, .L_0221085c
    ldr r6, [r1, #0x1dc]
    add r4, sp, #0xc
    ldmia r0, {r0, r1, r2, r3}
    mov r9, #0x0
    stmia r4, {r0, r1, r2, r3}
    mov r7, r9
.L_02210444:
    add r0, r5, r7, lsl #0x2
    ldr r2, [r0, #0x78]
    mov r0, r6
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r10, [r4, r7, lsl #0x2]
    mov r1, r10
    bl func_020befec
    movs r8, r0
    cmpeq r9, #0x0
    bne .L_0221047c
    cmp r7, #0x3
    bne .L_022104c8
.L_0221047c:
    add r9, r9, #0x1
    add r0, r5, r9, lsl #0x2
    ldr r0, [r0, #0x74]
    add r1, r8, #0xa
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r2, r5, r9, lsl #0x2
    ldr r1, [r2, #0x74]
    mul r0, r8, r10
    ldr r1, [r1, #0xc]
    sub r6, r6, r0
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r2, #0x74]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
.L_022104c8:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_02210444
    ldr r0, [r5, #0x134]
    cmp r0, #0x0
    ldr r0, [r5, #0x74]
    beq .L_022104f4
    ldr r0, [r0, #0xc]
    mov r1, #0x16
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02210500
.L_022104f4:
    ldr r0, [r0, #0xc]
    mov r1, #0x15
    bl GraphicsSpriteState_SetAnimationIndex
.L_02210500:
    ldr r0, [r5, #0x74]
    mov r1, #0x0
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x48]
    str r1, [r0, #0x1e0]
    b .L_022105e0
.L_02210524:
    mov r7, #0x1
    mov r4, #0x14
    mov r6, #0x16
.L_02210530:
    add r0, r5, r7, lsl #0x2
    ldr r1, [r0, #0x74]
    ldrh r0, [r1, #0x42]
    tst r0, #0x4
    bne .L_02210584
    ldr r0, [r1, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02210584
    ldrb r1, [r0, #0x38]
    sub r1, r1, #0xa
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0x74]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02210584:
    ldr r0, [r5, #0x74]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_022105d4
    ldr r1, [r5, #0x134]
    cmp r1, #0x0
    beq .L_022105b8
    mov r1, r6
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_022105c0
.L_022105b8:
    mov r1, r4
    bl GraphicsSpriteState_SetAnimationIndex
.L_022105c0:
    ldr r0, [r5, #0x74]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022105d4:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_02210530
.L_022105e0:
    ldr r1, [r5, #0x48]
    mov r0, #0x10
    ldr r1, [r1, #0x14]
    sub r2, r0, #0x1
    ldr r3, [r1, #0x15c]
    mov r4, #0xc
.L_022105f8:
    add r1, r5, r2, lsl #0x2
    ldr r0, [r1, #0x88]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    bne .L_02210660
    mla r0, r2, r4, r5
    ldr r6, [r0, #0x150]
    add r6, r6, #0x1f
    add r6, r6, #0x100
    str r6, [r0, #0x150]
    ldr r8, [r1, #0x88]
    ldr r6, [r0, #0x14c]
    ldr r7, [r8, #0x30]
    add r6, r7, r6
    str r6, [r8, #0x30]
    ldr r7, [r1, #0x88]
    ldr r0, [r0, #0x150]
    ldr r6, [r7, #0x34]
    add r0, r6, r0
    str r0, [r7, #0x34]
    ldr r1, [r1, #0x88]
    ldr r0, [r1, #0x34]
    cmp r0, r3
    ldrgth r0, [r1, #0x42]
    orrgt r0, r0, #0x4
    strgth r0, [r1, #0x42]
.L_02210660:
    subs r2, r2, #0x1
    bpl .L_022105f8
    b .L_02210690
.L_0221066c:
    mov r2, #0x0
.L_02210670:
    add r0, r5, r2, lsl #0x2
    ldr r1, [r0, #0x74]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x42]
    cmp r2, #0x5
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    blt .L_02210670
.L_02210690:
    mov r0, #0x2
    mov r6, #0xb0000
    sub r4, r0, #0x1
    rsb r6, r6, #0x0
    mvn r7, #0x13
    mov r11, #0x5000
.L_022106a8:
    add r0, r5, r4, lsl #0x2
    ldr r2, [r0, #0xc8]
    ldrh r1, [r2, #0x42]
    tst r1, #0x4
    bne .L_0221084c
    ldr r0, [r5, #0x134]
    cmp r0, #0x0
    orrgt r0, r1, #0x4
    strgth r0, [r2, #0x42]
    bgt .L_0221084c
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    rsb r10, r1, #0xe000
    smull r2, r1, r10, r10
    sub r8, r6, r0
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r1, r1, r0
    mov r0, r2, lsr #0xc
    smull r3, r2, r8, r8
    adds r3, r3, #0x800
    orr r0, r0, r1, lsl #0x14
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    mov r9, r0
    cmp r9, #0x5000
    bge .L_02210744
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0xc8]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r5, #0x48]
    bl func_ov041_021fecb0
    b .L_0221084c
.L_02210744:
    mov r0, r10
    mov r1, r9
    bl func_020adc90
    mov r10, #0x5000
    umull lr, r10, r0, r10
    adds ip, lr, #0x800
    mov lr, ip, lsr #0xc
    mov ip, #0x0
    mov r1, r9
    mla r10, r0, ip, r10
    mov r9, r0, asr #0x1f
    mov r0, #0x5000
    mla r10, r9, r0, r10
    add r2, r5, r4, lsl #0x2
    ldr r3, [r2, #0xc8]
    mov r0, ip
    adc r0, r10, r0
    ldr r2, [r3, #0x30]
    orr lr, lr, r0, lsl #0x14
    add r0, r2, lr
    str r0, [r3, #0x30]
    mov r0, r8
    bl func_020adc90
    umull r10, r9, r0, r11
    adds r8, r10, #0x800
    mov r10, r8, lsr #0xc
    mov r8, #0x0
    add ip, r5, r4, lsl #0x2
    ldr r3, [ip, #0xc8]
    mla r9, r0, r8, r9
    mov lr, r0, asr #0x1f
    mla r9, lr, r11, r9
    mov r0, r8
    adc r0, r9, r0
    ldr r2, [r3, #0x34]
    orr r10, r10, r0, lsl #0x14
    add r0, r2, r10
    str r0, [r3, #0x34]
    ldr r0, [ip, #0xc8]
    ldr r8, [r5, #0x48]
    ldr r9, [r0, #0x30]
    ldr r2, [r0, #0x34]
    ldr r0, [r8, #0x194]
    ldr r3, [r8, #0x190]
    add r10, r2, r0
    ldr r0, [r5, #0x12c]
    mov r1, #0x5
    add r9, r9, r3
    bl func_020befec
    cmp r1, #0x0
    bne .L_0221084c
    mov r0, #0x14
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [r8, #0x18]
    mov r2, r9, asr #0xc
    mov r3, r10, asr #0xc
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
    mov r1, r0
    ldr r0, [r5, #0x48]
    mov r2, r7
    ldr r0, [r0, #0x18]
    bl Graphics3dPresentation_SetSpriteEffectVertexDepth
.L_0221084c:
    subs r4, r4, #0x1
    bpl .L_022106a8
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221085c: .word data_ov070_022129cc
.size func_ov070_022103d8, . - func_ov070_022103d8
