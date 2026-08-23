.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern func_020ae024
    .extern RuntimePresentationManager_GetGraphics3dPresentation
    .extern Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    .extern func_ov039_02203770
    .extern func_ov039_02204180
    .extern data_020c9670
    .extern data_021052fc
    .global func_ov039_0220431c
func_ov039_0220431c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r1, #0x3
    mov r4, #0x8000
    ldr r5, L_02204540
    mov r10, r0
    sub r9, r1, #0x1
    rsb r4, r4, #0x0
    mvn r7, #0xc7
    mov r6, #0x4
    mov r11, #0x0
L_02204344:
    add r0, r10, r9, lsl #0x2
    ldr r3, [r0, #0x9c]
    ldr r0, [r3, #0x0]
    cmp r0, #0x0
    beq L_02204534
    ldr r0, [r10, #0x48]
    ldr r2, [r3, #0x10]
    ldr r1, [r0, #0x8]
    ldr r0, [r3, #0x14]
    ldr r1, [r1, #0x48]
    ldr r8, L_02204544
    ldr r3, [r1, #0x30]
    ldr r1, [r1, #0x34]
    sub r2, r3, r2
    sub r1, r1, r0
    rsb r0, r2, #0x0
    bl func_020ae024
    add r1, r10, r9, lsl #0x2
    ldr r1, [r1, #0x9c]
    ldr r2, [r1, #0x4]
    cmp r2, #0x28
    ldrgt r2, [r1, #0x8]
    cmpgt r2, #0x0
    ble L_022043f0
    ldr r2, [r1, #0x24]
    sub r3, r0, r2
    cmp r3, r7, lsr #0x11
    subgt r3, r3, #0x10000
    cmp r3, r4
    addlt r3, r3, #0x10000
    cmp r3, #0xc8
    movgt r3, #0xc8
    cmp r3, r7
    ldr r2, [r1, #0x24]
    movlt r3, r7
    add r2, r2, r3
    add r0, r10, r9, lsl #0x2
    str r2, [r1, #0x24]
    ldr r1, [r0, #0x9c]
    ldr r0, [r1, #0x24]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0x24]
L_022043f0:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x9c]
    ldr r2, [r0, #0x4]
    cmp r2, #0x28
    bge L_0220445c
    rsbs r1, r2, #0x14
    movmi r1, #0x0
    mov r0, #0x258
    mla r8, r1, r0, r8
    cmp r2, #0x8
    bge L_0220445c
    tst r2, #0x3
    bne L_0220445c
    ldr r0, L_02204548
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    add r1, r10, r9, lsl #0x2
    ldr r3, [r1, #0x9c]
    mov r1, #0x3
    str r6, [sp, #0x0]
    ldr r2, [r3, #0x10]
    ldr r3, [r3, #0x14]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
L_0220445c:
    add r0, r10, r9, lsl #0x2
    ldr r3, [r0, #0x9c]
    ldr r1, [r3, #0x24]
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r5, r1]
    rsb ip, r1, #0x0
    smull r2, r1, ip, r8
    adds r2, r2, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r3, #0x1c]
    ldr r1, [r0, #0x9c]
    mov ip, #0x0
    ldr r2, [r1, #0x24]
    mov r2, r2, asr #0x4
    add r2, r5, r2, lsl #0x2
    ldrsh r2, [r2, #0x2]
    smull r8, r3, r2, r8
    adds r8, r8, #0x800
    mov r2, ip
    adc r2, r3, r2
    mov r3, r8, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r1, #0x20]
    ldr r1, [r0, #0x9c]
    add r0, r1, #0xc
    add r1, r1, #0x18
    bl func_ov039_02203770
    add r0, r10, r9, lsl #0x2
    ldr r2, [r0, #0x9c]
    ldr r1, [r2, #0x4]
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r2, [r0, #0x9c]
    ldr r1, [r2, #0x8]
    sub r1, r1, #0x1
    str r1, [r2, #0x8]
    ldr r1, [r0, #0x9c]
    ldr r0, [r1, #0x10]
    cmp r0, #0x2bc000
    bgt L_02204524
    cmp r0, #0x144000
    blt L_02204524
    ldr r0, [r1, #0x14]
    cmp r0, #0x280000
    bgt L_02204524
    cmp r0, #0x6e000
    bge L_02204528
L_02204524:
    str r11, [r1, #0x0]
L_02204528:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x9c]
    bl func_ov039_02204180
L_02204534:
    subs r9, r9, #0x1
    bpl L_02204344
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02204540: .word data_020c9670
L_02204544: .word 0x1666
L_02204548: .word data_021052fc
    .size func_ov039_0220431c, .-func_ov039_0220431c

