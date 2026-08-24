    .text
    .extern gGamePhaseRuntime
    .extern GamePhaseAreaScene_Update

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_terminal_states.c. */
    .global func_ov013_021feacc

func_ov013_021feacc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x97c]
    cmp r0, #0x0
    beq L_021feaf4
    ldr r0, L_021feb3c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_Update
L_021feaf4:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021feb34
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    beq L_021feb1c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
L_021feb1c:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021feb34:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021feb3c: .word gGamePhaseRuntime
    .size func_ov013_021feacc, . - func_ov013_021feacc
