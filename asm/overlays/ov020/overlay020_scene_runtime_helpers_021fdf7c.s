    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_runtime_helpers.c. */
    .extern data_020f4e14
    .extern data_ov020_021fe458
    .extern data_ov020_021fe478
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern func_ov020_021fd1cc
    .extern func_ov020_021fd81c
    .extern func_ov020_021fde9c
    .extern func_ov020_021fdee0
    .extern gDebugFont

.global func_ov020_021fdf7c
func_ov020_021fdf7c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    bne L_021fe00c
    ldr r1, [r4, #0x120]
    cmp r1, #0x0
    beq L_021fdff0
    ldr r0, L_021fe014
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fe018
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x1dc]
    bl func_ov020_021fd1cc
    mov r0, r4
    bl func_ov020_021fde9c
    mov r0, r4
    bl func_ov020_021fdee0
    ldr r1, [r4, #0x20]
    mov r0, r4
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, L_021fe01c
    ldmia r1, {r1, r2}
    bl func_ov020_021fd81c
    b L_021fe00c
L_021fdff0:
    ldr r2, [r4, #0x20]
    ldr r1, L_021fe020
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r4, #0x20]
    ldmia r1, {r1, r2}
    bl func_ov020_021fd81c
L_021fe00c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe014: .word data_020f4e14
L_021fe018: .word gDebugFont
L_021fe01c: .word data_ov020_021fe458
L_021fe020: .word data_ov020_021fe478
    .size func_ov020_021fdf7c, . - func_ov020_021fdf7c

