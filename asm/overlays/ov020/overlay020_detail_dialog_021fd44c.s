    .text
/* Exact fallback; see src/overlays/ov020/overlay020_detail_dialog.c. */
    .extern data_020ea650
    .extern data_020f4e18
    .extern data_021f3ecc
    .extern data_ov020_021fe48c
    .extern func_02071ee0
    .extern func_02071f38
    .extern func_02073e48
    .extern func_02073ffc
    .extern func_02074058
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern GraphicsSpriteRenderer_DrawGlyph
    .extern GraphicsSpriteRenderer_DrawText
    .extern func_020791e0
    .extern func_02079f3c
    .extern func_02092960
    .extern func_02092e9c
    .extern func_02093360
    .extern gSystemState

.global func_ov020_021fd44c
func_ov020_021fd44c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r6, r0
    ldr r0, [r6, #0x8]
    mov r4, r1
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r2, [r6, #0x0]
    cmp r2, r4
    beq L_021fd648
    mvn r0, #0x0
    str r0, [r6, #0x0]
    add r0, r6, #0x10
    bl func_02071f38
    ldr r0, [r6, #0xc]
    bl func_02074058
    ldr r1, L_021fd804
    mov r0, #0x18
    mla r8, r4, r0, r1
    str r4, [r6, #0x0]
    ldrh r2, [r8, #0x6]
    ldr r1, L_021fd808
    add r0, r6, #0x10
    str r2, [sp, #0x0]
    ldrh r2, [r8, #0x2]
    ldrh r3, [r8, #0x4]
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r0, [r6, #0xc]
    add r1, r6, #0x10
    mov r2, #0x2
    bl func_02073ffc
    mov r1, #0x2
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x3
    mov r2, #0x30
    mov r3, #0x28
    bl func_02073e48
    ldrsb r2, [r8, #0x9]
    ldrsb r1, [r8, #0xa]
    ldrsb r0, [r8, #0xb]
    str r2, [sp, #0x10]
    str r1, [sp, #0x14]
    str r0, [sp, #0x18]
    mov r5, #0x0
L_021fd508:
    add r0, sp, #0x10
    ldr r1, [r0, r5, lsl #0x2]
    mov r7, r5, lsl #0x4
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    add r4, r5, r5, lsl #0x1
    mov r11, r0, asr #0x3
    mov r9, #0x40
    mov r10, #0x0
    b L_021fd56c
L_021fd530:
    ldr r0, [r6, #0xc]
    mov r2, #0x1
    add r1, r6, #0x1c
    bl func_02073ffc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    add r1, r4, #0x2
    mov r2, r9
    add r3, r7, #0x52
    bl func_02073e48
    add r9, r9, #0x40
    add r10, r10, #0x1
L_021fd56c:
    cmp r10, r11
    blt L_021fd530
    add r2, sp, #0x10
    ldr r0, [r2, r5, lsl #0x2]
    mov r10, #0x0
    sub r1, r0, r11, lsl #0x3
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    str r1, [r2, r5, lsl #0x2]
    mov r11, r0, asr #0x2
    b L_021fd5d4
L_021fd598:
    ldr r0, [r6, #0xc]
    mov r2, #0x1
    add r1, r6, #0x1c
    bl func_02073ffc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    add r1, r4, #0x1
    mov r2, r9
    add r3, r7, #0x52
    bl func_02073e48
    add r9, r9, #0x20
    add r10, r10, #0x1
L_021fd5d4:
    cmp r10, r11
    blt L_021fd598
    add r1, sp, #0x10
    ldr r0, [r1, r5, lsl #0x2]
    mov r10, #0x0
    sub r11, r0, r11, lsl #0x2
    str r11, [r1, r5, lsl #0x2]
    b L_021fd630
L_021fd5f4:
    ldr r0, [r6, #0xc]
    mov r2, #0x1
    add r1, r6, #0x1c
    bl func_02073ffc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, r4
    mov r2, r9
    add r3, r7, #0x52
    bl func_02073e48
    add r9, r9, #0x8
    add r10, r10, #0x1
L_021fd630:
    cmp r10, r11
    blt L_021fd5f4
    add r5, r5, #0x1
    cmp r5, #0x3
    blt L_021fd508
    b L_021fd654
L_021fd648:
    ldr r1, L_021fd804
    mov r0, #0x18
    mla r8, r2, r0, r1
L_021fd654:
    ldr r0, L_021fd80c
    ldr r1, [r6, #0x2c]
    ldrb r0, [r0, #0x5f]
    mov r4, #0x18
    mov r5, #0x8
    cmp r0, #0x0
    ldr r0, [r6, #0x8]
    subne r4, r4, #0x2
    movne r5, #0x4
    bl GraphicsSpriteRenderer_SetFontResource
    ldrh r1, [r8, #0xe]
    ldr r0, L_021fd810
    bl func_020791e0
    mov r1, #0xe
    stmia sp, {r1, r5}
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r6, #0x8]
    mov r3, r4
    mov r2, #0x60
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, [r6, #0x8]
    ldr r1, [r6, #0x30]
    bl GraphicsSpriteRenderer_SetFontResource
    ldrh r1, [r8, #0xc]
    ldr r0, L_021fd810
    bl func_02079f3c
    add r1, r0, #0x2
    mov r0, #0xd
    str r0, [sp, #0x0]
    mov r0, #0x8
    str r0, [sp, #0x4]
    sub r0, r0, #0x9
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x8]
    mov r2, #0x60
    mov r3, #0x28
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, L_021fd80c
    ldrb r4, [r0, #0x5f]
    cmp r4, #0x6
    movge r4, #0x5
    ldr r0, [r6, #0x8]
    ldr r1, [r6, #0x28]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, #0xe
    ldr r1, L_021fd814
    mov r5, #0xa8
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x8]
    mov r2, r5
    add r1, r1, r4, lsl #0x4
    mov r3, #0x3c
    bl GraphicsSpriteRenderer_DrawText
    mov r2, #0x3c
    mov r1, #0xe
    str r2, [sp, #0x0]
    add r5, r0, #0xa8
    str r1, [sp, #0x4]
    sub r0, r1, #0x16
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    ldrsb r1, [r8, #0x8]
    ldr r0, [r6, #0x8]
    mov r2, #0xa
    add r3, r5, #0x6
    bl func_02092960
    mov r0, #0xe
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x8]
    mov r1, #0xf
    add r2, r5, #0x16
    mov r3, #0x3c
    bl GraphicsSpriteRenderer_DrawGlyph
    add r3, r5, #0x1e
    mov r0, #0x3c
    str r0, [sp, #0x0]
    mov r0, #0xe
    str r0, [sp, #0x4]
    sub r0, r0, #0x16
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    ldr r0, [r6, #0x8]
    mov r1, #0x1e
    mov r2, #0xa
    bl func_02092960
    ldr r0, [r6, #0x8]
    ldr r1, [r6, #0x28]
    bl GraphicsSpriteRenderer_SetFontResource
    ldrh r1, [r8, #0x10]
    ldr r0, L_021fd810
    bl func_020791e0
    mov r1, r0
    ldr r0, [r6, #0x4c]
    mov r2, #0x1
    bl func_02092e9c
    ldr r0, [r6, #0x4c]
    mov r1, #0x0
    bl func_02093360
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd804: .word data_020ea650
L_021fd808: .word data_020f4e18
L_021fd80c: .word gSystemState
L_021fd810: .word data_021f3ecc
L_021fd814: .word data_ov020_021fe48c
    .size func_ov020_021fd44c, . - func_ov020_021fd44c
