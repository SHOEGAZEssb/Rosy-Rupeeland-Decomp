.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern func_02092314


    .global func_ov025_02202b44
func_ov025_02202b44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02202b60
    cmp r1, #0x1
    b L_02202b80
L_02202b60:
    mov r1, #0xe2
    mov r2, #0x10
    bl func_02092314
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02202b80:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.size func_ov025_02202b44, .-func_ov025_02202b44

