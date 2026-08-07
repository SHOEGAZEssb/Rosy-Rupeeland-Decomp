.text

/* Exact fallback; see src/overlays/ov024/overlay024_state_callbacks.c. */
.extern data_ov024_021fe2f0
.extern func_02093af8
.extern func_ov024_021fce04
.extern func_ov024_021fd86c
.extern func_ov024_021fd8f8
.extern func_ov024_021fdac4


    .global func_ov024_021fe040
func_ov024_021fe040:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fe060
    cmp r0, #0x1
    beq L_021fe070
    b L_021fe0a8
L_021fe060:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fe070:
    mov r0, r4
    bl func_ov024_021fdac4
    cmp r0, #0x0
    beq L_021fe0a8
    ldr r1, [r4, #0x2f4]
    mov r0, r4
    bl func_ov024_021fd8f8
    ldr r1, [r4, #0x2f4]
    add r0, r4, #0x284
    bl func_02093af8
    ldr r1, L_021fe0b8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov024_021fce04
L_021fe0a8:
    mov r0, r4
    bl func_ov024_021fd86c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe0b8: .word data_ov024_021fe2f0
.size func_ov024_021fe040, .-func_ov024_021fe040

