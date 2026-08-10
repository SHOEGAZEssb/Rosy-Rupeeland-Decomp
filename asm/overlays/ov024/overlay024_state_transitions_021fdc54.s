.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_transitions.c. */
.extern data_020f4e14
.extern data_ov024_021fe300
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_ov024_021fce04
.extern func_ov024_021fdab0


    .global func_ov024_021fdc54
func_ov024_021fdc54:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fdc74
    cmp r0, #0x1
    beq L_021fdc94
    b L_021fdccc
L_021fdc74:
    ldr r0, L_021fdcd4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fdc94:
    ldr r0, [r4, #0x20]
    mov r2, #0xc
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    ldr r1, [r4, #0x60]
    mov r0, r4
    add r3, r1, #0x1
    mul r2, r3, r2
    bl func_ov024_021fdab0
    ldr r1, L_021fdcd8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
L_021fdccc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdcd4: .word data_020f4e14
L_021fdcd8: .word data_ov024_021fe300
.size func_ov024_021fdc54, .-func_ov024_021fdc54

