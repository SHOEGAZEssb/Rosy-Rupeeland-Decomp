    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */
    .extern data_020f4e14
    .extern func_020628c8
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern func_02076148
    .extern GraphicsSpriteCanvas_FillRect

.global func_ov021_021ff504
func_ov021_021ff504:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r2, #0x16
    str r2, [sp, #0x0]
    mov r3, #0x0
    str r3, [sp, #0x4]
    mov r4, r1
    ldr r2, L_021ff5b4
    mov r5, r0
    ldr r0, [r2, #0x0]
    mov r1, #0x10
    mov r2, #0x6
    mov r3, #0xb0
    bl GraphicsSpriteCanvas_FillRect
    cmp r4, #0x0
    ldreq r1, [r5, #0x9c]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    beq L_021ff5ac
    ldr r2, [r5, #0x9c]
    ldr r0, L_021ff5b4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r0, [r0, #0x0]
    ldr r1, [r5, #0x64]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, r4
    bl func_020628c8
    mov r1, #0xe
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    ldr r2, L_021ff5b4
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x10
    mov r3, #0x6
    bl func_02076148
L_021ff5ac:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021ff5b4: .word data_020f4e14
    .size func_ov021_021ff504, . - func_ov021_021ff504

