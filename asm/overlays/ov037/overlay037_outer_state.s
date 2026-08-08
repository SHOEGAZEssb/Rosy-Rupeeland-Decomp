.text

/* Exact fallback; see src/overlays/ov037/overlay037_final_state_callbacks.c for documented portable C. */

    .extern func_ov037_021fce48
    .extern func_ov037_021fe81c
    .extern gSystemState

    .global func_ov037_021fe910
func_ov037_021fe910:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fe938
    cmp r1, #0x1
    beq L_021fe954
    cmp r1, #0x2
    beq L_021fe97c
    b L_021fe988
L_021fe938:
    ldr r0, L_021fe998
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    str r0, [r4, #0x4b8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
L_021fe954:
    ldr r0, [r4, #0x5c]
    bl func_ov037_021fce48
    cmp r0, #0x0
    beq L_021fe988
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe988
L_021fe97c:
    bl func_ov037_021fe81c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fe988:
    mov r0, r4
    bl func_ov037_021fe81c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe998: .word gSystemState
    .size func_ov037_021fe910, .-func_ov037_021fe910
