.text

/* Exact fallback; see src/overlays/ov038/overlay038_selection_update.c for documented portable C. */

    .extern func_020958d8
    .extern InventoryScroll_UpdatePresentation
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern func_ov046_0220c1a4
    .extern func_02091c7c
    .extern func_02091b98
    .extern func_ov038_021fd508
    .extern func_02028100
    .extern func_0202836c
    .extern GraphicsSpriteCanvas_FillRect
    .extern func_0207c460
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_DrawText
    .extern data_020f4e14
    .extern data_020d7a48
    .extern data_ov038_021fdd08

    .global func_ov038_021fd37c
func_ov038_021fd37c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x64
    bl func_020958d8
    ldr r0, [r4, #0x314]
    cmp r0, #0x0
    beq L_021fd39c
    bl InventoryScroll_UpdatePresentation
L_021fd39c:
    ldr r0, [r4, #0x60]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c1a4
    add r0, r4, #0x348
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x348
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0x364]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x364]
    cmp r0, #0x0
    beq L_021fd400
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x344]
    bl func_02028100
    ldmia sp!, {r4, pc}
L_021fd400:
    ldr r0, [r4, #0x344]
    bl func_0202836c
    ldmia sp!, {r4, pc}
    .size func_ov038_021fd37c, .-func_ov038_021fd37c

    .global func_ov038_021fd40c
func_ov038_021fd40c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    ldr r2, L_021fd4f8
    str r1, [sp, #0x4]
    mov r10, r0
    ldr r0, [r2, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r10, #0x110]
    cmp r0, #0x0
    beq L_021fd4f0
    mov r9, #0x0
    ldr r8, L_021fd4fc
    ldr r7, L_021fd500
    mov r6, r9
    mov r5, #0xe
    mov r11, #0x8
    ldr r4, L_021fd4f8
    b L_021fd4e8
L_021fd468:
    ldr r1, [r10, #0x314]
    ldr r0, [r10, #0x110]
    ldr r1, [r1, #0xc]
    add r1, r9, r1
    cmp r1, r0
    bge L_021fd4f0
    add r0, r10, r1, lsl #0x2
    ldr r2, [r0, #0x114]
    mov r1, #0x24
    mla r1, r2, r1, r8
    ldrh r1, [r1, #0x1a]
    add r0, sp, #0xc
    str r7, [sp, #0xc]
    str r6, [sp, #0x10]
    str r6, [sp, #0x14]
    str r6, [sp, #0x18]
    bl func_0207c460
    ldr r0, [r4, #0x0]
    ldr r1, [r10, #0x31c]
    bl GraphicsSpriteRenderer_SetFontResource
    add ip, r9, #0x1
    mov r3, #0x18
    stmia sp, {r5, r11}
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r1, [sp, #0x10]
    mul r3, ip, r3
    ldr r0, [r4, #0x0]
    mov r2, #0x20
    add r1, r1, #0x2c
    bl GraphicsSpriteRenderer_DrawText
    add r9, r9, #0x1
L_021fd4e8:
    cmp r9, #0x5
    blt L_021fd468
L_021fd4f0:
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd4f8: .word data_020f4e14
L_021fd4fc: .word data_020d7a48
L_021fd500: .word data_ov038_021fdd08
    .size func_ov038_021fd40c, .-func_ov038_021fd40c

    .global func_ov038_021fd504
func_ov038_021fd504:
    bx lr
    .size func_ov038_021fd504, .-func_ov038_021fd504
