.text

/* Exact fallback; see src/overlays/ov037/overlay037_final_state_callbacks.c for documented portable C. */

    .extern func_ov037_021fe4d4
    .extern data_ov037_021fec88

    .global func_ov037_021fe8bc
func_ov037_021fe8bc:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    beq L_021fe8d8
    cmp r1, #0x1
    beq L_021fe8e8
    b L_021fe904
L_021fe8d8:
    add r1, r1, #0x1
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x8]
L_021fe8e8:
    ldr r2, [r0, #0x20]
    ldr r1, L_021fe90c
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r0, #0x20]
    ldmia r1, {r1, r2}
    bl func_ov037_021fe4d4
L_021fe904:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fe90c: .word data_ov037_021fec88
    .size func_ov037_021fe8bc, .-func_ov037_021fe8bc
