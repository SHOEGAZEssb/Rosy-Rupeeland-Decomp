.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_state_callbacks.c for documented portable C. */

    .extern func_ov036_021fce5c
    .extern func_ov036_02204ae0
    .extern gSystemState

    .global func_ov036_02204bf8
func_ov036_02204bf8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02204c20
    cmp r1, #0x1
    beq L_02204c3c
    cmp r1, #0x2
    beq L_02204c64
    b L_02204c70
L_02204c20:
    ldr r0, L_02204c80
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    str r0, [r4, #0x4bc]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
L_02204c3c:
    ldr r0, [r4, #0x60]
    bl func_ov036_021fce5c
    cmp r0, #0x0
    beq L_02204c70
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02204c70
L_02204c64:
    bl func_ov036_02204ae0
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02204c70:
    mov r0, r4
    bl func_ov036_02204ae0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02204c80: .word gSystemState
    .size func_ov036_02204bf8, .-func_ov036_02204bf8

