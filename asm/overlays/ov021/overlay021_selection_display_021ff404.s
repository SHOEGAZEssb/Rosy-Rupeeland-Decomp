    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */
    .extern data_020f4e14
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_DrawText
    .extern func_02092960

.global func_ov021_021ff404
func_ov021_021ff404:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r2, L_021ff4e8
    mov r5, r0
    mov r4, r1
    ldr r0, [r2, #0x0]
    ldr r1, [r5, #0x64]
    bl GraphicsSpriteRenderer_SetFontResource
    cmp r4, #0x0
    beq L_021ff4b0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0xc]
    and r0, r0, #0xf0000
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    beq L_021ff47c
    mov r0, #0x6
    str r0, [sp, #0x0]
    mov r0, #0xe
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, L_021ff4e8
    ldr r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    ldr r2, L_021ff4ec
    mov r3, #0x72
    bl func_02092960
    b L_021ff4e0
L_021ff47c:
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r1, #0x0
    ldr r0, L_021ff4e8
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x0]
    add r1, r5, #0x2d4
    mov r2, #0x72
    mov r3, #0x6
    bl GraphicsSpriteRenderer_DrawText
    b L_021ff4e0
L_021ff4b0:
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r1, #0x0
    ldr r0, L_021ff4e8
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x0]
    add r1, r5, #0x314
    mov r2, #0x72
    mov r3, #0x6
    bl GraphicsSpriteRenderer_DrawText
L_021ff4e0:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
L_021ff4e8: .word data_020f4e14
L_021ff4ec: .word 0x2710
    .size func_ov021_021ff404, . - func_ov021_021ff404

