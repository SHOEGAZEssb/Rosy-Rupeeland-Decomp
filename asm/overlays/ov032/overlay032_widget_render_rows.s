.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern data_020f4e14
.extern data_021f6288
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GraphicsSpriteRenderer_DrawText
.extern RetailSelectionHistory_GetText

    .global func_ov032_02201ea4
func_ov032_02201ea4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    ldr r1, L_02201f50
    mov r10, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r8, #0x0
    ldr r7, L_02201f54
    mov r6, #0x8
    mov r5, r8
    ldr r4, L_02201f50
    mov r11, #0x18
    b L_02201f40
L_02201ed8:
    ldr r1, [r10, #0x4c]
    ldr r0, [r10, #0xc]
    ldr r1, [r1, #0xc]
    add r0, r0, #0x1
    add r1, r8, r1
    cmp r1, r0
    bge L_02201f48
    add r0, r7, r1, lsl #0x3
    ldrh r1, [r0, #0x2]
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    movne r9, #0x3
    moveq r9, #0x1
    bl RetailSelectionHistory_GetText
    mul r3, r8, r11
    str r9, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    mov r1, r0
    ldr r0, [r4, #0x0]
    mov r2, #0x28
    add r3, r3, #0x1c
    bl GraphicsSpriteRenderer_DrawText
    add r8, r8, #0x1
L_02201f40:
    cmp r8, #0x5
    blt L_02201ed8
L_02201f48:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02201f50: .word data_020f4e14
L_02201f54: .word data_021f6288
.size func_ov032_02201ea4, .-func_ov032_02201ea4

